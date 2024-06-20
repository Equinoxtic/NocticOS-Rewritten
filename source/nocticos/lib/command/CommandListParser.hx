package nocticos.lib.command;

import nocticos.util.debug.Error;

class CommandListParser {
	public static function pushCommand(name:Null<String>, aliases:Null<Array<String>>, flags:Null<Array<String>>, description:Null<String>, ?id:Null<Int> = null):Void {
		var sbuf:String = '';
		var indexId:Int = 0;

		if (id != null && id > 0) {
			indexId = id;
		}

		if (indexId > 0) {
			sbuf += '(${indexId}): ';
		}

		Command._commandsList.push([
			name, // Command name
			_appendArray(aliases), // Command aliases
			_appendArray(flags, ", "), // Command flags
			description // Command description
		]);

		sbuf += "[PUSHED COMMAND] > " + name + " : " + '[${_appendArray(aliases)}] : [${_appendArray(flags)}] - \"${description}\"';

		if (sbuf != null) {
			Sys.stdout().writeString('$sbuf\n');
		}

		return;
	}

	private static function _appendArray(targetList:Null<Array<String>>, ?sep:String = ' | '):String {
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
