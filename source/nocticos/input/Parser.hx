package nocticos.input;

import nocticos.ui.command.CommandCalls;

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

		#if (debug)
		for (flag in 0...flags.length) {
			if (flags[flag+1] != null) {
				Sys.print('${sCmd} flag: ${flags[flag+1]}\n');
			}
		}
		#end

		currentCommand = sCmd;

		CommandCalls.parseCommand(sCmd, flags);
	}
}
