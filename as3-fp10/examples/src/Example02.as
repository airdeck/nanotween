package {
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.proxy.BrightnessProxy;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * @author edecker
	 */
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example02 extends Sprite {

		public function Example02() {
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
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xFF0000);
			sprite.graphics.drawRect(0, 0, 550, 400);
			sprite.graphics.endFill();
			addChild(sprite);
			
			var proxy:BrightnessProxy = new BrightnessProxy(sprite);
			new NanoTween(proxy, 1.0, {brightness:1.0}).start(0);
			new NanoTween(proxy, 1.0, {brightness:-1.0}).start(1);
			new NanoTween(proxy, 3.0, {brightness:1.0}).start(2);
			new NanoTween(proxy, 0.5, {brightness:0.0}).start(5);
		}
	}
}
