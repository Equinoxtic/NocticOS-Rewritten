package nocticos.lib;

import backend.ANSI;
import backend.ANSI.Attribute;

enum Color {
	WHITE;
	BLACK;
	RED;
	GREEN;
	YELLOW;
	BLUE;
	MAGENTA;
	CYAN;
}

class Colorizer {
	static final textColorMap:Map<Color, Attribute> = [
		WHITE 		=> White,
		BLACK		=> Black,
		RED			=> Red,
		GREEN		=> Green,
		YELLOW		=> Yellow,
		MAGENTA		=> Magenta,
		BLUE		=> Blue,
		CYAN		=> Cyan
	];

	public static function setColor(text:String, textColor:Null<Color>):String {
		if (text == null || textColor == null) {
			return "";
		}
		return ANSI.set(textColorMap[textColor]) + text + ANSI.set(Off);
	}
}
