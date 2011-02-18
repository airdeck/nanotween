package net.edecker.tween {
	/**
	 * Various utilities to be used with NanoTween.
	 * <p>The utilites are kept in a seperate class to keep filesize down. Thus, the NanoTweenUtils
	 * class is only compiled as it is needed.</p>
	 * @author edecker
	 */
	public class NanoTweenUtils {
	
		/** Gets a list of all tweens associated with a target object
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
		
		/** Stops and removes all tweens associated with a target object
		 *  @param target The object to search for that contains one or more tweens
		 */
		public static function removeAllTweensOnObject(target:Object):void {
			var matches:Array = [];
			for each (var t:NanoTween in NanoTween.a) {
				if (t.target == target) matches.push(t);
			}
			for each (var match:NanoTween in matches) match.stop(true);
		}
	}
}
