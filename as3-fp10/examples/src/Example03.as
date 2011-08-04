package {
	import net.edecker.tween.NanoTweenAdvance;
	import net.edecker.tween.NanoTween;
	import net.edecker.tween.proxy.ColorProxy;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	/**
	 * @author ericdecker86
	 */
	 
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example03 extends Sprite {
		
		private var _proxy:ColorProxy;
		
		public function Example03() {
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
			methodA();
		}
		
		private function draw():void {
			this.graphics.clear();
			this.graphics.beginFill(_proxy.color);
			this.graphics.drawRect(10, 10, 530, 380);
			this.graphics.endFill();
		}
		
		private function methodA():void {
			_proxy = new ColorProxy(0x00FF00,0x0000FF);
			var tween:NanoTween = new NanoTween(_proxy, 1, {progress:1});
			tween.addEventListener(Event.ENTER_FRAME, hndlUpdate);
			tween.addEventListener(Event.COMPLETE, hndlComplete);
			tween.start();
			hndlUpdate(null);
		}

		private function hndlUpdate(event:Event):void {
			draw();
		}
		
		private function hndlComplete(event:Event):void {
			methodB();
		}
		
		private function methodB():void {
			_proxy = new ColorProxy(0x0000FF,0xFF0000);
			new NanoTweenAdvance(_proxy, 1, {progress:1}, {onUpdate:draw}).start();
		}
	}
}
