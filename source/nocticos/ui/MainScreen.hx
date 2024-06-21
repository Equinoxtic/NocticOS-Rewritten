package nocticos.ui;

import nocticos.ui.command.Command;
import nocticos.input.Input;
import nocticos.ui.display.text.TypedText;
import backend.Instance;

using StringTools;

class MainScreen extends Instance {
	override function create():Void {
		new TypedText('[ ${Variables.APPLICATION_TITLE} - v${Variables.VERSION} ]', DEFAULT, BLUE);
		Sys.print("\n\n");
		new TypedText('> Welcome to ${Variables.GLOBAL_APPLICATION_NAME} (${Variables.VERSION}). Type in \'help -a\' to\nget started.\n\n', DEFAULT, WHITE);
		do {
			Sys.print('${Variables.COMMAND_LINE_PROMPT} ');
			new Input(null);
		} while (true);
		super.create();
	}
}
