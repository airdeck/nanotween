package net.edecker.tween.proxy.filters {
	import flash.filters.DropShadowFilter;

	/**
	 * @author ericdecker86
	 */
	public class DropShadowFilterProxy extends AbstractFilterProxy {	 

		private var f:DropShadowFilter;

		public function DropShadowFilterProxy(distance:Number = 4,angle:Number = 45,color:uint = 0x000000,alpha:Number = 1.0,blurX:Number = 4,blurY:Number = 4,strength:Number = 1,quality:int = 1,inner:Boolean = false,knockout:Boolean = false,hideObject:Boolean = false) {
			f = new DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout,hideObject);
			super(f);
		}
		
		public function set distance(v:Number):void {
			f.distance = v;
			u();
		}
		public function get distance():Number {
			return f.distance;
		}
		
		public function set angle(v:Number):void {
			f.angle = v;
			u();
		}
		public function get angle():Number {
			return f.angle;
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
