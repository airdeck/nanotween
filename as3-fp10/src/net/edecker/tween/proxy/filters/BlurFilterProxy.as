package net.edecker.tween.proxy.filters {
	import flash.filters.BlurFilter;

	/**Allows a BevelFilter to be tweened on a targeted object.
	 * @author edecker
	 */
	public class BlurFilterProxy extends AbstractFilterProxy {

		private var f:BlurFilter;

		/** Creates a new BlurFilterProxy object.
		 * The proxy object's attributes mimic those of the BlurFilter.
		 * After creating the object a target must be assigned.
		 * 
		 * @see flash.filters.BlurFilter
		 */
		public function BlurFilterProxy(blurX:Number = 0, blurY:Number = 0, quality:Number = 1) {
			f = new BlurFilter(blurX,blurY,quality);
			super(f);
		}
		
		/** The amount of horizontal blur. */
		public function get blurX():Number {
			return f.blurX;
		}
		/** @private */
		public function set blurX(v:Number):void {
			f.blurX = v;
			u();
		}
		
		/** The amount of vertical blur. */
		public function get blurY():Number {
			return f.blurY;
		}
		/** @private */
		public function set blurY(v:Number):void {
			f.blurY = v;
			u();
		}
		
	
		
	}
}
