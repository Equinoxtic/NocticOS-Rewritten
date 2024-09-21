package nocticos.ui.states;

import nocticos.lib.Colorizer.Color;
import nocticos.input.Input;
import nocticos.ui.display.text.TypedText;
import backend.Instance;

using StringTools;

class MainScreen extends Instance {
	override function create():Void {
		new TypedText('[ ${Variables.APPLICATION_TITLE} - v${Variables.VERSION} ]', DEFAULT, Color.BLUE);
		Sys.print("\n\n");
		new TypedText('> Welcome to ${Variables.GLOBAL_APPLICATION_NAME} (${Variables.VERSION}). Type in \'help -a\' to\nget started.\n\n', DEFAULT, WHITE);
		do {
			// Initialize the interface for the shell prompt.
			new ShellInterface([
				{ symbol: ' ~ ', color: CYAN,     id: 1 },
				{ symbol: '$',   color: YELLOW,   id: 1 }
			], true);
			// Initialize Input Handler.
			new Input(null);
		} while (true);
		super.create();
	}
}
