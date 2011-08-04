package net.edecker.tween.proxy {
	import flash.geom.ColorTransform;

	/**
	 * Allows for a color value to be interpolated and tweened.
	 * Can also optionally update a target's specified parameter.
	 * @author ericdecker86
	 */
	public class ColorProxy {

		private var s:uint;		//start color	
		private var e:uint;		//end color
		private var p:Number;	//progress
		private var t:Object;	//target
		private var v:String;	//property name

		/** Creates a new ColorProxy object.
		 * @param startColor The starting color (at 0% progress)
		 * @param endColor The targeted end color (at 100% progress)
		 * @param target Optional target that will be updated during the tween.
		 * When using a target the propertyName parameter must be set.
		 * @param propertyName The name of the public property on the target object to update.
		 * 
		 * @example Consider the following code in a class for MyCircle:
	 	 * <listing version="3.0">
	 	 * 
	 	 * private var _color:uint;
	 	 * private var _radius:Number;
	 	 * 
	 	 * public function MyCircle(color:uint, radius:Number) {
	 	 * 		_color = color;
	 	 * 		_radius = radius;
	 	 * 		draw();
	 	 * }
	 	 * 
	 	 * public function set color(value:uint):void {
	 	 * 		_color = value;
	 	 * 		draw();
	 	 * }
	 	 * 
	 	 * public function get color():uint {
	 	 * 		return _color;
	 	 * }
	 	 * 	
	 	 * public function draw():void {
	 	 * 		this.graphics.clear();
	 	 * 		this.graphics.beginFill(_color);
	 	 * 		this.graphics.drawCircle(0,0,_radius);
	 	 * 		this.graphics.endFill();
	 	 * }</listing>
	 	 * 
	 	 *  @example The ColorProxy object could be be used the following way with the above class to have a circle change from red to blue:
	 	 *  <listing version="3.0">
	 	 *  
	 	 * var myCircle:MyCircle = new MyCirclr(0xFF0000,20);
	 	 * var myProxy:ColorProxy = new ColorProxy(0xFF0000,0x0000FF,myCircle,"color");
	 	 * new NanoTween(myProxy, 1.0, {progress:1}).start();</listing>
		 */
		public function ColorProxy(startColor:uint, endColor:uint, target:Object = null, propertyName:String = null) {
			s = startColor;
			e = endColor;
			t = target;
			v = propertyName;
			p = 0;
		}
		
		/** The progress though the interpolation of the start color and end color.
		 *  0 would be the start color at 100%, and 1 would be the end color at 100%.
		 */
		public function get progress():Number {
			return p;
		}
		/** @private */
		public function set progress(n:Number):void {
			p = n;
			if (t) t[v] = color;
		}
		
		/** Reset the target destination color. The current color value will be set to the start color.
		 * @param endColor The new end color.
		 */
		public function newEndColor(endColor:uint):void {
			s = color;
			e = endColor;
			p = 0;
		}
		
		/** The current color interpolated by the progress attribute.*/
		public function get color():uint {
			var r1:uint = s >> 16;
			var g1:uint = s >> 8 & 0xFF;
			var b1:uint = s & 0xFF;
			
			var r2:uint = e >> 16;
			var g2:uint = e >> 8 & 0xFF;
			var b2:uint = e & 0xFF;
			
			var r3:uint = r1 + (r2-r1)*p;
			var g3:uint = g1 + (g2-g1)*p;
			var b3:uint = b1 + (b2-b1)*p;
			
			return (r3 << 16 | g3 << 8 | b3);
		}
		
		/** Get the current color as a ColorTransform object 
		 * @return resulting ColorTransform object 
		 **/
		public function get colorTransform():ColorTransform {
			var ct:ColorTransform = new ColorTransform();
			ct.color = color;
			return ct;
		}
		
	}
}
