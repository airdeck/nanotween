package net.edecker.tween.proxy {
	import flash.display.DisplayObject;
	import flash.filters.DropShadowFilter;

	/**
	 * @author ericdecker86
	 */
	public class DropShadowFilterProxy {	 

		private var t:DisplayObject;
		private var f:DropShadowFilter;

		public function DropShadowFilterProxy(target:DisplayObject,distance:Number = 4,angle:Number = 45,color:uint = 0x000000,alpha:Number = 1.0,blurX:Number = 4,blurY:Number = 4,strength:Number = 1,quality:int = 1,inner:Boolean = false,knockout:Boolean = false,hideObject:Boolean = false) {
			t = target;
			f = new DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout,hideObject);
			t.filters =[f];
		}
		
		public function set distance(n:Number):void {
			f.distance = n;
			t.filters = [f];
		}
		public function get distance():Number {
			return f.distance;
		}
		
		public function set angle(n:Number):void {
			f.angle = n;
			t.filters = [f];
		}
		public function get angle():Number {
			return f.angle;
		}
	
		public function set alpha(n:Number):void {
			f.alpha = n;
			t.filters = [f];
		}
		public function get alpha():Number {
			return f.alpha;
		}
	
		public function set blurX(n:Number):void {
			f.blurX = n;
			t.filters = [f];
		}
		public function get blurX():Number {
			return f.blurX;
		}
		
		public function set blurY(n:Number):void {
			f.blurY = n;
			t.filters = [f];
		}
		public function get blurY():Number {
			return f.blurY;
		}
	
		public function set strength(n:Number):void {
			f.strength = n;
			t.filters = [f];
		}
		public function get strength():Number {
			return f.strength;
		}
	}
}
