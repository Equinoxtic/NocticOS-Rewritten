package nocticos.input;

import nocticos.ui.display.text.TypedText;

using StringTools;

class Input {
	public function new(inputDialogue:String):Void {
		if (inputDialogue == null || inputDialogue == '') {
			new TypedText('', DEFAULT);
		} else {
			new TypedText('[${inputDialogue}]: ');
		}

		var userInput:String = Sys.stdin().readLine();

		if (userInput != null) {
			Parser.parseCommandInput(userInput);
		}
	}
}