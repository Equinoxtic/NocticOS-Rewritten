package nocticos.commands;

import sys.FileSystem;
import nocticos.lib.Logging;
import backend.System;
import nocticos.ui.command.Command.BaseCommand;

class OutputSessionLogs extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		System._CLRSCR();
		if (FileSystem.exists('logs/latest.txt')) {
			Logging.readLogs();
		}
	}
}
