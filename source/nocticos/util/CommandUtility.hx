package nocticos.util;

import nocticos.lib.Logging;
import nocticos.types.StringBuffer;
import nocticos.lib.Colorizer.Color;
import nocticos.util.debug.Error;
import nocticos.ui.command.Command;

using nocticos.util.StringUtil;

class CommandUtility {
	public static function pushCommand(name:Null<String>, aliases:Null<Array<String>>, flags:Null<Array<String>>, description:Null<String>, ?id:Null<Int> = null):Void {
		var stringBuffer:StringBuffer = new StringBuffer();

		if (id != null && id > 0) {
			stringBuffer.write('(${Std.string(id)}): ');
		}

		Command.commandsList.push([
			name, // Command name
			ArrayUtil.getStringContents(aliases, ' | '), // Command aliases
			ArrayUtil.getStringContents(flags, ', '), // Command flags
			description // Command description
		]);

		stringBuffer.write("{0} > {1} : {2}\n    -> {3} \n\n".format([
			StringFormatter.mappedSurround(StringFormatter.color('PUSHED COMMAND', Color.GREEN), ['[ ', ' ]']),
			StringFormatter.mappedSurround(
				StringFormatter.color('Alias(es): ${ArrayUtil.getStringContents(aliases, ', ')}', Color.YELLOW),
				['[', ']']
			),
			StringFormatter.mappedSurround(
				StringFormatter.color('Flag(s): ${ArrayUtil.getStringContents(flags, ', ')}', Color.CYAN),
				['[', ']']
			),
			'\"${description}\"'
		]));
		Logging.logMessage(stringBuffer.read());
		stringBuffer.out();
		stringBuffer.clear();

		return;
	}
}
