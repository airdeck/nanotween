package net.edecker.tween.ease {

	/**
	 * Sine easing equations
	 * Penner easing equations lifted from Tweener
	 * @author edecker
	 */
	public class Sine {
		
		/**ease in
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeIn(t:Number, b:Number, c:Number, d:Number):Number {
			return -c * Math.cos(t / d * (Math.PI / 2)) + c + b;
		}

		/**ease out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeOut(t:Number, b:Number, c:Number, d:Number):Number {
			return c * Math.sin(t / d * (Math.PI / 2)) + b;
		}

		/**ease in-out
		 * @param t elapsed time
		 * @param b start value
		 * @param c target value
		 * @param d target time
		 */
		public static function easeInOut(t:Number, b:Number, c:Number, d:Number):Number {
			return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
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
