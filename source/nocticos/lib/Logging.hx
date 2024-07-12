package nocticos.lib;

import backend.ANSI;
import nocticos.util.StringFormatter;

using nocticos.util.StringUtil;
using StringTools;

class Logging {
	public static function logMessage(?message:String):Void {
		FileStream.writeFile('logs/latest.txt', '{0}: {1}\n'.format([
			StringFormatter.mappedSurround(Std.string(Date.now()), ['[', ']']),
			message
		]));
	}
}
