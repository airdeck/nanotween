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
		
		/** Removes selected tweens associated attributes on a target object
		 *  @param target The object to search for that contains one or more tweens
		 *  @param attributes Array of attribute names as strings
		 */
		public static function removeTweens(target:Object, attributes:Array):void {
			var matches:Array = [];
			for each (var t:NanoTween in NanoTween.a) {
				if (t.target == target) matches.push(t);
			}
			for each (var match:NanoTween in matches) {
				for (var i:uint = 0; i < match.m.length; i++) {
					if (attributes.indexOf(match.m[i].n) != -1) {
						match.m.splice(i--,1);
					}
				}
			}
		}		

		/** Stops and removes all tweens associated with a target object
		 *  @param target The object to search for that contains one or more tweens
		 */
		public static function removeAllTweens(target:Object):void {
			var matches:Array = [];
			for each (var t:NanoTween in NanoTween.a) {
				if (t.target == target) matches.push(t);
			}
			for each (var match:NanoTween in matches) match.stop(true);
		}
	}
}
