import backend.ANSI;
import nocticos.ui.states.UpdateChecker;
import nocticos.ui.Prompt;
import nocticos.ui.display.text.TypedText;
import nocticos.util.CommandUtility;
import nocticos.util.Thread;
import backend.System;
import nocticos.Variables;
import backend.Instance;
import nocticos.ui.states.MainScreen;

class Main {
	/**
	 * The targetted state to start with.
	 */
	static final targetState:MainScreen = new MainScreen();

	/**
	 * The entry point of NocticOS.
	 */
	public static function main():Void {
		// Set the title of the application.
		Sys.print(ANSI.title(Variables.APPLICATION_TITLE));

		// Run UpdateChecker class first.
		UpdateChecker.check();

		System._CLRSCR();

		// Push and initialize commandsList.
		for (commandIndex in 0...Variables.commandsList.length) {
			CommandUtility.pushCommand(
				Variables.commandsList[commandIndex][0],
				Variables.commandsList[commandIndex][1],
				Variables.commandsList[commandIndex][2],
				Variables.commandsList[commandIndex][3],
				commandIndex + 1
			);
		}

		Thread.sleep(1.0);
		System._CLRSCR();

		// Instantiate the MainScreen class.
		Instance.instantiate(targetState, true);
	}
}
