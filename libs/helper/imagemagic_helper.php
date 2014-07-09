<?

class ImageMagic_Helper
{
  private $_source;
  private $_dest;

  private $_image;
  private $_width;
  private $_height;

  private $_errors = array();

  public function __construct($source,$dest)
  {
     $this->_source = $source;
     $this->_dest = $dest;
  }

  /****************************************************************************
  *      Function:   cropImage(int $size)
  *   Description:   Create a thumbnail by cropping any valid image into any
  *                  size.
  * Return Values:   Returns true if cropping is successful. Otherwise, returns
  *                  false (error occurred and logged).
  *****************************************************************************/
  public function cropImage($thumb_size = 60)
  {
   try
   {
      //Verify the source image is valid
      if(!$this->_isImageValid())
        throw new Exception('Invalid Image');

      //Load new copy of image
      if(!$this->_loadImage())
        throw new Exception('Image Could Not Be Loaded');

      //Calculate measurements
      if($this->_width > $this->_height)
       {
          // For landscape images
          $x_offset = ($this->_width - $this->_height) / 2;
          $y_offset = 0;
          $square_size = $this->_width - ($x_offset * 2);
       }
       else
       {
          // For portrait and square images
          $x_offset = 0;
          $y_offset = ($this->_height - $this->_width) / 2;
          $square_size = $this->_height - ($y_offset * 2);
       }

      //Crop Image
      $canvas = imagecreatetruecolor($thumb_size, $thumb_size);
      imagealphablending($canvas,false); //意思是不合并颜色,直接用$img图像颜色替换,包括透明色
      imagesavealpha($canvas,true);      //意思是不要丢了$thumb图像的透明色

      if(!imagecopyresampled($canvas,$this->_image,0,0,$x_offset,$y_offset,$thumb_size,$thumb_size,$square_size,$square_size))
        throw new Exception('Could Not Create Image');

      //Save Image to Destination
      if(!$this->_saveImage($canvas))
        throw new Exception('Could Not Save Image');

      return true;
   }
   catch(Exception $e)
   {
     $this->_errors[] = $e->getMessage();
     return false;
   }
  }


  /****************************************************************************
  *      Function:   resizeImage(int $width, int $height)
  *   Description:   Resize any valid image to a specific width and height.
  * Return Values:   Returns true if resizing is successful. Otherwise, returns
  *                  false (error occurred and logged).
  *****************************************************************************/
  public function resizeImage($width,$height)
  {
   try
   {
    //Verify the source image is valid
    if(!$this->_isImageValid())
      throw new Exception('Invalid Image');

    //Load new copy of image
    if(!$this->_loadImage())
      throw new Exception('Could Not Load Image');

    //Resize Image
    $canvas = imagecreatetruecolor($width, $height);
    imagealphablending($canvas,false); //意思是不合并颜色,直接用$img图像颜色替换,包括透明色
    imagesavealpha($canvas,true);      //意思是不要丢了$thumb图像的透明色

    if(!imagecopyresampled($canvas, $this->_image, 0, 0, 0, 0, $width, $height, $this->_width, $this->_height))
      throw new Exception('Could Not Create Image');

    //Save Image to Destination
    if(!$this->_saveImage($canvas))
      throw new Exception('Could Not Save Image');

     return true;
   }
   catch(Exception $e)
   {
     $this->_errors[] = $e->getMessage();
     return false;
   }

  }

  /****************************************************************************
  *      Function:   scaleImage(int $percent)
  *   Description:   Scale a valid image up/down with a specific percentage.
  * Return Values:   Returns true if scaling is successful. Otherwise, returns
  *                  false (error occurred and logged).
  *****************************************************************************/
  public function scaleImage($percent)
  {
   //imagesx and imagesy not working properly
   //Must use longer method
    list($width,$height) = @array_values(getimagesize($this->_source));

    $width*=($percent/100);
    $height*=($percent/100);

    return $this->resizeImage($width,$height);
  }


  /****************************************************************************
  *      Function:   _loadImage()
  *   Description:   Creates a copy of the source image using the appropriate
  *                  image function. Also, finds the dimensions of the
  *                  source image.
  * Return Values:   Returns true if image creation is successful. Otherwise,
  *                  returns false.
  *****************************************************************************/
  private function _loadImage()
  {
   //Get dimensions of source image
   list($this->_width,$this->_height) = @array_values(getimagesize($this->_source));

   //Create image using the appropriate type function
   switch(pathinfo($this->_source,PATHINFO_EXTENSION))
   {
      case 'jpg':
      case 'jpeg':
          $this->_image = imagecreatefromjpeg($this->_source);
          break;
      case 'png':
          $this->_image = imagecreatefrompng($this->_source);
          break;
      case 'gif':
          $this->_image = imagecreatefromgif($this->_source);
          break;
      default:
          return false;
          break;
  }
  return ($this->_image == false)? false : true;
  }

  /****************************************************************************
  *      Function:   _saveImage(mixed $canvas)
  *   Description:   Saves the image to its destination using the appropriate
  *                  image function.
  * Return Values:   Returns true if image saved successfully. Otherwise,
  *                  returns false.
  *****************************************************************************/
  private function _saveImage($canvas)
  {

  //Check to see if file directory exists; Create it if not
  if(!$this->_isDirectoryValid($this->_dest))
    return false;

  //Save image to destination using the appropriate type function
  switch(pathinfo($this->_dest,PATHINFO_EXTENSION))
  {
    case 'jpg':
    case 'jpeg':
        imagejpeg($canvas, $this->_dest,90);
        break;
    case 'png':
        imagepng($canvas, $this->_dest);
        break;
    case 'gif':
        imagegif($canvas, $this->_dest);
        break;
    default:
        return false;
        break;
  }

  //Free up memory
  imagedestroy($canvas);

  return (file_exists($this->_dest))? true : false;
  }

  /****************************************************************************
  *      Function:   _isDirectoryValid(string $path)
  *   Description:   Validates if the file directory does exist. If not, then
  *                  create the directory.
  * Return Values:   Returns true if directory exists or if created successfully.
  *                  Otherwise, returns false.
  *****************************************************************************/
  private function _isDirectoryValid($path)
  {
    $dir = pathinfo($path,PATHINFO_DIRNAME);

    if(!is_dir($dir))
      mkdir($dir,0777);

   return is_dir($dir)? true : false;
  }

  /****************************************************************************
  *      Function:   _isImageValid(string $path)
  *   Description:   Validates image by checking if file exists or if it's a
  *                  valid image type.
  * Return Values:   Returns true if file exists or is a valid image type.
  *                  Otherwise, returns false.
  *****************************************************************************/
  private function _isImageValid()
  {
   return (!file_exists($this->_source) || !in_array(pathinfo($this->_source,PATHINFO_EXTENSION),array('jpg','jpeg','png','gif')))? false : true;
  }

  /****************************************************************************
  *      Function:   getErrors()
  *   Description:   Returns an array containing compilation errors.
  * Return Values:   Array
  *****************************************************************************/
  public function getErrors()
  {
   return $this->_errors;
  }

  /****************************************************************************
  *      Function:   setSource()
  *   Description:   Set the path to the source image.
  * Return Values:   None
  *****************************************************************************/
  public function setSource($path)
  {
   $this->_source = $path;
  }

  /****************************************************************************
  *      Function:   setDestination()
  *   Description:   Set the destination path to where the new image will be
  *                  saved.
  * Return Values:   None
  *****************************************************************************/
  public function setDestination($path)
  {
   $this->_dest = $path;
  }

}


?>