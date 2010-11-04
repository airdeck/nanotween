package net.edecker.tween.proxy.filters {
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilter;
	/**
	 * @author edecker
	 */
	public class AbstractFilterProxy {
	
		public  var target:DisplayObject;	//target display object
		private var f:BitmapFilter;			//filter
		private var i:int = -1;				//index of filter in target filter array
	
		public function AbstractFilterProxy(filter:BitmapFilter) {
			f = filter;
		}
		
		/** update, reapplies the filter.
		 * The first time update is called the filter is added to the target and the index of the filter is returned.
		 * For any updates after the filter is spliced out and replaced based in its index value
		 */
		protected function u():void {
			if (target) {
				if (i < 0) {
					target.filters = target.filters.concat(f);
					i = target.filters.length-1;
				}else{
					var duplicate:Array = target.filters;
					duplicate.splice(i, 1, f);
					target.filters = duplicate;
				}
			}
		}
	}
}
