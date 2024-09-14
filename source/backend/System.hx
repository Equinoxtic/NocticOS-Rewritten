package backend;

class System {
	public static function _EXIT(?code:Int = 0, ?clearScreen:Bool = false):Void {
		if (clearScreen) {
			_CLRSCR();
		}
		Sys.exit(code);
	}

	public static function _CLRSCR():Void {
		Sys.command(#if (!linux) 'cls' #else 'clear' #end, null);
	}
}
