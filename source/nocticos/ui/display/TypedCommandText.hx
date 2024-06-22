package nocticos.ui.display;

import nocticos.ui.display.text.TypedText;
import nocticos.util.CommandUtility;

using StringTools;

class TypedCommandText {
	public function new(name:String, aliases:Array<String>, flags:Array<String>, description:String):Void {
		new TypedText(_formatCommand(
			name,
			aliases,
			flags,
			description
		), TextType.DEFAULT_FAST, WHITE);

		Sys.print('\n\n');
	}

	private function _formatCommand(name:String, aliases:Array<String>, flags:Array<String>, description:Null<String>):String {
		var sbuf:String = "";

		sbuf += '* [ $name ] ';

		if (aliases != null && aliases != null) {
			if (aliases.length > 0 && aliases[0] != "NO_ALIASES") {
				var key:String = '${CommandUtility.appendStringArray(aliases, ' | ')}';
				sbuf += Std.string(' // ( A: $key ) ');
			} else {
				sbuf += ' // (...)';
			}

			if (flags.length > 0 && flags[0] != "NO_FLAGS") {
				var key:String = '${CommandUtility.appendStringArray(flags, ', ')}';
				sbuf += Std.string(' < $key >');
			} else {
				sbuf += ' < ... >';
			}
		}

		sbuf += '\n';

		if (description == "" && description.length < 0) {
			description = "Command description";
		}

		sbuf += '  > \"$description\"';

		return sbuf;
	}
}
