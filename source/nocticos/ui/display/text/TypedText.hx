package nocticos.ui.display.text;

import nocticos.ui.display.text.Text.TextCase;
import nocticos.ui.display.text.Text.TextColor;
import nocticos.ui.display.text.effects.TypeEffect;

enum TextType {
	DEFAULT;
	DEFAULT_FAST;
	QUICK;
	PROMPT;
	INSTANT;
	INSTANT_PROMPT;
}

class TypedText extends Text {
	/**
	 * Create a new text with the typing effect.
	 * @param text The string of the text.
	 * @param type The type of the text.
	 */
	public function new(text:String, ?type:Null<TextType> = DEFAULT, ?textColor:Null<TextColor> = WHITE):Void {
		super(text, TextCase.DEFAULT, textColor, false);

		if (type != null) {
			switch(type) {
				case DEFAULT:
					TypeEffect.type(content, 25);

				case DEFAULT_FAST:
					TypeEffect.type(content, 5);

				case QUICK:
					TypeEffect.type(content, 1);

				case PROMPT:
					TypeEffect.type(content, 25);
					Thread.sleepMS(200); Sys.print(" ");
					TypeEffect.type('${Variables.PROMPT_STRING}: ', 10);

				case INSTANT:
					Sys.print(content);

				case INSTANT_PROMPT:
					Sys.print('${content} ${Variables.PROMPT_STRING}');
			}
		} else {
			return;
		}
	}
}
