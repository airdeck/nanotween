package {
	import net.edecker.tween.proxy.BrightnessProxy;
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.proxy.ColorProxy;
	import net.edecker.tween.proxy.filters.BevelFilterProxy;
	import net.edecker.tween.proxy.filters.BlurFilterProxy;
	import net.edecker.tween.proxy.filters.DropShadowFilterProxy;
	import net.edecker.tween.proxy.filters.GlowFilterProxy;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filters.BlurFilter;

	/**
	 * @author ericdecker
	 */
	
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example07 extends Sprite {

		public function Example07() {
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
			stage.scaleMode = StageScaleMode.NO_SCALE;
			shadowRect();
			blurRect();
			glowRect();
			bevelRect();
			complexRect();
			brightnessRect();
		}

		private function brightnessRect():void {
			var rect:Sprite = newRect(0xff0000);
			rect.x = rect.width + 30;
			rect.y = 400 - rect.height - 10;
			addChild(rect);
			var brightness:BrightnessProxy = new BrightnessProxy(rect);
			new NanoTween(brightness, 1.0, {brightness:1.0}).start(0.0);
			new NanoTween(brightness, 2.0, {brightness:-1.0}).start(1.0);
		}

		private function complexRect():void {
			var rect:Sprite = newRect(0xEE00FF);
			rect.x = rect.width + 30;
			rect.y = 200 - rect.height/2;
			rect.filters = [new BlurFilter(0,24,2)];
			addChild(rect);
			var blur:BlurFilterProxy = new BlurFilterProxy(0,0,2);
			blur.target = rect;
			new NanoTween(blur, 2.0, {blurX:12,blurY:12}).start();
			var glow:GlowFilterProxy = new GlowFilterProxy(0xFF0000,0,0,0,1,1,true);
			glow.target = rect;
			new NanoTween(glow, 2.0, {alpha:1,blurX:16,blurY:16}).start();
		}

		private function bevelRect():void {
			var rect:Sprite = newRect(0x229944);
			rect.x = rect.width + 30;
			rect.y = 10;
			addChild(rect);
			var bevel:BevelFilterProxy = new BevelFilterProxy(4,45,0xFFFFFF,0.5,0x000000,0.5,2,2,1,2);
			bevel.target = rect;
			new NanoTween(bevel, 3.0, {distance:6,angle:135, blurX:4,blurY:4}).start(1.0);
		}

		private function glowRect():void {
			var rect:Sprite = newRect(0x6600FF);
			rect.x = 10;
			rect.y = 400 - rect.height - 10;
			addChild(rect);
			var glow:GlowFilterProxy = new GlowFilterProxy(0x00FFFF, 1, 0, 0,1,2);
			glow.target = rect;
			new NanoTween(glow, 2.0, {blurX:16,blurY:16}).start();
			var c:ColorProxy = new ColorProxy(0x00FFFF, 0x6600FF,glow,"color");
			new NanoTween(c, 2.0, {progress:1}).start(1.0);
		}

		private function blurRect():void {
			var rect:Sprite = newRect(0xEE00FF);
			rect.x = 10;
			rect.y = 200 - rect.height/2;
			addChild(rect);
			var blur:BlurFilterProxy = new BlurFilterProxy(0,0,2);
			blur.target = rect;
			new NanoTween(blur, 2.0, {blurX:12,blurY:12}).start();
		}
		
		private function shadowRect():void {
			var rect:Sprite = newRect(0x00FFFF);
			rect.x = 10;
			rect.y = 10;
			addChild(rect);
			var shadow:DropShadowFilterProxy = new DropShadowFilterProxy(4,45,0,0.5,5,5);
			shadow.target = rect;
			new NanoTween(shadow, 2.0, {blurX:16,blurY:16,distance:10,angle:135,alpha:0.3}).start();
		}

		private function newRect(color:uint):Sprite {
			var rect:Sprite = new Sprite();
			rect.graphics.beginFill(color);
			rect.graphics.drawRect(0, 0, 200, 100);
			rect.graphics.endFill();
			return rect;
		}
	}
}
