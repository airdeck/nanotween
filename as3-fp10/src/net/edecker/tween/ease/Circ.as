package net.edecker.tween.ease {

	/**
	 * Circ easing equations
	 * Penner easing equations lifted from Tweener
	 * @author edecker
	 */
	public class Circ {
		
		/**ease in
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeIn(t:Number, b:Number, c:Number, d:Number):Number {
			return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
		}

		/**ease out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeOut(t:Number, b:Number, c:Number, d:Number):Number {
			return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
		}

		/**ease in-out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeInOut(t:Number, b:Number, c:Number, d:Number):Number {
			if ((t /= d / 2) < 1) return -c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
			return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
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
