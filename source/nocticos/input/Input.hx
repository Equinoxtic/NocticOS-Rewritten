package nocticos.input;

import nocticos.ui.display.text.TypedText;

using StringTools;

class Input {
	public function new(inputPromptMessage:String):Void {
		if (inputPromptMessage == null || inputPromptMessage == '') {
			new TypedText('', DEFAULT);
		} else {
			new TypedText('[${inputPromptMessage}]: ');
		}

		var userInput:String = Sys.stdin().readLine();

		Parser.parseCommandInput(userInput);
	}
}