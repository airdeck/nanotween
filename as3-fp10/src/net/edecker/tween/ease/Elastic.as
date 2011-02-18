package net.edecker.tween.ease {

	/**
	 * Elastic easing equations
	 * Penner easing equations lifted from Tweener
	 * @author edecker
	 */
	public class Elastic {
		
		/**ease in
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeIn(t:Number, b:Number, c:Number, d:Number):Number {
			if (t == 0) return b;
			if ((t /= d) == 1) return b + c;
			var p:Number = d * .3;
			var s:Number;
			var a:Number = 0;
			if (!Boolean(a) || a < Math.abs(c)) {
				a = c;
				s = p / 4;
			} else {
				s = p / (2 * Math.PI) * Math.asin(c / a);
			}
			return -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
		}

		/**ease out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeOut(t:Number, b:Number, c:Number, d:Number):Number {
			if (t == 0) return b;
			if ((t /= d) == 1) return b + c;
			var p:Number = d * .3;
			var s:Number;
			var a:Number = 0;
			if (!Boolean(a) || a < Math.abs(c)) {
				a = c;
				s = p / 4;
			} else {
				s = p / (2 * Math.PI) * Math.asin(c / a);
			}
			return (a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b);
		}

		/**ease in-out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeInOut(t:Number, b:Number, c:Number, d:Number):Number {
			if (t == 0) return b;
			if ((t /= d / 2) == 2) return b + c;
			var p:Number = d * (.3 * 1.5);
			var s:Number;
			var a:Number = 0;
			if (!Boolean(a) || a < Math.abs(c)) {
				a = c;
				s = p / 4;
			} else {
				s = p / (2 * Math.PI) * Math.asin(c / a);
			}
			if (t < 1) return -.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
			return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * .5 + c + b;
		}

		/**ease out-in
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeOutIn(t:Number, b:Number, c:Number, d:Number):Number {
			if (t < d / 2) return easeOut(t * 2, b, c / 2, d);
			return easeIn((t * 2) - d, b + c / 2, c / 2, d);
		}

		
	}
}
