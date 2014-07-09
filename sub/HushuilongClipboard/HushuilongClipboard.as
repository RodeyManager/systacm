/**
 * author: hushuilong
 * email: hushuilong@gmail.com
 */
package {

	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.*;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.utils.ByteArray;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.external.ExternalInterface;
	import flash.system.System;
	import flash.system.Security;	

	public class HushuilongClipboard extends Sprite {
		
		private var buttonContainer:Sprite;
		
		public function HushuilongClipboard() {
			flash.system.Security.allowDomain("*");
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;			
			
			buttonContainer = new Sprite();
			buttonContainer.buttonMode = true;
			buttonContainer.useHandCursor = true;
			addChild(buttonContainer);			
			
			load_button_img();
			
			buttonContainer.addEventListener(MouseEvent.CLICK, function(event:Event):void{
				ExternalInterface.call("HushuilongClipboard.flashClickCallback",ExternalInterface.objectID);
			});			
			ExternalInterface.addCallback("jsCallflashToSetClipboard", setClipboard);
		}
		
		public function load_button_img(){			
			try{
				var buttonImg:String = LoaderInfo( this.root.loaderInfo ).parameters.button_img;		
				var loader:Loader = new Loader();
				loader.load( new URLRequest(buttonImg) );
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(evt:Event){
					var image:Bitmap = Bitmap(loader.content);
					buttonContainer.addChild(image);
				});
			}catch(error:Error){
				
			}
		}
		
		public function setClipboard(str) {
			try{
				System.setClipboard(str);
				return true;
			}catch(error:Error){
				return false;
			}
		}
	}
}
