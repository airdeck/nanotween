package {
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.proxy.filters.BlurFilterProxy;
	import net.edecker.tween.proxy.filters.DropShadowFilterProxy;

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
			blurTween();
			shadowTween();
		}
		
		private function blurTween():void {
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0xFF0000);
			s.graphics.drawRect(0, 0, 100, 100);
			s.graphics.endFill();
			s.x = 20;
			s.y = 20;
			addChild(s);
			var proxy:BlurFilterProxy = new BlurFilterProxy(0,0,2);
			proxy.target = s;
			new NanoTween(proxy, 2, {blurX:24,blurY:24}).start(0.25);
		}
		
		private function shadowTween():void {
			var s:Sprite = new Sprite();
			s.graphics.beginFill(0x00FF00);
			s.graphics.drawRect(0, 0, 100, 100);
			s.graphics.endFill();
			s.x = 300;
			s.y = 20;
			addChild(s);
			var proxy:DropShadowFilterProxy = new DropShadowFilterProxy(4,45,0,0.65,4,4,1,2);
			proxy.target = s;
			new NanoTween(proxy, 3, {distance:12,angle:55,blurX:24,blurY:24}).start(0.25);
		}
	}
}
