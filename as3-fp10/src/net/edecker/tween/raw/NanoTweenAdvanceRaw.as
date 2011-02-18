package net.edecker.tween.raw {
	import flash.events.Event;
	import net.edecker.tween.NanoTween;

	/**
	 * @author edecker
	 * @private
	 */
	public class NanoTweenAdvanceRaw extends NanoTween {

		private var _onComplete:Function;		//_onCompelte
		private var _onCompleteArgs:Array;		//_onCompelteArgs
		private var _onUpdate:Function;			//_onUpdate
		private var _onUpdateArgs:Array;		//_onUpdateArgs

		/** Creates a new NanoTween with some additional features
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param props Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param tweenParams Object containing special parameters to be used by the tween:
		 * 		  onComplete:Function		Callback function call upon completion of the tween
		 * 		  onCompleteArgs:Array		Optional list of arguments for the onComplete function
		 * 		  onUpdate:Function			Callback function call upon evey update
		 * 		  onUpdateArgs:Array		Optional list of arguments for the onUpdate function
		 * @param autoKill When set to true and the tween is over dispose is called.
		 */
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
