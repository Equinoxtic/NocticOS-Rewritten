package nocticos.lib.io;

class StandardOutput {
	public static function print(_string:String, ?end:String = "\n"):Void {
		if (_string == null || _string.charAt(0) == '') {
			return;
		}
		Sys.print('[${Variables.getOutputSymbol(OutputSymbols.INFO)}]: ${_string}${end}');
	}
}
