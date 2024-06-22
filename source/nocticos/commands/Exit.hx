package nocticos.commands;

import nocticos.ui.command.Command;
import nocticos.ui.command.Command.BaseCommand;
import backend.System;

class Exit extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		if (flags != null) {
			flags.pop();
		}
		if (Command.commandsList != null) {
			Command.commandsList.pop();
		}
		#if (debug)
		Sys.print("Clearing data...");
		#end
		System._EXIT(0);
	}
}
