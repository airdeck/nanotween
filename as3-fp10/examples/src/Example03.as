package {
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
			_proxy = new ColorProxy(0x0000FF,0xFF0000);
			var tween:NanoTween = new NanoTween(_proxy, 1, {progress:1});
			tween.addEventListener(Event.ENTER_FRAME, hndlUpdate);
			tween.start();
			hndlUpdate(null);
		}
		
		private function hndlUpdate(event:Event):void {
			this.graphics.clear();
			this.graphics.beginFill(_proxy.color);
			this.graphics.drawRect(10, 10, 530, 380);
			this.graphics.endFill();
		}
	}
}
