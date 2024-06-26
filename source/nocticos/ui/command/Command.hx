package nocticos.ui.command;

using StringTools;

class Command {
	public static var commandsList:Array<Dynamic> = [];

	public static function insantiateCommand(commandInstance:BaseCommand):Void {}

	public static function getCommandsList():Void
	{
		for (i in 0...commandsList.length) {
			Sys.print(commandsList[i] + '\n\n');
		}
	}

	public static function getCommandName(?index:Int = 0):String {
		return commandsList[index][0];
	}

	public static function getCommandAliases(?index:Int = 0):Array<String> {
		return commandsList[index][1].split(' | ');
	}

	public static function getCommandFlags(?index:Int = 0):Array<String> {
		return commandsList[index][2].split(', ');
	}

	public static function getCommandDescription(?index:Int = 0):String {
		return commandsList[index][3];
	}
}

class BaseCommand {
	public function new(flags:Array<String>):Void {}
}
