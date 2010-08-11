package net.edecker.tween.proxy {

	import flash.display.MovieClip;
	/**
	 * @author ericdecker86
	 */
	public class FrameProxy {

		private var t:MovieClip;
		
		public function FrameProxy(target:MovieClip) {
			t = target;
		}
		
		public function set frame(value:Number):void {
			t.gotoAndStop(Math.floor(value));
		}
		public function get frame():Number {
			return t.currentFrame;
		}
	}
}
