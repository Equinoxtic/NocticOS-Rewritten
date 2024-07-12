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

	public static function getCommandData(?index:Int = 0, ?commandDataType:Null<CommandData> = NAME):Dynamic {
		var targetedIndex:Int = 0;
		if (!commandDataType.equals(CommandData.ALIASES) && !commandDataType.equals(CommandData.FLAGS)) {
			if (commandDataType.equals(CommandData.DESCRIPTION)) {
				targetedIndex = 3;
			}
		} else {
			if (commandDataType.equals(CommandData.ALIASES)) {
				return commandsList[index][1].split(' | ');
			}
			if (commandDataType.equals(CommandData.FLAGS)) {
				return commandsList[index][2].split(', ');
			}
		}
		return commandsList[index][targetedIndex];
	}
}

class BaseCommand {
	public function new(flags:Array<String>):Void {}
}
