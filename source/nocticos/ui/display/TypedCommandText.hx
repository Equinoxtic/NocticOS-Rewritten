package nocticos.ui.display;

import nocticos.types.StringBuffer;
import nocticos.ui.display.text.TypedText;
import nocticos.util.CommandUtility;

using StringTools;

class TypedCommandText {
	/**
	 * Create a text for commands with the type effect.
	 * @param name The name of the command.
	 * @param aliases The array of aliases of the command.
	 * @param flags The array of flags of the command.
	 * @param description The description of the command.
	 */
	public function new(name:String, aliases:Array<String>, flags:Array<String>, description:String):Void {
		new TypedText(_formatCommand(
			name,
			aliases,
			flags,
			description
		), TextType.QUICK, WHITE);

		Sys.print('\n\n');
	}

	private function _formatCommand(name:String, aliases:Array<String>, flags:Array<String>, description:Null<String>):String {
		var stringBuffer:StringBuffer = new StringBuffer();

		stringBuffer.write('* [ $name ]', WriteMode.APPEND);

		if (aliases != null && flags != null) {
			if (aliases.length > 0 && aliases[0] != "NO_ALIASES") {
				var aliasesString:String = '${CommandUtility.appendStringArray(aliases, ' | ')}';
				stringBuffer.write(' // [ A: $aliasesString ]', WriteMode.APPEND);
			}

			if (flags.length > 0 && flags[0] != "NO_FLAGS") {
				var flagsString:String = '${CommandUtility.appendStringArray(flags, ', ')}';
				stringBuffer.write(' : ( $flagsString )', WriteMode.APPEND);
			}
		}

		stringBuffer.write('\n', WriteMode.APPEND);

		if (description == "" || description.length <= 0) {
			description = "< Command Description >";
		}

		stringBuffer.write('  -> \"${description}\"', WriteMode.APPEND);

		return stringBuffer.read();
	}
}
