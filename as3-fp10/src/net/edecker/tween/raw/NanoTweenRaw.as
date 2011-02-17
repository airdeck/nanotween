package net.edecker.tween.raw {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;

	/**
	 * @author edecker
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

	[Event(name="enterFrame", type="flash.events.Event")]
	[Event(name="complete", type="flash.events.Event")]
	public class NanoTweenRaw extends EventDispatcher {
				
		public  var target:Object;					//_target
		
		internal static var _instances:Array;		//_instances
		private static var _disp:Shape;				//_dispatcher
		private static var _currTime:Number;		//currentTime
		
		private var _targetTime:Number; 			//_targetTime
		private var _startTime:Number;				//_startTime
		private var _duration:Number;				//_duration
		private var _isRunning:Boolean;				//_isRunning
		private var _props:Array;					//_properties
		private var _kill:Boolean;					//_killOnComplete
		private var _ease:Function;					//_easeFunction
		private var _delay:int = -1;				//_delay

		/** Creates a new instance of a NanoTween
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param props Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param autoKill When set to true and the tween is over dispose is called.
		 */
		public function NanoTweenRaw(target:Object, time:Number, props:Object, ease:Function = null, autoKill:Boolean = true) {
			this.target = target;
			_duration = time*1000;
			_props = [];
			for (var name:String in props) {
				_props.push({n:name,e:props[name]});
			}
			_ease = (ease || linear);
			_kill = autoKill;
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
		public function stop(kill:Boolean = false):NanoTweenRaw {
			if (_isRunning){
				killDelay();
				 _disp.removeEventListener("U", hndlUpdate);
			}
			_isRunning = false;
			if (kill) dispose();
			return this;
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
			_disp.dispatchEvent(new Event("U"));
		}
		
		private function killDelay():void {
			if (_delay >= 0) clearTimeout(_delay);
			_delay = -1;
		}

		private function doStart():void {
			for each (var obj:Object in _props) obj.s = target[obj.n];
			_startTime = getTimer();
			_targetTime = Math.ceil(_startTime+(_duration));
			_disp.addEventListener("U",hndlUpdate);
			_isRunning = true;
		}

		private function hndlUpdate(e:Event):void {
			for each (var obj:Object in _props) {
				 target[obj.n] = _ease(Math.min(_currTime - _startTime, _duration), obj.s, obj.e - obj.s, _duration);
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

		/** Gets a list of all tweens associated with a target
		 *  @param target The object to search for that contains one or more tweens
		 *  @return list of NanoTween objects associated with the target
		 */
		public static function getTweens(target:Object):Array {
			var results:Array = [];
			for each (var t:NanoTweenRaw in _instances) {
				if (t.target == target) results.push(t);
			}
			return results;
		}
		
	}
}
