package nocticos.ui;

import nocticos.lib.Logging;
import nocticos.util.StringFormatter;
import nocticos.lib.Colorizer.Color;

using nocticos.util.StringUtil;

class ShellRenderer {
	public static function stage(symbol:Null<String>, id:Null<Int>, ?color:Null<Color> = WHITE):Void {
		Logging.logMessage('Staged and Registered symbol \"{0}\" with ID: {1}'.format([
			symbol, id + 100
		]));
		if (color != null) {
			Sys.print(StringFormatter.color(symbol, color));
		} else {
			Sys.print(symbol);
		}
	}
}
