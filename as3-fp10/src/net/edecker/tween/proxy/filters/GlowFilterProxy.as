package net.edecker.tween.proxy.filters {
	import flash.filters.GlowFilter;

	/**Allows a GlowFilter to be tweened on a targeted object.
	 * @author edecker
	 */
	public class GlowFilterProxy extends AbstractFilterProxy {

		private var f:GlowFilter;

		/**Creates a new GlowFilterProxy object.
		 * The proxy object's attributes mimic those of the GlowFilter.
		 * After creating the object a target must be assigned.
		 * 
		 * @see flash.filters.GlowFilter
		 */
		public function GlowFilterProxy(color:uint, alpha:Number, blurX:Number, blurY:Number, strength:int = 2, quality:int = 1, inner:Boolean = false, knockout:Boolean = false) {
			f = new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner,knockout);
			super(f);
		}
		
		/**The alpha transparency value for the color. */
		public function get alpha():Number {
			return f.alpha;
		}
		/**@private*/
		public function set alpha(v:Number):void {
			f.alpha = v;
			u();
		}
		
		/**The amount of horizontal blur. */
		public function get blurX():Number {
			return f.blurX;
		}
		/**@private*/
		public function set blurX(v:Number):void {
			f.blurX = v;
			u();
		}
		
		/**The amount of vertical blur. */
		public function get blurY():Number {
			return f.blurY;
		}
		/**@private*/
		public function set blurY(v:Number):void {
			f.blurY = v;
			u();
		}
		
		/**The strength of the imprint or spread.*/
		public function get strength():Number {
			return f.strength;
		}
		/**@private*/
		public function set strength(v:Number):void {
			f.strength = v;
			u();
		}
		
		/**The color of the glow.*/
		public function get color():uint {
			return f.color;
		}
		/**@private*/
		public function set color(v:uint):void {
			f.color = v;
			u();
		}
		
	}
}
