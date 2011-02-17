package net.edecker.tween {
	import flash.events.Event;

	/**
	 * @author edecker
	 */
	public class NanoTweenAdvance extends NanoTween {

		private var a:Function;		//_onCompelte
		private var b:Array;		//_onCompelteArgs
		private var c:Function;			//_onUpdate
		private var d:Array;		//_onUpdateArgs

		public function NanoTweenAdvance(target:Object, time:Number, props:Object, ease:Function = null, tweenParams:Object = null, autoKill:Boolean = true) {
			super(target, time, props, ease, autoKill);
			if (tweenParams) {
				a = e(tweenParams,"onComplete");
				b = e(tweenParams,"onCompleteArgs");
				c = e(tweenParams,"onUpdate");
				d = e(tweenParams,"onUpdateArgs");
			}
			addEventListener(Event.ENTER_FRAME, g);
			addEventListener(Event.COMPLETE, f);
		}

		private function e(params:Object, name:String):* {
			return params.hasOwnProperty(name) ? params[name] : null;
		}

		private function f(e:Event):void {
			if (Boolean(a)) a.apply(undefined,b);
		}

		private function g(e:Event):void {
			if (Boolean(c)) c.apply(undefined, d);
		}
		
		override public function dispose():void {
			removeEventListener(Event.ENTER_FRAME, g);
			removeEventListener(Event.COMPLETE, f);
			super.dispose();
		}
	}
}
