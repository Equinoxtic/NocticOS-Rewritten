package nocticos.ui.display.text;

import nocticos.ui.display.text.Text.TextCase;
import nocticos.ui.display.text.Text.TextColor;

enum TextType {
	DEFAULT;
	DEFAULT_FAST;
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
					typeEffectText(content, 25);

				case DEFAULT_FAST:
					typeEffectText(content, 5);

				case PROMPT:
					typeEffectText(content, 25);
					Thread.sleepMS(200); Sys.print(" ");
					typeEffectText('${Variables.PROMPT_STRING}: ', 10);

				case INSTANT:
					Sys.stdout().writeString(content);

				case INSTANT_PROMPT:
					Sys.stdout().writeString('${content} ${Variables.PROMPT_STRING}');
			}
		} else {
			return;
		}

		#if debug
		Sys.print("\n\nCreated TypedText Instance\n\n");
		#end
	}

	private function typeEffectText(text:String, ?delayMS:Int = 10):Void {
		if (text == null || text == "")
			return;
		if (text.length > 0 && delayMS >= 0) {
			for (i in 0...text.length) {
				Sys.stdout().writeString(text.charAt(i));
				Thread.sleepMS(delayMS);
			}
		}
	}
}