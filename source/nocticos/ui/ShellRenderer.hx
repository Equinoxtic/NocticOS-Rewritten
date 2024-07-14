package nocticos.ui;

import haxe.io.Bytes;
import nocticos.lib.Logging;
import nocticos.util.StringFormatter;
import nocticos.lib.Colorizer.Color;

using nocticos.util.StringUtil;

class ShellRenderer {
	public static function stage(symbol:Null<String>, id:Null<Int>, ?color:Null<Color> = WHITE, ?hasBackground:Bool = false, ?backgroundColor:Null<Color> = CYAN):Void {
		Logging.logMessage('Staged and Registered symbol \"{0}\" with ID: {1}'.format([
			symbol, id + 100
		]));
		if (color != null) {
			if (!hasBackground) {
				Sys.print(StringFormatter.color(symbol, color, false));
			} else {
				Sys.print(StringFormatter.highlight(symbol, color, backgroundColor));
			}
		} else {
			Sys.print(symbol);
		}
	}
}
