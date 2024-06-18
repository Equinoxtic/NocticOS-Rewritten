package nocticos.ui;

import nocticos.input.Parser;
import nocticos.ui.display.text.TypedText;

using StringTools;

class InvalidCommandState extends Instance {
	override function create():Void {
		if (Parser.currentCommand != null && Parser.currentCommand != "") {
			new TypedText("\n> Invalid command: \"" + Parser.currentCommand + "\", please try again. ", DEFAULT_FAST, RED);
			Sys.stdin().readLine().split('\n')[0].trim();
			Sys.stdout().writeString('\n');
		}
		super.create();
	}
}
