package {
	import net.edecker.tween.NanoTweenUtils;
	import net.edecker.tween.NanoTween;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.setTimeout;

	/**
	 * @author ericdecker
	 */
	
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example06 extends Sprite {

		private var _rect:Sprite;		
		
		public function Example06() {
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
			_rect = newRect();
			_rect.x = 275 - _rect.width/2;
			_rect.y = 200 - _rect.height/2;
			addChild(_rect);
			new NanoTween(_rect, 2, {alpha:0}).start();
			setTimeout(newTween, 1000);
		}
		
		private function newTween():void {
			report();
			for each (var tween:NanoTween in NanoTweenUtils.getTweens(_rect)) tween.stop(true);
			new NanoTween(_rect, 0.5, {alpha:1}).start();
			setTimeout(report, 250);
			setTimeout(report, 1000);
		}

		private function report():void {
			var count:Number = +NanoTweenUtils.getTweens(_rect).length;
			trace("currently there "+(count == 1 ? "is " : "are ")+count+(count == 1 ? " tween" : " tweens")+" for the _rect object");
		}
		
		private function newRect():Sprite {
			var rect:Sprite = new Sprite();
			rect.graphics.beginFill(0xEE00FF);
			rect.graphics.drawRect(0, 0, 200, 100);
			rect.graphics.endFill();
			return rect;
		}
	}
}
