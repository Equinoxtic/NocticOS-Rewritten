package nocticos.ui;

import nocticos.ui.display.text.TypedText;

enum PromptType
{
	DEFAULT;
}

class Prompt {
	/**
	 * Creates a new user prompt.
	 * @param promptType The type of the prompt.
	 * @param promptString The string/message of the prompt.
	 * @param newline Whether the prompt starts/ends with a newline.
	 */
	public function new(promptType:Null<PromptType>, ?promptString:String = "Continue?", ?newline:Bool = true):Void {
		if (promptType == null) {
			return;
		}

		if (newline) {
			Sys.stdout().writeString('\n\n');
		}

		switch(promptType) {
			case DEFAULT:
				new TypedText(promptString, DEFAULT);
				Sys.getChar(false);
		}
	}
}