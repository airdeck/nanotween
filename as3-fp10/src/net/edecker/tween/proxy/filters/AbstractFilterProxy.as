package net.edecker.tween.proxy.filters {
	import flash.utils.getQualifiedClassName;
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilter;
	/**
	 * @author edecker
	 */
	public class AbstractFilterProxy {
	
		private var t:Array = [];
		private var f:BitmapFilter;
	
		public function AbstractFilterProxy(filter:BitmapFilter) {
			f = filter;
		}
		
		public function addTarget(target:DisplayObject):void {
			t.push(target);
		}
		
		public function removeTarget(target:DisplayObject):void {
			var index:int = t.indexOf(target);
			if (index > -1) t.splice(index,1);
		}
		
		protected function u():void {
			for each (var target:DisplayObject in t) {
				var match:Boolean;
				for (var i:uint = 0; i < target.filters.length; i++) {
					if (getQualifiedClassName(target.filters[i]) == getQualifiedClassName(f)) {
						match = true;
						var duplicate:Array = target.filters;
						duplicate.splice(i, 1, f);
						target.filters = duplicate;
					}
				}
				if (!match) target.filters = target.filters.concat(f);
			}
		}
	}
}
