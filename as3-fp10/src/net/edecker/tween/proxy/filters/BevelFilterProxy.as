package net.edecker.tween.proxy.filters {
	import flash.filters.BevelFilter;

	/**
	 * @author edecker
	 */
	public class BevelFilterProxy extends AbstractFilterProxy {

		private var f:BevelFilter;

		public function BevelFilterProxy(distance:Number, angle:Number = 45, highlightColor:uint = 0xFFFFFF, highlightAlpha:Number = 1,shadowColor:uint = 0x000000,shadowAlpha:Number = 1,blurX:Number = 4, blurY:Number = 4, strength:int = 1, quality:int = 1,type:String = "inner",knockout:Boolean = false) {
			f = new BevelFilter(distance,angle,highlightColor,highlightAlpha,shadowColor,shadowAlpha,blurX,blurY,strength,quality,type,knockout);
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
	
		public function set highlightColor(v:uint):void {
			f.highlightColor = v;
			u();
		}
		public function get highlightColor():uint {
			return f.highlightColor;
		}
	
		public function set highlightAlpha(v:Number):void {
			f.highlightAlpha = v;
			u();
		}
		public function get highlightAlpha():Number {
			return f.highlightAlpha;
		}
		
		public function set shadowColor(v:uint):void {
			f.shadowColor = v;
			u();
		}
		public function get shadowColor():uint {
			return f.shadowColor;
		}
	
		public function set shadowAlpha(v:Number):void {
			f.shadowAlpha = v;
			u();
		}
		public function get shadowAlpha():Number {
			return f.shadowAlpha;
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
		
	}
}
