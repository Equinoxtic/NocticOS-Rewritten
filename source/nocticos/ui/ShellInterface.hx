package nocticos.ui;

class ShellInterface {
	/**
	 * Creates a new shell with the given attributes:
	 *
	 * ```
	 * // List of properties.
	 * [
	 *    SYMBOL: String
	 *    ID: Int
	 *    COLOR: Color
	 *    HAS_BACKGROUND: Boolean
	 *    BACKGROUND_COLOR: Color
	 * ]
	 * ```
	 *
	 * @param shellAttributes
	 * @param color
	 */
	public function new(shellAttributes:Null<Array<Dynamic>>, ?color:Bool = true):Void {
		if (shellAttributes != null) {
			for (attributeIndex in 0...shellAttributes.length) {
				ShellRenderer.stage(
					shellAttributes[attributeIndex][0],
					(attributeIndex + 1),
					((color) ? shellAttributes[attributeIndex][1] : null)
				);
			}
			Sys.print(" ");
		}
	}
}
