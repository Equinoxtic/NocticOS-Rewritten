package nocticos.commands;

import nocticos.lib.Logging;
import backend.System;
import nocticos.ui.command.Command.BaseCommand;

class OutputSessionLogs extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		System._CLRSCR();
		Logging.readLogs();
	}
}
