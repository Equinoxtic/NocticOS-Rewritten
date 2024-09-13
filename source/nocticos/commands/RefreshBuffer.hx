package nocticos.commands;

import backend.System;
import nocticos.ui.command.Command.BaseCommand;

class RefreshBuffer extends BaseCommand {
	public function new(flags:Array<String>):Void {
		super(flags);
		System._CLRSCR();
		Instance.instantiate(new nocticos.ui.states.MainScreen());
	}
}
