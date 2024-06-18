package nocticos.util.debug;

import backend.ANSI;

enum ExceptionType {
	NULL_EXCEPTION;
	NO_PATH_EXISTS;
	EMPTY_STRING;
}

class Error {
	public static function throwError(exceptionType:Null<ExceptionType>, message:Null<String>, ?newline:Bool = true, ?color:Bool = false):Void {
		if (exceptionType == null || message.length == 0) {
			return;
		}

		var exceptionString:String = "";

		switch(exceptionType) {
			case NULL_EXCEPTION:
				exceptionString = "NullObjectReferenceException";
			case NO_PATH_EXISTS:
				exceptionString = "NoPathExistsException";
			case EMPTY_STRING:
				exceptionString = "EmptyStringReferenceException";
		}

		var tMessage:String = Std.string('[${exceptionString}]: \"${message}\"');

		if (tMessage != null) {
			if (newline) {
				Sys.stdout().writeString("\n\n");
			}

			Sys.stdout().writeString(((color) ? ANSI.set(Red, Bold) : ANSI.set(Off)) + tMessage);

			Sys.stdout().writeString(ANSI.set(Off));

			if (newline) {
				Sys.stdout().writeString("\n\n");
			}
		}
	}
}
