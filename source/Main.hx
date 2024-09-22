import nocticos.lib.StringID;
import nocticos.util.Thread;
import nocticos.lib.Colorizer.Color;
import nocticos.util.StringFormatter;
import nocticos.lib.io.StandardOutput;
import backend.FileStream;
import backend.FileStream.ItemType;
import backend.ANSI;
import nocticos.ui.states.UpdateChecker;
import nocticos.util.CommandUtility;
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
		createResources();

		// Run UpdateChecker class first.
		UpdateChecker.check();

		System._CLRSCR();

		// Start initialization.
		initializationState();

		System._CLRSCR();

		// Instantiate the MainScreen class.
		Instance.instantiate(targetState, true);
	}

	@:noPrivateAccess
	private static function initializationState():Void {
		StandardOutput.println(StringFormatter.mappedSurround(
			StringFormatter.color('Initialization Phase ...', Color.GREEN), [ '[', ']' ]
		));
		// Push and initialize commandsList.
		@:privateAccess
		for (i in 0 ... Variables.commandsList.length) {
			CommandUtility.pushCommand(
				Variables.commandsList[i], i + 1
			);
		}
		Thread.sleepMS(1000);
	}

	@:noPrivateAccess
	private static function createResources():Void {
		for (i in 0...resourceFiles.length) {
			FileStream.newItem(resourceFiles[i][0], resourceFiles[i][1]);
		}
		FileStream.clearFile('logs/latest.txt');
	}
}
