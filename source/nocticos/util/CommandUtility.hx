package nocticos.util;

import nocticos.lib.StringFunctions;
import nocticos.lib.Logging;
import nocticos.types.StringBuffer;
import nocticos.lib.Colorizer.Color;
import nocticos.util.debug.Error;
import nocticos.ui.command.Command;

using nocticos.util.StringUtil;

class CommandUtility {
	public static function pushCommand(commandProperties:Null<CommandProperties>, ?id:Null<Int> = null):Void {
		if (commandProperties == null) {
			return;
		}

		var stringBuffer:StringBuffer = new StringBuffer();

		if (id != null && id > 0) {
			stringBuffer.write('(${Std.string(id)}): ');
		}

		Command.commandsList.push(commandProperties);

		stringBuffer.write("{0} > {1} : {2} -> {3}\n".format([
			StringFormatter.mappedSurround(StringFormatter.color('PUSHED COMMAND', Color.GREEN), ['[ ', ' ]']),
			StringFormatter.mappedSurround(
				StringFormatter.color('Alias(es): ${ArrayUtil.getStringContents(commandProperties.aliases, ', ')}', Color.YELLOW),
				['[', ']']
			),
			StringFormatter.mappedSurround(
				StringFormatter.color('Flag(s): ${ArrayUtil.getStringContents(commandProperties.flags, ', ')}', Color.CYAN),
				['[', ']']
			),
			'\"${commandProperties.description}\"'
		]));

		Logging.logMessage(stringBuffer.read());

		stringBuffer.out();
		stringBuffer.clear();

		return;
	}

	public static function getCommandData(?index:Int, ?commandDataType:Null<CommandData> = NAME):Dynamic {

		if (!commandDataType.equals(CommandData.ALIASES) && !commandDataType.equals(CommandData.FLAGS)) {
			if (commandDataType.equals(CommandData.DESCRIPTION)) {
				return Command.commandsList[index].description;
			}
		} else {
			if (commandDataType.equals(CommandData.ALIASES)) {
				return Command.commandsList[index].aliases;
			}
			if (commandDataType.equals(CommandData.FLAGS)) {
				return Command.commandsList[index].flags;
			}
		}
		return Command.commandsList[index].name;
	}
}
