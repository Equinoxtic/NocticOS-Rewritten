package nocticos.ui.display.text;

import nocticos.util.StringFormatter;
import nocticos.lib.Colorizer.Color;
import backend.ANSI;

class Text extends BasicElement {
	/**
	 * Create a new text. (Modified string type.)
	 * @param text The string of the text
	 * @param textCase The case of the text. (i.e. LOWECASE / UPPERCASE)
	 * @param cout Should the text be displayed in the output?
	 */
	public function new(text:String, textColor:Null<Color>, ?cout:Bool = false):Void {
		super();
		if (text == null || text == '') {
			return;
		}
		this.pushProperty('content', text);
		this.pushProperty('color', textColor);
		if (cout) {
			Sys.print(StringFormatter.color(this.getProperty('content'), this.getProperty('color')));
		}
	}
}
