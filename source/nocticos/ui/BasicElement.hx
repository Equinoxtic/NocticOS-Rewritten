package nocticos.ui;

class BasicElement {
	private var _elementProperties:Map<String, Dynamic> = [];

	public function new():Void {}

	public function pushProperty(key:String, value:Dynamic):Void {
		if (key == null || key.charAt(0) == '' || value == null) {
			return;
		}
		#if (debug)
		StandardOutput.print('Pushed Property: $key => $value');
		#end
		_elementProperties.set(key, value);
	}

	public function getProperty(key:String):Dynamic {
		if (key == null || key.charAt(0) == '') {
			return null;
		}
		return _elementProperties[key];
	}
}
