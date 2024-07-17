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

	static final highlightColorMap:Map<Color, Attribute> = [
		WHITE 		=> WhiteBack,
		BLACK		=> BlackBack,
		RED			=> RedBack,
		GREEN		=> GreenBack,
		YELLOW		=> YellowBack,
		MAGENTA		=> MagentaBack,
		BLUE		=> BlueBack,
		CYAN		=> CyanBack
	];

	/**
	 * Sets the color of the given text by a given color.
	 * @param text The string/text to be colored.
	 * @param textColor The color of the text.
	 * @return String
	 */
	public static function setColor(text:Null<String>, textColor:Null<Color>):String {
		if (text == null || textColor == null) {
			return "";
		}
		return ANSI.set(textColorMap[textColor]) + text + ANSI.set(Off);
	}

	/**
	 * Highlights the given text by a given base and highlight color.
	 * @param text The string/text to be colored.
	 * @param textColor The color of the text.
	 * @param highlightColor The color of the highlight.
	 * @return String
	 */
	public static function setHighlight(text:Null<String>, textColor:Null<Color>, highlightColor:Null<Color>):String {
		if (text == null || textColor == null || highlightColor == null) {
			return "";
		}
		return ANSI.set(highlightColorMap[highlightColor]) + ANSI.set(textColorMap[textColor]) + text + ANSI.set(Off);
	}
}
