package nocticos.commands;

import backend.System;
import nocticos.lib.command.Command.BaseCommand;

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
