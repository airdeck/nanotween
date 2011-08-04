package {
	import net.edecker.tween.NanoTweenAdvance;
	import net.edecker.tween.NanoTweenUtils;
	import flash.utils.setTimeout;
	import net.edecker.tween.NanoTween;
	import flash.display.Sprite;

	/**
	 * @author edecker
	 */
	[SWF(width='550', height='400', backgroundColor='#ffffff', frameRate='60')]
	public class Example08 extends Sprite {

		private var _rect:Sprite;

		public function Example08() {
			_rect = new Sprite();
			_rect.graphics.beginFill(0xFF0000);
			_rect.graphics.drawRect(-100, -50, 200, 100);
			_rect.graphics.endFill();
			addChild(_rect);
			
			new NanoTween(_rect, 3.0, {x:550}).start();
			new NanoTween(_rect, 3.0, {y:400}).start();
			new NanoTween(_rect, 3.0, {rotation:180, alpha:0.1}).start();
			setTimeout(change, 1000);
			setTimeout(kill, 1500);
		}
		
		private function kill():void {
			NanoTweenUtils.removeTweens(_rect, ["rotation"]);
		}
		
		private function change():void {
			new NanoTweenAdvance(_rect, 1.0, {y:0}).start(1.0);
		}
	}
}
