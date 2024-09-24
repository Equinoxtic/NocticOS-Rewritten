package nocticos.input;

import nocticos.lib.Logging;
import nocticos.ui.command.CommandCalls;

using StringTools;

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
		final sCmd = flags[0].trim(); // flags[0] is the main command (i.e. "> help")
		currentCommand = sCmd;
		_logRunCommand(sCmd, flags);
		flags.remove(sCmd);
		trace(sCmd);
		CommandCalls.parseCommand(sCmd, flags);
	}

	@:noPrivateAccess
	public static function _logRunCommand(cmd:String, flags:Array<String>):Void {
		if (!(flags.length - 1 <= 0)) {
			for (flag in 0...flags.length - 1) {
				Logging.logMessage('[Command Ran: ${cmd}] -> Flag(s): ${flags[flag+1]}\n');
			}
		} else {
			Logging.logMessage('[Command Ran: ${cmd}]\n');
		}
	}
}
