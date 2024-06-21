package nocticos.ui.command;

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
				Instance.instantiate(new nocticos.ui.MainScreen());

			case "clear" | "clr" | "cls" | "clrscr":
				System._CLRSCR();

			default:
				Instance.instantiate(new nocticos.ui.InvalidCommandState());
		}
	}
}
