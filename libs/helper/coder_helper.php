<?php if(!defined('ACT')) die('ACT Undefined， Access Violation！');

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
    private $im = null;

    public function __construct($vars = array()){
        if(!empty($vars)){
            foreach ($vars as $key => $value) {
                $k = strtolower(trim($key));
                $this->$k = $value;
            }
        }
    }

    public function showImg(){
        $this->createCode();
        //创建图片
        $this->createImg();
//        //设置干扰元素
        $this->setDisturb();
//        //设置验证码
        $this->setCode();
        //输出图片
        $this->outputImg();
    }

    function getCode(){
        return $this->code;
    }

    public function createImg(){
        $this->im = imagecreatetruecolor($this->width, $this->height);
        $white = imagecolorallocate($this->im, 255, 255, 255); //第一次调用设置背景色
//        $black = imagecolorallocate($this->im, 0, 0, 0); //边框颜色
        imagefilledrectangle($this->im, 0, 0, $this->width, $this->height, $white); //画一矩形填充
        imagerectangle($this->im, 0, 0, $this->width - 1, $this->height - 1, null); //画一矩形框
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
        $str = ''; //用来存储随机码
        $string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";//随机挑选其中4个字符，也可以选择更多，注意循环的时候加上，宽度适当调整
        for($i = 0; $i < $this->length; ++$i){
            $str .= $string[rand(0,35)];
        }
        $this->code = $str;
    }

    private function setCode(){
        //将验证码写入图案
        for ($i = 0; $i < $this->length; ++$i) {
            $color = imagecolorallocate($this->im, rand(0, 50), rand(30, 100), rand(5, 150));
            $size = $this->font_size !== 0 ? intval($this->font_size) : rand(floor($this->height / 2), floor($this->height));
            $x = 13 + $i * ($this->width - 15) / 4;
            $y = mt_rand(3, $this->height / 3);
            if('' !== $this->font){
                $size = $this->font_size !== 0 ? intval($this->font_size) : rand(floor($this->height / 2), floor($this->height));
                $y = rand($this->height / 2, $this->height);
                imagettftext($this->im, $size, 0, $x, $y, $color, $this->font, $this->code{$i});
            }else{
                imagechar($this->im, $size, $x, $y, $this->code[$i], $color);
            }
        }
    }

    private function outputImg(){
        header("Content-type:image/jpeg"); //以jpeg格式输出，注意上面不能输出任何字符，否则出错
        imagejpeg($this->im);
    }

    function __destruct(){                      //当对象结束之前销毁图像资源释放内存
        imagedestroy($this->im);            //调用GD库中的方法销毁图像资源
    }

}