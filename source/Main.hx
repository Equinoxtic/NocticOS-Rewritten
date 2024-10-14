import nocticos.lib.Logging;
import nocticos.ui.command.Command.CommandProperties;
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
	private static final targetState:MainScreen = new MainScreen();

	private static final resourceFiles:Array<Dynamic> = [
		['logs', 		ItemType.DIRECTORY],
		['crash-logs',	ItemType.DIRECTORY]
	];

	private static final COMMANDS:Map<String, CommandProperties> = [
		'help' => {
			name: 'help',
			commandClass: nocticos.commands.Help,
			description: 'Shows the list of available commands for ${Variables.GLOBAL_APPLICATION_NAME}.',
			flags: [ '--all', '-a' ],
			aliases: [ 'cmds' ]
		},

		'clear' => {
			name: 'clear',
			commandClass: nocticos.commands.ClearScreen,
			description: 'Clears the current text on the screen.',
			flags: [ 'NO_FLAGS' ],
			aliases: [ 'clr', 'cls', 'clrscr' ]
		},

		'reload' => {
			name: 'reload',
			commandClass: nocticos.commands.RefreshBuffer,
			description: 'Refreshes / reloads the entire system.',
			flags: [ 'NO_FLAGS' ],
			aliases: [ 'refresh', 'rbuf', 'refbuf' ]
		},

		'logs' => {
			name: 'logs',
			commandClass: nocticos.commands.OutputSessionLogs,
			description: 'Opens the log file of the current session.',
			flags: [ 'NO_FLAGS' ],
			aliases: [ 'NO_ALIASES' ]
		},

		'exit' => {
			name: 'exit',
			commandClass: nocticos.commands.Exit,
			description: 'Exits out of ${Variables.GLOBAL_APPLICATION_NAME}.',
			flags: [ 'NO_FLAGS' ],
			aliases: [ 'quit', 'q' ]
		}
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

		// Start initialization phase.
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
		var index:Int = 0;
		for (k => v in COMMANDS) {
			index += 1;
			CommandUtility.mapCommand(v, index + 1);
			Logging.logMessage('Initialized Command \'$k\': $v');
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
