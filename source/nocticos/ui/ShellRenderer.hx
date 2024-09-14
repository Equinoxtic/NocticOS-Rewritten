package nocticos.ui;

import nocticos.lib.StringID;
import nocticos.lib.Logging;
import nocticos.util.StringFormatter;
import nocticos.lib.Colorizer.Color;

using nocticos.util.StringUtil;

class ShellRenderer {
	/**
	 * Stages the properties/attributes of the shell.
	 * @param symbol The symbol/character of the shell.
	 * @param id The ID of she shell.
	 * @param color The color of the symbol/character.
	 * @param hasBackground Whether the symbol should render a background.
	 * @param backgroundColor The background color of the symbol/character
	 */
	public static function stage(symbol:Null<String>, id:Null<Int>, ?color:Null<Color> = WHITE):Void {
		Logging.logMessage('Staged and Registered symbol \"{0}\" with ID: {1}'.format([
			symbol, StringID.assign(id)
		]));
		if (color != null) {
			Sys.print(StringFormatter.color(symbol, color, false));
		} else {
			Sys.print(symbol);
		}
	}
}
