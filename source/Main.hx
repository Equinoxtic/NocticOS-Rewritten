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
		// Run UpdateChecker class first.
		UpdateChecker.check();

		// Push and initialize commandsList.
		for (i in 0...Variables.commandsList.length) {
			CommandUtility.pushCommand(
				Variables.commandsList[i][0],
				Variables.commandsList[i][1],
				Variables.commandsList[i][2],
				Variables.commandsList[i][3],
				i+1
			);
		}

		Thread.sleep(0.025);
		System._CLRSCR();

		// Instantiate the MainScreen class.
		Instance.instantiate(targetState, true);
	}
}
