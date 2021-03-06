package net.edecker.tween {
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	[Event(name="enterFrame", type="flash.events.Event")]
	[Event(name="complete", type="flash.events.Event")]
	/**
	 * A self-contained tween.
	 * <p>NanoTween is not meant to be a super optimized or well organized tweening engine. 
	 * Rather, it is ment to condense basic tweening functionalities into one small class 
	 * that can be used with preloaders, banner ads, and other Flash projects were size is the primary concern.</p>
	 * 
	 * <p>Each tween is a seperate instance rather than hooking up into a centralized synchronized manager.
	 * When creating a new NanoTween you can supply a time, a target object, a list of properties and values,
	 * as well as an optionl external easeing function. The easeing functions are seperated into classes based
	 * upon the equation and grouped by in, out, inOut, and outIn. The idea is to only import which ease functions are needed.
	 * Upon starting a new tween, an optional delay can be passed as an offset. Each time the tween loop updates, the tween will
	 * dispatch a nantive Event.ENTER_FRAME event. Likewise, upon the tween's completion, it will dispatch Event.COMPLETE.</p>
	 * 
	 * <p>NanoTween is under the <a href="http://www.opensource.org/licenses/mit-license.php">MIT License</a>.</p>
	 * 
	 * @example The following code creates a new tween on mySprite that will fade the alpha to 0 over 1 second:
	 * <listing version="3.0">
	 * new NanoTween(mySprite, 1.0, {alpha:0}).start();</listing>
	 * 
	 * @example The following code creates a new tween on mySprite that will fade the alpha to 0 over 0.5 seconds
	 * after a 1 second delay and will use a Quad easeIn algorithm:
	 * <listing version="3.0">
	 * new NanoTween(mySprite, 0.5, {alpha:0}, Quad.easeIn).start(1.0);</listing>
	 * 
	 * @example The following code creates a new tween on mySprite that will fade the alpha to 0 over 1 second
	 * and upon completion of the tween will call the event listener hndlTweenOver:
	 * <listing version="3.0">
	 * new NanoTween(mySprite, 1.0, {alpha:0}).start().addEventListener(Event.COMPLETE, hndlTweenOver);</listing>
	 * 
	 * @see net.edecker.tween.NanoTweenAdvance
	 * @author edecker
	 */
	public class NanoTween extends EventDispatcher {
		
		/**The scope of the tween*/		
		public  var target:Object;		//_target
		
		/**@private*/
		internal static var a:Array;	//_instances
		private static var b:Shape;		//_dispatcher
		private static var c:Number;	//currentTime
				
		internal var m:Array;	//_properties
		private var i:Number; 	//_targetTime
		private var j:Number;	//_startTime
		private var k:Number;	//_duration
		private var l:Boolean;	//_isRunning
		private var n:Boolean;	//_killOnComplete
		private var o:Function;	//_easeFunction
		private var p:int = -1;	//_delay

		/** Creates a new instance of a NanoTween
		 * @param time Time in seconds for tween to complete.
		 * @param target Target object to apply tween to.
		 * @param props Object containing name-value pairs of properties to tween and the target (ex: {x:100, alpha:0.5})
		 * @param ease easeing Function in the format of: ease(t,b,c,d). The default, when null, is linear.
		 * @param autoKill When set to true and the tween is over dispose is automatically called.
		 */
		public function NanoTween(target:Object, time:Number, props:Object, ease:Function = null, autoKill:Boolean = true) {
			this.target = target;
			k = time*1000;
			m = [];
			for (var name:String in props) m.push({n:name,e:props[name]});
			o = (ease || u);
			n = autoKill;
			if (!b) {
				b = new Shape();
				b.addEventListener("enterFrame",q);
			}
			if (!a) a = [this];
			else a.push(this);
		}

		/** Starts the tween with optional delay
		 * @param delay Time to delay tween in seconds.
		 * @return Returns the current instance of the tween.
		 */
		public function start(delay:Number = 0):NanoTween {
			if (!l) {
				if (delay > 0) p = setTimeout(s, delay*1000);
				else s();
			}
			return this;
		}

		/** Stops a current tween
		 * @param kill When set to true the tween will dispose itself.
		 * @return Returns the current instance of the tween.
		 */
		public function stop(kill:Boolean = false):NanoTween {
			if (l){
				r();
				b.removeEventListener("U", t);
			}
			l = false;
			if (kill) dispose();
			return this;
		}

		/** Performs necessary actions to make sure the tween is garbage collected.
		 * This is called automatically at the end of a tween when autoKill is set to true.
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
			b.dispatchEvent(new Event("U"));
		}
		
		private function r():void {
			if (p >= 0) clearTimeout(p);
			p = -1;
		}

		protected function s():void {
			for each (var obj:Object in m) obj.s = target[obj.n];
			j = getTimer();
			i = Math.ceil(j+(k));
			b.addEventListener("U",t);
			l = true;
		}

		private function t(e:Event):void {
			for each (var obj:Object in m) {
				 target[obj.n] = k == 0 ? obj.e : o(Math.min(c - j, k), obj.s, obj.e-obj.s, k);
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
