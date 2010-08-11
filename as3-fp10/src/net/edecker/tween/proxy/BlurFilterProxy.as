package net.edecker.tween.proxy {
	import flash.display.DisplayObject;
	import flash.filters.BlurFilter;

	/**
	 * @author ericdecker86
	 */
	public class BlurFilterProxy {

		private var t:DisplayObject;
		private var f:BlurFilter;

		public function BlurFilterProxy(target:DisplayObject, blurX:Number = 0, blurY:Number = 0, quality:Number = 1) {
			t = target;
			f = new BlurFilter(blurX,blurY,quality);
			t.filters = [f];
		}
		
		public function set blurX(v:Number):void {
			f.blurX = v;
			t.filters = [f];
		}
		public function get blurX():Number {
			return f.blurX;
		}
		
		public function set blurY(v:Number):void {
			f.blurY = v;
			t.filters = [f];
		}
		public function get blurY():Number {
			return f.blurY;
		}
	
		
	}
}
