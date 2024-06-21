import nocticos.util.CommandUtility;
import nocticos.util.Thread;
import backend.System;
import nocticos.Variables;
import backend.Instance;
import nocticos.ui.MainScreen;

class Main {
	public static function main():Void {
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
		Instance.instantiate(new MainScreen(), true);
	}
}
