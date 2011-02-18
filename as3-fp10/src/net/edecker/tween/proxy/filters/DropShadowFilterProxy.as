package net.edecker.tween.proxy.filters {
	import flash.filters.DropShadowFilter;

	/**Allows a DropShadowFilter to be tweened on a targeted object.
	 * @author edecker
	 */
	public class DropShadowFilterProxy extends AbstractFilterProxy {	 

		private var f:DropShadowFilter;

		/** Creates a new DropShadowFilterProxy object.
		 * The proxy object's attributes mimic those of the DropShadowFilter.
		 * After creating the object a target must be assigned.
		 * 
		 * @see flash.filters.DropShadowFilter
		 */
		public function DropShadowFilterProxy(distance:Number = 4,angle:Number = 45,color:uint = 0x000000,alpha:Number = 1.0,blurX:Number = 4,blurY:Number = 4,strength:Number = 1,quality:int = 1,inner:Boolean = false,knockout:Boolean = false,hideObject:Boolean = false) {
			f = new DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout,hideObject);
			super(f);
		}
		
		/**The offset distance for the shadow, in pixels.*/
		public function get distance():Number {
			return f.distance;
		}
		/**@private*/
		public function set distance(v:Number):void {
			f.distance = v;
			u();
		}
		
		/**The angle of the shadow.*/
		public function get angle():Number {
			return f.angle;
		}
		/**@private*/
		public function set angle(v:Number):void {
			f.angle = v;
			u();
		}
		
		/**The alpha transparency value for the shadow color.*/
		public function get alpha():Number {
			return f.alpha;
		}
		/**@private*/
		public function set alpha(v:Number):void {
			f.alpha = v;
			u();
		}
		
		/**The amount of horizontal blur.*/
		public function get blurX():Number {
			return f.blurX;
		}
		/**@private*/
		public function set blurX(v:Number):void {
			f.blurX = v;
			u();
		}
		
		/**The amount of vertical blur.*/
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
		
		/**The color of the shadow.*/
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
