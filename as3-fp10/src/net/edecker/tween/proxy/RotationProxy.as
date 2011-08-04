package net.edecker.tween.proxy {
	/**
	 * @author edecker
	 */
	public class RotationProxy {

		private var _target:Object;
		private var _value:Number;
		private var _attributeName:String;

		public function RotationProxy(target:Object, value:Number = 0, attributeName:String = "rotation") {
			_attributeName = attributeName;
			_value = value;
			_target = target;
			apply();
		}
		
		public function set value(v:Number):void {
			_value = v;
			apply();
		}
		public function get value():Number {
			return _value;
		}

		private function apply():void {
			_target[_attributeName] = _value%360;
		}

	}
}
