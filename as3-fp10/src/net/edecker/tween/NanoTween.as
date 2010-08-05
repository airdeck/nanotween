package net.edecker.tween {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;

	/**
	 * @author edecker
	 * @version 1.2
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
				
		public  var target:Object;		//_target
		
		private static var a:Array;		//_instances
		private static var b:Shape;		//_dispatcher
		private static var c:Number;	//currentTime
		
		private static const d:String = "U";	//UPDATE_EVENT
		private const f:String = "p";			//PROP_NAME	
		private const g:String = "s";			//PROP_START
		private const h:String = "d";			//PROP_DIFF
		
		private var i:Number; 	//_targetTime
		private var j:Number;	//_startTime
		private var k:Number;	//_duration
		private var l:Boolean;	//_isRunning
		private var m:Array;	//_properties
		private var n:Boolean;	//_killOnComplete
		private var o:Function;	//_easeFunction
		private var p:int = -1;	//_delay

		/** Creates a new instance of a NanoTween
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param properties Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param autoCleanup When set to true and the tween is over dispose is called.
		 */
		public function NanoTween(target:Object, time:Number, properties:Object, ease:Function = null, autoCleanup:Boolean = true) {
			this.target = target;
			k = Math.ceil(time*1000);
			m = [];
			for (var name:String in properties) {
				var obj:Object = new Object();
				obj[f]  = name;
				obj[g] = target[name];
				obj[h]  = properties[name] - target[name];
				m.push(obj);
			}
			o = (ease || u);
			n = autoCleanup;
			if (!b) {
				b = new Shape();
				b.addEventListener("enterFrame",q);
			}
			if (!a) a = [this];
			else a.push(this);
		}

		/** Starts the tween with optional delay
		 * @param delay Time to delay tween in seconds.
		 */
		public function start(delay:Number = 0):NanoTween {
			if (!l) {
				if (delay > 0) p = setTimeout(s, delay*1000);
				else s();
			}
			return this;
		}

		/** Stops a current tween*/
		public function stop(kill:Boolean = false):NanoTween {
			if (l){
				r();
				 b.removeEventListener(d, t);
			}
			l = false;
			if (kill) dispose();
			return this;
		}

		/** Performs necessary actions to make sure the tween is garbage collected.
		 * This is called automatically at the end of a tween whrn autoCleanup is set to true. 
		 */
		public function dispose():void {
			var index:uint = a.indexOf(this);
			a.splice(index,1);
			if (a.length == 0) {
				a = null;
				b.removeEventListener("enterFrame",q);
				b = null;
			}
			if (p) r();
		}
		
		private static function q(e:Event):void {
			c = getTimer();
			b.dispatchEvent(new Event(d));
		}
		
		private function r():void {
			if (p >= 0) clearTimeout(p);
			p = -1;
		}

		private function s():void {
			j = getTimer();
			i = Math.ceil(j+(k));
			b.addEventListener(d,t);
			l = true;
		}

		private function t(e:Event):void {
			for each (var obj:Object in m) {
				 target[obj[f]] = o(Math.min(c - j, k), obj[g], obj[h], k);
			}
			dispatchEvent(new Event("enterFrame"));
			if (c >= i) {
				stop();
				dispatchEvent(new Event("complete"));
				if (n) dispose();
			}
		}
		
		private function u(t:Number, b:Number, c:Number, d:Number):Number {
			return c * t / d + b;
		}

		
	}
}
