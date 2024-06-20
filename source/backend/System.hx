package backend;

class System {
	public static function _EXIT(?code:Int = 0):Void {
		_CLRSCR();
		Sys.exit(code);
	}

	public static function _CLRSCR():Void {
		#if !linux
		Sys.command("cls", null);
		#else
		Sys.command("clear", null);
		#end
	}
}
