package net.edecker.tween.proxy {

	/**
	 * @author ericdecker86
	 */
	public class ColorProxy {

		private var s:uint;
		private var e:uint;
		private var p:Number = 0;

		public function ColorProxy(startColor:uint, endColor:uint) {
			s = startColor;
			e = endColor;
		}
	
		public function set progress(n:Number):void {
			p = n;
		}
		public function get progress():Number {
			return p;
		}
		
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

	}
}