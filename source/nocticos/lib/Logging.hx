package nocticos.lib;

using nocticos.util.StringUtil;
using StringTools;

class Logging {
	public static function logMessage(?message:String):Void {
		FileStream.writeFile('logs/latest.txt', '[${Date.now()}]: ${message}\n');
	}
}
