package nocticos.lib.io;

class StandardOutput {
	/**
	 * Prints and outputs a string.
	 * @param _string The string to output.
	 */
	public static function print(_string:Null<String>):Void {
		if (_string == null) {
			return;
		}
		Sys.print('[${Variables.getOutputSymbol(OutputSymbols.INFO)}]: ${_string}');
	}

	/**
	 * Prints and outputs a string with a newline.
	 * @param _string The string to output.
	 */
	public static function println(_string:Null<String>):Void {
		print('$_string\n');
	}
}
