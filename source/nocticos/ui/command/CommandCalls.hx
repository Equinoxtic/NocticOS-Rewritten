package nocticos.ui.command;

import nocticos.lib.StringFunctions;
import nocticos.ui.command.Command;

class CommandCalls {
	public static function parseCommand(baseCommand:String, flags:Array<String>):Void {
		var currentCommand:CommandProperties = null;

		for (i in 0 ... Command.commandsList.length) {
			currentCommand = Command.commandsList[i];
			if (StringFunctions.compare(baseCommand, currentCommand.name)) {
				break;
			}
		}

		if (currentCommand != null) {
			if (StringFunctions.compare(baseCommand, currentCommand.name)) {
				Command.insantiateCommand(currentCommand.commandClass, flags);
			} else {
				Instance.instantiate(new nocticos.ui.states.InvalidCommandState());
			}

			for (i in 0 ... currentCommand.aliases.length) {
				var alias = currentCommand.aliases[i];
				if (StringFunctions.compare(baseCommand, alias)) {
					Command.insantiateCommand(currentCommand.commandClass, flags);
				}
			}
		}
	}
}
