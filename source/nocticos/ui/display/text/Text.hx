package nocticos.ui.display.text;

import backend.ANSI;


enum TextColor {
	WHITE;
	BLACK;
	RED;
	GREEN;
	YELLOW;
	BLUE;
	MAGENTA;
	CYAN;
}

enum TextCase {
	DEFAULT;
	UPPERCASE;
	LOWERCASE;
}

class Text {
	public var content:String = "";

	/**
	 * Create a new text. (Modified string type.)
	 * @param text The string of the text
	 * @param textCase The case of the text. (i.e. LOWECASE / UPPERCASE)
	 * @param cout Should the text be displayed in the output?
	 */
	public function new(text:String, ?textCase:Null<TextCase> = DEFAULT, ?textColor:Null<TextColor>, ?cout:Bool = false):Void {
		if (text == null || text == '')
			return;

		var newString:String = text;
		if (textCase != null) {
			switch(textCase) {
				case UPPERCASE:
					newString = text.toUpperCase();
				case LOWERCASE:
					newString = text.toLowerCase();
				default:
					newString = text;
			}
		} else {
			return;
		}

		content = translateColors(newString, textColor);

		if (cout) {
			Sys.stdout().writeString(content);
		}

		#if debug
		Sys.print("\n\nCreated Text Instance\n\n");
		#end
	}

	private function translateColors(text:String, textColor:Null<TextColor>):String {
		if (textColor == null)
			return "";

		var result:String = ANSI.set(White) + text;

		final textPresets:Array<Dynamic> = [
			[WHITE, White],
			[BLACK, Black],
			[RED, Red],
			[GREEN, Green],
			[YELLOW, Yellow],
			[MAGENTA, Magenta],
			[BLUE, Blue],
			[CYAN, Cyan],
		];

		for (i in 0...textPresets.length) {
			if (textColor.equals(textPresets[i][0])) {
				result = ANSI.set(textPresets[i][1]) + text;
				break;
			}
		}

		return result + ANSI.set(Off);
	}
}