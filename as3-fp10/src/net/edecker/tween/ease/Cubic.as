/** Penner easing equations lifted from Tweener **/
package net.edecker.tween.ease {

	/**
	 * @author edecker
	 */
	public class Cubic {
	
		public static function easeIn(t:Number, b:Number, c:Number, d:Number):Number {
			return c * (t /= d) * t * t + b;
		}


		public static function easeOut(t:Number, b:Number, c:Number, d:Number):Number {
			return c * ((t = t / d - 1) * t * t + 1) + b;
		}


		public static function easeInOut(t:Number, b:Number, c:Number, d:Number):Number {
			if ((t /= d / 2) < 1) return c / 2 * t * t * t + b;
			return c / 2 * ((t -= 2) * t * t + 2) + b;
		}


		public static function easeOutIn(t:Number, b:Number, c:Number, d:Number):Number {
			if (t < d / 2) return easeOut(t * 2, b, c / 2, d);
			return easeIn((t * 2) - d, b + c / 2, c / 2, d);
		}

		
	}
}
