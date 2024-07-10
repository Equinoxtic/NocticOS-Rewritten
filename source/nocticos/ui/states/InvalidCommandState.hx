package nocticos.ui.states;

import nocticos.input.Parser;
import nocticos.ui.display.text.TypedText;

using StringTools;

class InvalidCommandState extends Instance {
	override function create():Void {
		if (Parser.currentCommand != null && Parser.currentCommand != "") {
			new TypedText("\n> Invalid command: \"" + Parser.currentCommand + "\", please try again.\n", DEFAULT_FAST, RED);
			Sys.print('\n');
		}
		super.create();
	}
}
