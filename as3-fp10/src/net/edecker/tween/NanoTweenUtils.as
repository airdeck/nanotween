package net.edecker.tween {
	/**
	 * @author edecker
	 */
	public class NanoTweenUtils {
	
		/** Gets a list of all tweens associated with a target
		 *  @param target The object to search for that contains one or more tweens
		 *  @return list of NanoTween objects associated with the target
		 */
		public static function getTweens(target:Object):Array {
			var results:Array = [];
			for each (var t:NanoTween in NanoTween.a) {
				if (t.target == target) results.push(t);
			}
			return results;
		}
	}
}
