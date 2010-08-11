package {
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.ease.Bounce;
	import net.edecker.tween.ease.Quad;
	import net.edecker.tween.proxy.FrameProxy;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * @author ericdecker86
	 */
	[SWF(width='427', height='443', backgroundColor='#ffffff', frameRate='60')]
	public class Example04 extends Sprite {
		
		[Embed(source="../assets/animation.swf", symbol="Animation")]
		private const Animation:Class;
		private var _animation:MovieClip;
		private var _proxy:FrameProxy;
		
		public function Example04() {
			if (stage) init();
			else addEventListener(Event.ENTER_FRAME, hndlCheckStageReady);
		}
		
		private function hndlCheckStageReady(event:Event):void {
			if (stage){
				stage.scaleMode = StageScaleMode.NO_SCALE;
				removeEventListener(Event.ENTER_FRAME, hndlCheckStageReady);
				init();
			}
		}

		private function init():void {
			_animation = new Animation();
			_animation.stop();
			addChild(_animation);
			_proxy = new FrameProxy(_animation);
			new NanoTween(_proxy, 5, {frame:_animation.totalFrames}, Quad.easeOut).start();
			new NanoTween(_proxy, 1, {frame:1}, Quad.easeIn).start(5);
			new NanoTween(_proxy, 2, {frame:_animation.totalFrames}).start(6);
			new NanoTween(_proxy, 2, {frame:1}, Quad.easeInOut).start(8);
			new NanoTween(_proxy, 4, {frame:_animation.totalFrames}, Bounce.easeOut).start(10);
			addEventListener(Event.ENTER_FRAME, hndlDelay);
		}
		
		private function hndlDelay(event:Event):void {
			
			
		}
	}
}
