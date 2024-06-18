import nocticos.util.Thread;
import backend.System;
import nocticos.Variables;
import nocticos.lib.command.Command;
import backend.Instance;
import nocticos.ui.MainScreen;

class Main {
	public static function main():Void {
		// Push and initialize commandsList.
		for (i in 0...Variables.commandsList.length) {
			Command._commandsList.push(
				[
					Variables.commandsList[i][0],
					Variables.commandsList[i][1],
					Variables.commandsList[i][2],
					Variables.commandsList[i][3]
				]
			);

			Sys.stdout().writeString(
				'(${i + 1}): [PUSHED COMMAND] > ${Variables.commandsList[i][0]} '
				+ ':'
				+ ' [${Variables.commandsList[i][1]}] : [${Variables.commandsList[i][2]}]'
				+ '-'
				+ ' \"${Variables.commandsList[i][3]}\"\n');
		}

		Thread.sleepMS(150);
		System._CLRSCR();

		// Instantiate the MainScreen class.
		Instance.instantiate(new MainScreen(), true);
	}
}
