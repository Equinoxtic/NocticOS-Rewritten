package nocticos.lib;

using nocticos.util.StringUtil;
using StringTools;

class Logging {
	private static final LOG_FILE:String = 'logs/latest.txt';

	public static function logMessage(?message:String):Void {
		FileStream.writeFile(LOG_FILE, '[{0}]: {1}\n'.format([
			Std.string(Date.now()), message
		]));
	}

	public static function readLogs():Void {
		Sys.print('${FileStream.readFile(LOG_FILE)}\n');
	}
}
