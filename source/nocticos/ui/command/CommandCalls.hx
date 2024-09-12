package nocticos.ui.command;

import nocticos.lib.StringFunctions;
import nocticos.lib.Logging;
import backend.System;
import nocticos.commands.Exit;
import nocticos.commands.Help;
import nocticos.ui.command.Command;

class CommandCalls {
	public static function parseCommand(baseCommand:String, flags:Array<String>):Void {
		/* switch(baseCommand) {
			case "help" | "cmds":
				Command.insantiateCommand(new Help(flags));

			case "exit" | "quit" | "q":
				Command.insantiateCommand(new Exit(flags));

			case "reload" | "refresh" | "rbuf" | "refbuf":
				System._CLRSCR();
				Instance.instantiate(new nocticos.ui.states.MainScreen());

			case "clear" | "clr" | "cls" | "clrscr":
				System._CLRSCR();

			case "logs":
				System._CLRSCR();
				Logging.readLogs();

			default:
				Instance.instantiate(new nocticos.ui.states.InvalidCommandState());
		} */

		for (k => v in Command.commandsList) {
			if (StringFunctions.compare(baseCommand, v.name)) {
				Command.insantiateCommand(v.commandClass, flags);
			}

			for (i in 0 ... v.aliases.length) {
				var alias = v.aliases[i];
				if (StringFunctions.compare(baseCommand, alias)) {
					Command.insantiateCommand(v.commandClass, flags);
				}
			}
		}
	}
}
