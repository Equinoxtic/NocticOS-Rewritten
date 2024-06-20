package nocticos.input;

import nocticos.ui.CommandCalls;

class Parser {
	public static var currentCommand:String = "";

	public static function parseCommandInput(commandString:Null<String>):Void {
		if (commandString == null || commandString.length <= 0) {
			return;
		}

		var split:Array<String> = commandString.split(' ');
		var flags:Array<String> = [];

		for (flag in 0...split.length) {
			if (split[flag] != null) {
				flags.push(split[flag]);
			}
		}

		var sCmd = flags[0];

		currentCommand = sCmd;

		CommandCalls.parseCommand(sCmd, flags);
	}
}
