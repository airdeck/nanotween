package net.edecker.tween.raw {
	import flash.events.Event;
	import net.edecker.tween.NanoTween;

	/**
	 * @author edecker
	 */
	public class NanoTweenAdvanceRaw extends NanoTween {

		private var _onComplete:Function;		//_onCompelte
		private var _onCompleteArgs:Array;		//_onCompelteArgs
		private var _onUpdate:Function;			//_onUpdate
		private var _onUpdateArgs:Array;		//_onUpdateArgs

		public function NanoTweenAdvanceRaw(target:Object, time:Number, props:Object, ease:Function = null, tweenParams:Object = null, autoKill:Boolean = true) {
			super(target, time, props, ease, autoKill);
			if (tweenParams) {
				_onComplete = getValue(tweenParams,"onComplete");
				_onCompleteArgs = getValue(tweenParams,"onCompleteArgs");
				_onUpdate = getValue(tweenParams,"onUpdate");
				_onUpdateArgs = getValue(tweenParams,"onUpdateArgs");
			}
			addEventListener(Event.ENTER_FRAME, hndlEnterFrame);
			addEventListener(Event.COMPLETE, hndlComplete);
		}

		private function getValue(params:Object, name:String):* {
			return params.hasOwnProperty(name) ? params[name] : null;
		}

		private function hndlComplete(event:Event):void {
			if (Boolean(_onComplete)) _onComplete.apply(undefined,_onCompleteArgs);
		}

		private function hndlEnterFrame(event:Event):void {
			if (Boolean(_onUpdate)) _onUpdate.apply(undefined, _onUpdateArgs);
		}
		
		override public function dispose():void {
			removeEventListener(Event.ENTER_FRAME, hndlEnterFrame);
			removeEventListener(Event.COMPLETE, hndlComplete);
			super.dispose();
		}
	}
}
