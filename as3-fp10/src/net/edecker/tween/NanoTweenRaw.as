package net.edecker.tween {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;

	/**
	 * @author edecker
	 * @version 1.1
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
	 * 
	 * NOTE: This is a "raw" working file. Using the compressed NanoTween class can save you a few bytes.
	 */

	[Event(name="Event.ENTER_FRAME", type="flash.events.Event")]
	[Event(name="Event.COMPLETE", type="flash.events.Event")]
	public class NanoTweenRaw extends EventDispatcher {
		
		public static const VERSION:String = "1.1";
		
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
		private var _delay:int = -1;				//_delay

		/** Creates a new instance of a NanoTween
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param properties Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param autoCleanup When set to true and the tween is over dispose is called.
		 */
		public function NanoTweenRaw(target:Object, time:Number, properties:Object, ease:Function = null, autoCleanup:Boolean = true) {
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
				_disp.addEventListener("enterFrame",hndlEnterFrame);
			}
			if (!_instances) _instances = [this];
			else _instances.push(this);
		}

		/** Starts the tween with optional delay
		 * @param delay Time to delay tween in seconds.
		 */
		public function start(delay:Number = 0):NanoTweenRaw {
			if (!_isRunning) {
				if (delay > 0) _delay = setTimeout(doStart, delay*1000);
				else doStart();
			}
			return this;
		}

		/** Stops a current tween*/
		public function stop(dispose:Boolean = false):NanoTweenRaw {
			if (_isRunning){
				killDelay();
				 _disp.removeEventListener(_UPDATE, hndlUpdate);
			}
			_isRunning = false;
			if (dispose) this.dispose();
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
				_disp.removeEventListener("enterFrame",hndlEnterFrame);
				_disp = null;
			}
			if (_delay) killDelay();
		}
		
		private static function hndlEnterFrame(e:Event):void {
			_currTime = getTimer();
			_disp.dispatchEvent(new Event(_UPDATE));
		}
		
		private function killDelay():void {
			if (_delay >= 0) clearTimeout(_delay);
			_delay = -1;
		}

		private function doStart():void {
			_startTime = getTimer();
			_targetTime = Math.ceil(_startTime+(_duration));
			_disp.addEventListener(_UPDATE, hndlUpdate,false,0,false);
			_isRunning = true;
		}

		private function hndlUpdate(e:Event):void {
			update();
		}
		
		private function update():void {
			var elapsed:Number = Math.min(_currTime - _startTime, _duration);
			for each (var obj:Object in _props) {
				 _target[obj[_PROP_NAME]] = _ease(elapsed, obj[_PROP_START], obj[_PROP_DIFF], _duration);
			}
			dispatchEvent(new Event("enterFrame"));
			if (_currTime >= _targetTime) {
				stop();
				dispatchEvent(new Event("complete"));
				if (_kill) dispose();
			}
		}
		
		private function linear(t:Number, b:Number, c:Number, d:Number):Number {
			return c * t / d + b;
		}

		
	}
}
