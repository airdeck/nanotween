package net.edecker.tween.proxy.filters {
	import flash.filters.BlurFilter;

	/**
	 * @author ericdecker86
	 */
	public class BlurFilterProxy extends AbstractFilterProxy {

		private var f:BlurFilter;

		public function BlurFilterProxy(blurX:Number = 0, blurY:Number = 0, quality:Number = 1) {
			f = new BlurFilter(blurX,blurY,quality);
			super(f);
		}
		
		public function set blurX(v:Number):void {
			f.blurX = v;
			u();
		}
		public function get blurX():Number {
			return f.blurX;
		}
		
		public function set blurY(v:Number):void {
			f.blurY = v;
			u();
		}
		public function get blurY():Number {
			return f.blurY;
		}
	
		
	}
}
