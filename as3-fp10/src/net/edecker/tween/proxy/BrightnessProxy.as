package net.edecker.tween.proxy {
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	/**
	 * @author edecker
	 */
	public class BrightnessProxy {

		private var _target:DisplayObject;
		private var _brightness:Number;

		public function BrightnessProxy(target:DisplayObject, brightness:Number = 0) {
			_target = target;
			_brightness = brightness;
			apply();
		}
		
		public function set brightness(value:Number):void {
			_brightness = value;
			apply();
		}
		public function get brightness():Number {
			return _brightness;
		}

		private function apply():void {
			if (_brightness < 0) _target.transform.colorTransform = new ColorTransform(1.0+_brightness, 1.0+_brightness, 1.0+_brightness);
			else if (_brightness > 0)  _target.transform.colorTransform = new ColorTransform(1,1,1,1,_brightness*255, _brightness*255, _brightness*255);
			else _target.transform.colorTransform = new ColorTransform();
		}
	}
}
