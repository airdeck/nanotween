package net.edecker.tween.proxy.filters {
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilter;
	/**
	 * Base class for BitmapFilter proxy objects.
	 * @author edecker
	 */
	public class AbstractFilterProxy {
		
		/** The targeted DisplayObject that the filter will be applied to */
		public  var target:DisplayObject;	//target display object
		private var f:BitmapFilter;			//filter
		private var i:int = -1;				//index of filter in target filter array
	
		/** Creates a new AbstractFilterProxy.
		 * This class has no purpose by itself and is an abstract for implementing specific filters.
		 * @param filter Filter that will be applied to a specified target
		 */
		public function AbstractFilterProxy(filter:BitmapFilter) {
			f = filter;
		}
		
		/** Reapplies the filter.
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
