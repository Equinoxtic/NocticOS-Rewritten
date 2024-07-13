package nocticos.ui.command;

import nocticos.lib.Logging;
import backend.System;
import nocticos.commands.Exit;
import nocticos.commands.Help;
import nocticos.ui.command.Command;

class CommandCalls {
	public static function parseCommand(baseCommand:String, flags:Array<String>):Void {
		switch(baseCommand) {
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
		}
	}
}
