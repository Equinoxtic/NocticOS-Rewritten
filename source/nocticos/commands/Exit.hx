package nocticos.commands;

import nocticos.util.ArrayUtil;
import nocticos.ui.command.Command;
import nocticos.ui.command.Command.BaseCommand;
import backend.System;

class Exit extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		if (flags != null) {
			ArrayUtil.clearArray(flags);
		}
		if (Command.commandsList != null) {
			ArrayUtil.clearArray(Command.commandsList);
		}
		System._EXIT(0);
	}
}
