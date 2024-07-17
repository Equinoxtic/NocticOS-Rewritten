package nocticos.ui;

#if (debug)
import nocticos.lib.io.StandardOutput;
#end

class BasicElement {
	private var _elementProperties:Map<String, Dynamic> = [];

	/**
	 * Creates a basis of an element.
	 */
	public function new():Void {}

	/**
	 * Pushes a given property of the element, can be useful for elements that need to be reused again at some point.
	 * @param key The key of the property.
	 * @param value The value of the property.
	 */
	public function pushProperty(key:String, value:Dynamic):Void {
		if (key == null || key.charAt(0) == '' || value == null) {
			return;
		}
		#if (debug)
		StandardOutput.print('Pushed Property: $key => $value');
		#end
		_elementProperties.set(key, value);
	}

	/**
	 * Gets the property of an element.
	 * @param key The key of the element's property.
	 * @return Dynamic
	 */
	public function getProperty(key:String):Dynamic {
		if (key == null || key.charAt(0) == '') {
			return null;
		}
		return _elementProperties[key];
	}
}
