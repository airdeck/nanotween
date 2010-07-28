package net.edecker.tween {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	/**
	 * @author edecker
	 * @version 1.0
	 * 
	 * NanoTween
	 * NanoTween is not meant to be a super optimized or well organized tweening engine. 
	 * Rather, it is ment to condense basic tweening functionalities into one small class 
	 * that can be used with preloaders, banner ads, and other Flash projects were size is the primary concern.
	 * 
	 * Each tween is a seperate instance rather than hooking up into a centralized synchronized manager.
	 * When creating a new NanoTween you can supply a time, a target object, a list of properties and values,
	 * as well as an optionl external easeing function. The easeing functions are seperated into classes based
	 * upon the equation and grouped by in, out, inOut, and outIn. The idea is to only import which ease functions are needed.
	 * Upon starting a new tween, an optional delay can be passed as an offset. Each time the tween loop updates, the tween will
	 * dispatch a nantive Event.ENTER_FRAME event. Likewise, upon the tween's completion, it will dispatch Event.COMPLETE.
	 */

	[Event(name="Event.ENTER_FRAME", type="flash.events.Event")]
	[Event(name="Event.COMPLETE", type="flash.events.Event")]
	public class NanoTween extends EventDispatcher {
		
		public static const VERSION:String = "1.0";
		
		private static var _instances:Array;		//_instances
		private static var _disp:Shape;				//_dispatcher
		private static var _currTime:Number;		//currentTime
		
		private static const _UPDATE:String	 = "U";	//UPDATE_EVENT
		private const _PROP_NAME:String  = "p";		//PROP_NAME	
		private const _PROP_START:String = "s";		//PROP_START
		private const _PROP_DIFF:String  = "d";		//PROP_DIFF
		
		private var _targetTime:Number; 			//_targetTime
		private var _startTime:Number;				//_startTime
		private var _duration:Number;				//_duration
		private var _target:Object;					//_target
		private var _isRunning:Boolean;				//_isRunning
		private var _props:Array;					//_properties
		private var _kill:Boolean;					//_killOnComplete
		private var _ease:Function;					//_easeFunction
		private var _delay:Timer;					//_delay

		/** Creates a new instance of a NanoTween
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param properties Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param autoCleanup When set to true and the tween is over dispose is called.
		 */
		public function NanoTween(target:Object, time:Number, properties:Object, ease:Function = null, autoCleanup:Boolean = true) {
			_duration = Math.ceil(time*1000);
			_target = target;
			_props = [];
			for (var name:String in properties) {
				var obj:Object = new Object();
				obj[_PROP_NAME]  = name;
				obj[_PROP_START] = target[name];
				obj[_PROP_DIFF]  = properties[name] - target[name];
				_props.push(obj);
			}
			_ease = (ease || linear);
			_kill = autoCleanup;
			if (!_disp) {
				_disp = new Shape();
				_disp.addEventListener(Event.ENTER_FRAME,hndlEnterFrame);
			}
			if (!_instances) _instances = [this];
			else _instances.push(this);
		}

		/** Starts the tween with optional delay
		 * @param delay Time to delay tween in seconds.
		 */
		public function start(delay:Number = 0):NanoTween {
			if (!_isRunning) {
				if (delay > 0) {
					_delay = new Timer(delay*1000,1);
					_delay.addEventListener(TimerEvent.TIMER_COMPLETE, hndlDelayComplete,false,0,true);
					_delay.start();
				}
				else doStart();
			}
			return this;
		}

		/** Stops a current tween
		 */
		public function stop():NanoTween {
			if (_isRunning) _disp.removeEventListener(_UPDATE, hndlUpdate);
			_isRunning = false;
			return this;
		}
		
		/** Shorcut for getting the target object of the tween.
		 */
		public function get target():Object {
			return _target;
		}

		/** Performs necessary actions to make sure the tween is garbage collected.
		 * This is called automatically at the end of a tween whrn autoCleanup is set to true. 
		 */
		public function dispose():void {
			var index:uint = _instances.indexOf(this);
			_instances.splice(index,1);
			if (_instances.length == 0) {
				_instances = null;
				_disp.removeEventListener(Event.ENTER_FRAME,hndlEnterFrame);
				_disp = null;
			}
			if (_delay) killDelay();
		}
		
		private static function hndlEnterFrame(event:Event):void {
			_currTime = getTimer();
			_disp.dispatchEvent(new Event(_UPDATE));
		}
		
		private function hndlDelayComplete(event:TimerEvent):void {
			doStart();
			killDelay();
		}
		
		private function killDelay():void {
			_delay.removeEventListener(TimerEvent.TIMER_COMPLETE, hndlDelayComplete);
			_delay = null;
		}

		private function doStart():void {
			_startTime = getTimer();
			_targetTime = Math.ceil(_startTime+(_duration));
			_disp.addEventListener(_UPDATE, hndlUpdate,false,0,false);
			_isRunning = true;
		}

		private function hndlUpdate(event:Event):void {
			update();
		}
		
		private function update():void {
			var elapsed:Number = Math.min(_currTime - _startTime, _duration);
			for each (var obj:Object in _props) {
				 _target[obj[_PROP_NAME]] = _ease(elapsed, obj[_PROP_START], obj[_PROP_DIFF], _duration);
			}
			dispatchEvent(new Event(Event.ENTER_FRAME));
			if (_currTime >= _targetTime) {
				stop();
				dispatchEvent(new Event(Event.COMPLETE));
				if (_kill) dispose();
			}
		}
		
		private function linear(t:Number, b:Number, c:Number, d:Number):Number {
			return c * t / d + b;
		}

		
	}
}
