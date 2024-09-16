package nocticos.ui.command;

using StringTools;

enum CommandData {
	NAME;
	ALIASES;
	FLAGS;
	DESCRIPTION;
}

typedef CommandProperties = {
	var name:String;
	var commandClass:Class<BaseCommand>;
	var description:String;
	var flags:Array<String>;
	var aliases:Array<String>;
}

class Command {
	public static var commandsList:Array<CommandProperties> = [];

	public static function insantiateCommand(commandInstance:Class<BaseCommand>, flags:Array<String>):Void {
		Type.createInstance(commandInstance, [flags]);
	}

	public static function getCommandsList():Void {
		for (i in 0 ... commandsList.length) {
			Sys.print(commandsList[i] + '\n\n');
		}
	}
}

class BaseCommand {
	public function new(flags:Array<String>):Void {}
}
