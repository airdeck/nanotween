package net.edecker.tween {
	import flash.events.Event;

	/**
	 * An extension to NanoTween that adds further capabilites such as onCompelte and onUpdate.
	 * 
	 * @example The following code creates a new tween on mySprite that will fade the alpha to 0 over 1 second,
	 * and upon completion will call the function 'myFunction' and pass 'true' and '10' as the arguments:
	 * <listing version="3.0">
	 * new NanoTween(mySprite, 1.0, {alpha:0}, null, {onComplete:myFunction,onCompleteArgs:[true,10]}).start();
	 * private function myFunction(param1:Boolean, param2:int):void</listing>
	 * 
	 * @example The following code creates a new tween on mySprite that will fade the alpha to 0 over 1 second,
	 * and on every update will call the function 'myFunction' and pass 'true' and '10' as the arguments:
	 * <listing version="3.0">
	 * new NanoTween(mySprite, 1.0, {alpha:0}, null, {onUpdate:myFunction,onUpdateArgs:[true,10]}).start();
	 * private function myFunction(param1:Boolean, param2:int):void</listing>
	 * 
	 * @author edecker
	 */
	public class NanoTweenAdvance extends NanoTween {

		private var a:Function;		//_onCompelte
		private var b:Array;		//_onCompelteArgs
		private var c:Function;		//_onUpdate
		private var d:Array;		//_onUpdateArgs
		
		/** Creates a new NanoTween with some additional features
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param props Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param tweenParams Object containing special parameters to be used by the tween:
		 * 		  <ul>
		 * 		  <li>onComplete:Function		Callback function call upon completion of the tween</li>
		 * 		  <li>onCompleteArgs:Array		Optional list of arguments for the onComplete function</li>
		 * 		  <li>onUpdate:Function			Callback function call upon evey update</li>
		 * 		  <li>onUpdateArgs:Array		Optional list of arguments for the onUpdate function</li>
		 * 		  </ul>
		 * @param autoKill When set to true and the tween is over dispose is called.
		 */
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
		
		/** Performs necessary actions to make sure the tween is garbage collected.
		 * This is called automatically at the end of a tween when autoKill is set to true.
		 */
		override public function dispose():void {
			removeEventListener(Event.ENTER_FRAME, g);
			removeEventListener(Event.COMPLETE, f);
			super.dispose();
		}
	}
}
