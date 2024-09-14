package nocticos.util.debug;

import backend.System;
import nocticos.lib.Colorizer.Color;
import nocticos.ui.display.text.Text;
import backend.ANSI;

using StringTools;

enum ExceptionType {
	NULL_EXCEPTION;
	NO_PATH_EXISTS;
	EMPTY_STRING;
	ID_CONFLICT;
}

class Error {
	public static function throwError(exceptionType:Null<ExceptionType>, message:Null<String>, ?newline:Bool = true, ?color:Bool = false):Void {
		if (exceptionType == null || message.length == 0) {
			return;
		}

		final exceptionTypes:Map<ExceptionType, String> = [
			NULL_EXCEPTION => 'NullObjectReference',
			NO_PATH_EXISTS => 'NoPathExists',
			EMPTY_STRING   => 'EmptyStringReference',
			ID_CONFLICT    => 'ConflictedIDs'
		];

		final exceptionReference:String = '${exceptionTypes.get(exceptionType).trim()}Reference';

		var tMessage:String = Std.string('[$exceptionReference]: \"$message\"');

		if (tMessage != null) {
			if (!newline) {
				Sys.print(StringFormatter.mappedSurround(
					StringFormatter.color(tMessage, Color.RED), ['\n\n', '\n\n']
				));
				return;
			}

			Sys.print(StringFormatter.color(tMessage, Color.RED));
		}

		if (!exceptionType.equals(ExceptionType.EMPTY_STRING)) {
			System._EXIT(0);
		}
	}
}
