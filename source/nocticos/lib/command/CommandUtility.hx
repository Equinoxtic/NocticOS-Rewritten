package nocticos.lib.command;

import nocticos.util.debug.Error;

class CommandUtility {
	public static function pushCommand(name:Null<String>, aliases:Null<Array<String>>, flags:Null<Array<String>>, description:Null<String>, ?id:Null<Int> = null):Void {
		var sbuf:String = '';
		var indexId:Int = 0;

		if (id != null && id > 0) {
			indexId = id;
		}

		if (indexId > 0) {
			sbuf += '(${indexId}): ';
		}

		Command.commandsList.push([
			name, // Command name
			appendStringArray(aliases), // Command aliases
			appendStringArray(flags, ", "), // Command flags
			description // Command description
		]);

		sbuf += "[PUSHED COMMAND] > " + name + " : " + '[${appendStringArray(aliases)}] : [${appendStringArray(flags)}] - \"${description}\"';

		if (sbuf != null) {
			Sys.print('$sbuf\n');
		}

		return;
	}

	public static function appendStringArray(targetList:Null<Array<String>>, ?sep:String = ' | '):String {
		if (targetList != null) {
			var sbuf:String = '';
			for (i in 0...targetList.length) {
				if (targetList[i].charAt(0) != '') {
					if (i >= targetList.length-1) {
						sbuf += '${targetList[i]}';
					} else {
						sbuf += '${targetList[i]}${sep}';
					}
				} else {
					return "";
				}
			}
			return sbuf;
		} else {
			Error.throwError(ExceptionType.NULL_EXCEPTION, "Target list is NULL", true, true);
		}

		return null;
	}
}
