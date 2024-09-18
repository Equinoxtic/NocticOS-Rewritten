package nocticos.ui.display.text;

import nocticos.util.StringFormatter;
import nocticos.lib.Colorizer.Color;
import nocticos.ui.display.text.effects.TypeEffect;

enum TextType {
	DEFAULT;
	DEFAULT_FAST;
	QUICK;
}

class TypedText extends Text {
	/**
	 * Create a new text with the typing effect.
	 * @param text The string of the text.
	 * @param type The type of the text.
	 */
	public function new(text:String, ?type:Null<TextType> = DEFAULT, ?textColor:Null<Color> = Color.WHITE):Void {
		super(text, textColor, false);
		if (type != null) {
			var speed:Float = 0.0;
			switch(type) {
				case DEFAULT:
					speed = 0.02;
				case DEFAULT_FAST:
					speed = 0.005;
				case QUICK:
					speed = 0.001;
			}
			TypeEffect.type(
				StringFormatter.color(this.getProperty('content'), this.getProperty('color')), speed
			);
		} else {
			return;
		}
	}
}
