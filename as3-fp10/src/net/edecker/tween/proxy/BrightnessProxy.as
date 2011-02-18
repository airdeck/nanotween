package net.edecker.tween.proxy {
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	/**
	 * Allows for a DisplayObject's brightness to be tweened
	 * @author edecker
	 */
	public class BrightnessProxy {

		private var t:DisplayObject;
		private var b:Number;

		/** Creates a new BrightnessProxy object.
		 * @param target The target that will be effected.
		 * @param brightness The brightness starting value.
		 * <ul>
		 * 		<li>A brighness of 0 will have no effect.</li>
		 * 		<li>A brighness of 1 will be fully light/white</li>
		 * 		<li>A brighness of -1 will be fully dark/black</li>
		 * 	</ui>
		 */
		public function BrightnessProxy(target:DisplayObject, brightness:Number = 0) {
			t = target;
			b = brightness;
			a();
		}
		
		/** The brightness value of the targeted DisplayObject.
		 * <ul>
		 * 		<li>A brighness of 0 will have no effect.</li>
		 * 		<li>A brighness of 1 will be fully light/white</li>
		 * 		<li>A brighness of -1 will be fully dark/black</li>
		 * 	</ui>
		 */
		public function get brightness():Number {
			return b;
		}
		/** @private */
		public function set brightness(value:Number):void {
			b = value;
			a();
		}
		
		private function a():void {
			if (b < 0) t.transform.colorTransform = new ColorTransform(1.0+b, 1.0+b, 1.0+b);
			else if (b > 0)  t.transform.colorTransform = new ColorTransform(1,1,1,1,b*255, b*255, b*255);
			else t.transform.colorTransform = new ColorTransform();
		}
	}
}
