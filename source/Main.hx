import backend.FileStream;
import backend.FileStream.ItemType;
import sys.FileSystem;
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

	static final resourceFiles:Array<Dynamic> = [
		['logs', 		ItemType.DIRECTORY],
		['crash-logs',	ItemType.DIRECTORY]
	];

	/**
	 * The entry point of NocticOS.
	 */
	public static function main():Void {
		// Set the title of the application.
		Sys.print(ANSI.title(Variables.APPLICATION_TITLE));

		// Create, flush, write necessary/other resource files.
		for (i in 0...resourceFiles.length) {
			FileStream.newItem(resourceFiles[i][0], resourceFiles[i][1]);
		}

		FileStream.clearFile('logs/latest.txt');

		// Run UpdateChecker class first.
		UpdateChecker.check();

		System._CLRSCR();

		// Push and initialize commandsList.
		for (i in 0 ... Variables.commandsList.length) {
			CommandUtility.pushCommand(
				Variables.commandsList[i], i + 1
			);
		}

		Thread.sleep(1.0);
		System._CLRSCR();

		// Instantiate the MainScreen class.
		Instance.instantiate(targetState, true);
	}
}
