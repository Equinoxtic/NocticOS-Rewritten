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
		if (aliases != null && aliases.length > 0 && aliases[0] != "") {
			var key:String = '${CommandUtility.appendStringArray(aliases, ' | ')}';
			sbuf += Std.string(' // ( A: $key ) ');
		}
		if (flags != null && flags.length > 0 && aliases[0] != "") {
			var key:String = '${CommandUtility.appendStringArray(flags, ', ')}';
			sbuf += Std.string(' < $key >');
		}
		sbuf += '\n';
		if (description == "" && description.length < 0) {
			description = "Command description";
		}
		sbuf += '  > \"$description\"';
		return sbuf;
	}
}
