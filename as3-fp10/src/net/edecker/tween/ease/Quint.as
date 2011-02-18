package net.edecker.tween.ease {

	/**
	 * Quint easing equations
	 * Penner easing equations lifted from Tweener
	 * @author edecker
	 */
	public class Quint {
		
		/**ease in
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeIn(t:Number, b:Number, c:Number, d:Number):Number {
			return c * (t /= d) * t * t * t * t + b;
		}

		/**ease out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeOut(t:Number, b:Number, c:Number, d:Number):Number {
			return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
		}

		/**ease in-out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeInOut(t:Number, b:Number, c:Number, d:Number):Number {
			if ((t /= d / 2) < 1) return c / 2 * t * t * t * t * t + b;
			return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
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
