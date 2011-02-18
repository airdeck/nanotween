package net.edecker.tween.proxy {

	import flash.display.MovieClip;
	/**
	 * Allows for a MovieClip's timeline to be tweened.
	 * @author edecker
	 */
	public class FrameProxy {

		/** The MovieClip to control. */
		public var target:MovieClip;
		
		/** Create a new FrameProxy object.
		 * @param target The MovieClip to control.
		 */
		public function FrameProxy(target:MovieClip) {
			this.target = target;
		}
		
		/**
		 * Current frame of the targeted MovieClip
		 */
		public function get frame():Number {
			return target.currentFrame;
		}
		/**
		 * @private
		 */
		public function set frame(value:Number):void {
			target.gotoAndStop(Math.floor(value));
		}
		
	}
}
