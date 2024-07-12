package nocticos.util;

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
			appendStringArray(aliases), // Command aliases
			appendStringArray(flags, ", "), // Command flags
			description // Command description
		]);

		stringBuffer.write("{0} > {1} : {2}\n    -> {3} \n\n".format([
			StringFormatter.mappedSurround(StringFormatter.color('PUSHED COMMAND', Color.GREEN), ['[ ', ' ]']),
			StringFormatter.mappedSurround(StringFormatter.color(appendStringArray(aliases), Color.YELLOW), ['[', ']']),
			StringFormatter.mappedSurround(StringFormatter.color(appendStringArray(flags), Color.CYAN), ['[', ']']),
			'\"${description}\"'
		]));
		stringBuffer.out();
		stringBuffer.clear();

		return;
	}

	public static function appendStringArray(targetList:Null<Array<String>>, ?sep:String = ' | '):String {
		if (targetList != null) {
			var stringBuffer:StringBuffer = new StringBuffer();
			for (i in 0...targetList.length) {
				if (targetList[i].charAt(0) != '') {
					if (i >= targetList.length-1) {
						stringBuffer.write('{0}'.format([
							targetList[i]
						]), WriteMode.APPEND);
					} else {
						stringBuffer.write('{0}{1}'.format([
							targetList[i], sep
						]), WriteMode.APPEND);
					}
				} else {
					return "";
				}
			}
			final bufferRead = stringBuffer.read();
			stringBuffer.clear();
			return bufferRead;
		} else {
			Error.throwError(ExceptionType.NULL_EXCEPTION, "Target list is NULL", true, true);
		}
		return null;
	}
}
