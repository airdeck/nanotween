package {
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.ease.Bounce;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * @author ericdecker86
	 */
	
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example01 extends Sprite {
		
		
		public function Example01() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, hndlAddedToStage);
		}
		
		private function hndlAddedToStage(event:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, hndlAddedToStage);
			init();
		}

		private function init():void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			for (var i:uint = 0; i < 100; i++) {
				var rect:Sprite = newRect();
				rect.x = Math.floor( (550-rect.width)*Math.random() );
				rect.y = -rect.height;
				addChild(rect);
				var tween:NanoTween = new NanoTween(rect, 1.5, {y:400-rect.height}, Bounce.easeOut);
				tween.addEventListener(Event.COMPLETE, hndlTweenComplete);
				tween.start(Math.random()*5);
			}
		}
		
		private function hndlTweenComplete(event:Event):void {
			var tween:NanoTween = event.currentTarget as NanoTween;
			var rect:Sprite = tween.target as Sprite;
			
			new NanoTween(rect, 1, {alpha:0}).start();
		}

		
		private function newRect():Sprite {
			var rect:Sprite = new Sprite();
			rect.graphics.beginFill(0xFFFFFF*Math.random());
			rect.graphics.drawRect(0, 0, 15, 15);
			rect.graphics.endFill();
			return rect;
		}
	}
}
