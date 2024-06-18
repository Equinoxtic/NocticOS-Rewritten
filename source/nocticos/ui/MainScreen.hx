package nocticos.ui;

import nocticos.input.Input;
import nocticos.ui.display.text.TypedText;
import backend.Instance;

using StringTools;

class MainScreen extends Instance {
	override function create():Void {
		new TypedText('[ ${Variables.APPLICATION_TITLE} - v${Variables.VERSION} ]', DEFAULT, BLUE);
		Sys.stdout().writeString("\n\n");
		new TypedText('> Welcome to ${Variables.GLOBAL_APPLICATION_NAME} (${Variables.VERSION}). Type in \'help\' to\nget started.\n\n', DEFAULT, WHITE);

		do {
			Sys.stdout().writeString('~$ ');
			new Input(null);
		} while (true);

		super.create();
	}
}
