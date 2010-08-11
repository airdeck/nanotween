package {
	import flash.display.StageScaleMode;
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.proxy.BlurFilterProxy;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author ericdecker86
	 */
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example05 extends Sprite {
		
		public function Example05() {
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
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0xFF0000);
			s.graphics.drawRect(0, 0, 100, 100);
			s.graphics.endFill();
			s.x = 20;
			s.y = 20;
			addChild(s);
			var proxy:BlurFilterProxy = new BlurFilterProxy(s,0,0,2);
			new NanoTween(proxy, 2, {blurX:24,blurY:24}).start(0.25);
		}
	}
}
