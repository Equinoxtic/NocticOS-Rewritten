package nocticos.ui.command;

import nocticos.lib.StringFunctions;
import nocticos.ui.command.Command;

class CommandCalls {
	public static function parseCommand(baseCommand:String, flags:Array<String>):Void {
		var currentCommand:CommandProperties = _getCurrentCommand(baseCommand);
		if (currentCommand != null) {
			if (StringFunctions.compare(baseCommand, currentCommand.name) || StringFunctions.compare(baseCommand, _getCurrentAliasOfCommand(baseCommand, currentCommand))) {
				Command.insantiateCommand(currentCommand.commandClass, flags);
			} else {
				Instance.instantiate(new nocticos.ui.states.InvalidCommandState());
			}
		}
	}

	@:noPrivateAccess
	private static function _getCurrentCommand(_command_s:String):CommandProperties {
		var c:CommandProperties = null;
		for (i in 0 ... Command.commandsList.length) {
			c = Command.commandsList[i];
			if (StringFunctions.compare(_command_s, c.name) || StringFunctions.compare(_command_s, _getCurrentAliasOfCommand(_command_s, c))) {
				break;
			}
		}
		return c;
	}

	@:noPrivateAccess
	private static function _getCurrentAliasOfCommand(_command_s:String, _command_t:CommandProperties):String {
		var alias:String = '';
		for (i in 0 ... _command_t.aliases.length) {
			alias = _command_t.aliases[i];
			if (StringFunctions.compare(_command_s, alias)) {
				break;
			}
		}
		return alias;
	}
}
