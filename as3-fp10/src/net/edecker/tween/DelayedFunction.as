package net.edecker.tween {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author edecker
	 */
	public class DelayedFunction extends EventDispatcher {

		private var _timer:Timer;
		private var _fn:Function;
		private var _args:Array;

		public function DelayedFunction(callback:Function, args:Array, delay:Number) {
			_fn = callback;
			_args = args;
			_timer = new Timer(delay*1000,1);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, hndlComplete);
			_timer.start();
		}

		private function hndlComplete(event:TimerEvent):void {
			_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, hndlComplete);
			_fn.apply(null,_args);
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function cancel():EventDispatcher {
			_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, hndlComplete);
			_timer = null;
			return this;
		}
	}
}
