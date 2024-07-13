package nocticos.ui.command;

using StringTools;

enum CommandData {
	NAME;
	ALIASES;
	FLAGS;
	DESCRIPTION;
}

class Command {
	public static var commandsList:Array<Dynamic> = [];

	public static function insantiateCommand(commandInstance:BaseCommand):Void {}

	public static function getCommandsList():Void
	{
		for (i in 0...commandsList.length) {
			Sys.print(commandsList[i] + '\n\n');
		}
	}
}

class BaseCommand {
	public function new(flags:Array<String>):Void {}
}
