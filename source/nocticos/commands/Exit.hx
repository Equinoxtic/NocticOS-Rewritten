package nocticos.commands;

import nocticos.ui.command.Command.BaseCommand;
import backend.System;

class Exit extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		if (flags != null) {
			flags.pop();
		}
		#if (debug)
		Sys.print("\nPopping flags and exiting...\n\n");
		#end
		System._EXIT(0);
	}
}
