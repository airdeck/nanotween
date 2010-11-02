package net.edecker.tween.proxy.filters {
	import flash.filters.GlowFilter;

	/**
	 * @author edecker
	 */
	public class GlowFilterProxy extends AbstractFilterProxy {

		private var f:GlowFilter;

		public function GlowFilterProxy(color:uint, alpha:Number, blurX:Number, blurY:Number, strength:int = 2, quality:int = 1, inner:Boolean = false, knockout:Boolean = false) {
			f = new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner,knockout);
			super(f);
		}
		
		public function set alpha(v:Number):void {
			f.alpha = v;
			u();
		}
		public function get alpha():Number {
			return f.alpha;
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
	
		public function set strength(v:Number):void {
			f.strength = v;
			u();
		}
		public function get strength():Number {
			return f.strength;
		}
		
		public function set color(v:uint):void {
			f.color = v;
			u();
		}
		public function get color():uint {
			return f.color;
		}
	}
}
