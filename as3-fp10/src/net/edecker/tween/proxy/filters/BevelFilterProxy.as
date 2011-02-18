package net.edecker.tween.proxy.filters {
	import flash.filters.BevelFilter;

	/**
	 * Allows a BevelFilter to be tweened on a targeted object.
	 * @author edecker
	 */
	public class BevelFilterProxy extends AbstractFilterProxy {

		private var f:BevelFilter;
		
		/** Creates a new BevelFilterProxy object.
		 * The proxy object's attributes mimic those of the BevelFilter.
		 * After creating the object a target must be assigned.
		 * 
		 * @see flash.filters.BevelFilter
		 */
		public function BevelFilterProxy(distance:Number, angle:Number = 45, highlightColor:uint = 0xFFFFFF, highlightAlpha:Number = 1,shadowColor:uint = 0x000000,shadowAlpha:Number = 1,blurX:Number = 4, blurY:Number = 4, strength:int = 1, quality:int = 1,type:String = "inner",knockout:Boolean = false) {
			f = new BevelFilter(distance,angle,highlightColor,highlightAlpha,shadowColor,shadowAlpha,blurX,blurY,strength,quality,type,knockout);
			super(f);
		}
		
		/** The offset distance of the bevel.*/ 
		public function get distance():Number {
			return f.distance;
		}
		/**@private*/
		public function set distance(v:Number):void {
			f.distance = v;
			u();
		}
		
		/** The angle of the bevel. */
		public function get angle():Number {
			return f.angle;
		}
		/**@private*/	
		public function set angle(v:Number):void {
			f.angle = v;
			u();
		}
		
		/** The highlight color of the bevel. */
		public function get highlightColor():uint {
			return f.highlightColor;
		}
		/**@private*/
		public function set highlightColor(v:uint):void {
			f.highlightColor = v;
			u();
		}
		
		/** The alpha transparency value of the highlight color. */
		public function get highlightAlpha():Number {
			return f.highlightAlpha;
		}
		/**@private*/
		public function set highlightAlpha(v:Number):void {
			f.highlightAlpha = v;
			u();
		}
		
		/** The shadow color of the bevel. */
		public function get shadowColor():uint {
			return f.shadowColor;
		}
		/**@private*/
		public function set shadowColor(v:uint):void {
			f.shadowColor = v;
			u();
		}
		
		/** The alpha transparency value of the shadow color. */
		public function get shadowAlpha():Number {
			return f.shadowAlpha;
		}
		/**@private*/
		public function set shadowAlpha(v:Number):void {
			f.shadowAlpha = v;
			u();
		}
		
		/** The amount of horizontal blur, in pixels. */
		public function get blurX():Number {
			return f.blurX;
		}
		/**@private*/
		public function set blurX(v:Number):void {
			f.blurX = v;
			u();
		}
		
		/** The amount of vertical blur, in pixels. */
		public function get blurY():Number {
			return f.blurY;
		}
		/**@private*/
		public function set blurY(v:Number):void {
			f.blurY = v;
			u();
		}
		
		/** The strength of the imprint or spread. */
		public function get strength():Number {
			return f.strength;
		}
		/**@private*/
		public function set strength(v:Number):void {
			f.strength = v;
			u();
		}
		
		
	}
}
