package nocticos.commands;

import backend.System;
import nocticos.ui.command.Command.BaseCommand;

class ClearScreen extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		System._CLRSCR();
	}
}
