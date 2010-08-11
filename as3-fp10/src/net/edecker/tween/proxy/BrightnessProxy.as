package net.edecker.tween.proxy {
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	/**
	 * @author edecker
	 */
	public class BrightnessProxy {

		private var t:DisplayObject;
		private var b:Number;

		public function BrightnessProxy(target:DisplayObject, brightness:Number = 0) {
			t = target;
			b = brightness;
			a();
		}
		
		public function set brightness(value:Number):void {
			b = value;
			a();
		}
		public function get brightness():Number {
			return b;
		}

		private function a():void {
			if (b < 0) t.transform.colorTransform = new ColorTransform(1.0+b, 1.0+b, 1.0+b);
			else if (b > 0)  t.transform.colorTransform = new ColorTransform(1,1,1,1,b*255, b*255, b*255);
			else t.transform.colorTransform = new ColorTransform();
		}
	}
}
