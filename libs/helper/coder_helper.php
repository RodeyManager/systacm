<?php
if(!defined('ACT')) die('ACT Undefined， Access Violation！');

/**
 * Coder_helper (验证码类)
 * Author:  Rodey
 * Email :  Rodeyluo@gmail.com
 * QQ    :  453474593
 * Date  :  2013-04-2
 * User  ：
 *         require_once 'captcha.class.php';
 *         $coder = new Coder_Helper(80,30,4);
 *         $coder->showImg();
 *         $code = $coder->getCode();
 */

class Coder_Helper {
    private $width = 80;
    private $height = 30;
    private $length = 4;
    private $font = '';
    private $font_size = 0;
    private $code;
    private $im;

    public function __construct($vars = array()){
        if(!empty($vars)){
            foreach ($vars as $key => $value) {
                $k = strtolower(trim($key));
                $this->$k = $value;
            }
        }
    }

    function showImg(){
        //创建图片
        $this->createImg();
        //设置干扰元素
        $this->setDisturb();
        //设置验证码
        $this->setCode();
        //输出图片
        $this->outputImg();
    }

    function getCode(){
        return $this->code;
    }

    private function createImg(){
        $this->im = imagecreatetruecolor($this->width, $this->height);
        $bgColor = imagecolorallocate($this->im, 220, 220, 220);
        imagefill($this->im, 0, 0, $bgColor);
    }

    private function setDisturb(){
        $area = ($this->width * $this->height) / 20;
        $disturbNum = ($area > 250) ? 250 : $area;
        //加入点干扰
        for ($i = 0; $i < $disturbNum; $i++) {
            $color = imagecolorallocate($this->im, rand(0, 255), rand(0, 255), rand(0, 255));
            imagesetpixel($this->im, rand(1, $this->width - 2), rand(1, $this->height - 2), $color);
        }
        //加入弧线
        for ($i = 0; $i <= 5; $i++) {
            $color = imagecolorallocate($this->im, rand(128, 255), rand(125, 255), rand(100, 255));
            imagearc($this->im, rand(0, $this->width), rand(0, $this->height), rand(30, 300), rand(20, 200), 50, 30, $color);
        }
    }

    private function createCode(){
        $str = "23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
        $this->code = substr(str_shuffle($str), 0, $this->length);
        /*for ($i = 0; $i < $this->length; $i++) {
            $this->code .= $str{rand(0, strlen($str) - 1)};
        }*/
    }

    private function setCode(){
        $this->createCode();

        for ($i = 0; $i < $this->length; $i++) {
            $color = imagecolorallocate($this->im, rand(0, 50), rand(30, 100), rand(5, 150));
            $size = $this->font_size !== 0 ? intval($this->font_size) : rand(floor($this->height / 2), floor($this->height));
            $x = floor($this->width / $this->length) * $i + 5;
            $y = rand(0, $this->height - 20);
            if('' !== $this->font){
                $size = $this->font_size !== 0 ? intval($this->font_size) : rand(floor($this->height / 2), floor($this->height));
                $y = rand($this->height / 2, $this->height);
                imagettftext($this->im, $size, 0, $x, $y, $color, $this->font, $this->code{$i});
            }else{
                imagechar($this->im, $size, $x, $y, $this->code{$i}, $color);
            }
        }
    }

    private function outputImg(){
        //自动检测GD支持的图像类型，并输出图像
        if(imagetypes() & IMG_GIF){          //判断生成GIF格式图像的函数是否存在
            header("Content-type: image/gif");  //发送标头信息设置MIME类型为image/gif
            imagegif($this->im);           //以GIF格式将图像输出到浏览器
        }elseif(imagetypes() & IMG_JPG){      //判断生成JPG格式图像的函数是否存在
            header("Content-type: image/jpeg"); //发送标头信息设置MIME类型为image/jpeg
            imagejpeg($this->im, "", 0.5);   //以JPEN格式将图像输出到浏览器
        }elseif(imagetypes() & IMG_PNG){     //判断生成PNG格式图像的函数是否存在
            header("Content-type: image/png");  //发送标头信息设置MIME类型为image/png
            imagepng($this->im);          //以PNG格式将图像输出到浏览器
        }elseif(imagetypes() & IMG_WBMP){   //判断生成WBMP格式图像的函数是否存在
             header("Content-type: image/vnd.wap.wbmp");   //发送标头为image/wbmp
             imagewbmp($this->im);       //以WBMP格式将图像输出到浏览器
        }else{                              //如果没有支持的图像类型
            die("PHP不支持图像创建！");    //不输出图像，输出一错误消息，并退出程序
        }
    }

    function __destruct(){                      //当对象结束之前销毁图像资源释放内存
        imagedestroy($this->im);            //调用GD库中的方法销毁图像资源
    }

}