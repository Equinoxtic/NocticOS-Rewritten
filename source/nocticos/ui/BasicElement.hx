package nocticos.ui;

#if (debug)
import nocticos.lib.io.StandardOutput;
#end
import nocticos.lib.StringFunctions;

class BasicElement {
	private var m_Properties:Map<String, Dynamic> = [];

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
		if (StringFunctions.isNullOrEmpty(key) || value == null) {
			return;
		}
		m_Properties.set(key, value);
	}

	/**
	 * Gets the property of an element.
	 * @param key The key of the element's property.
	 * @return Dynamic
	 */
	public function getProperty(key:String):Dynamic {
		if (StringFunctions.isNullOrEmpty(key)) {
			return null;
		}
		return m_Properties[key];
	}
}
