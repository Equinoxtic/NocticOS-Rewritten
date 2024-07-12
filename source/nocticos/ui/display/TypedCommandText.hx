package nocticos.ui.display;

import nocticos.util.ArrayUtil;
import nocticos.lib.Colorizer.Color;
import nocticos.util.StringFormatter;
import nocticos.types.StringBuffer;
import nocticos.ui.display.text.TypedText;
import nocticos.util.CommandUtility;

using StringTools;
using nocticos.util.StringUtil;

class TypedCommandText extends BasicElement {
	/**
	 * Create a text for commands with the type effect.
	 * @param name The name of the command.
	 * @param aliases The array of aliases of the command.
	 * @param flags The array of flags of the command.
	 * @param description The description of the command.
	 */
	public function new(name:String, description:String, aliases:Array<String>, flags:Array<String>):Void {
		super();

		this.pushProperty('commandName', name);
		this.pushProperty('commandDescription', description);
		this.pushProperty('commandAliases', aliases);
		this.pushProperty('commandFlags', flags);

		if (this.getProperty('commandAliases') != null && this.getProperty('commandFlags') != null) {
			new TypedText(_formatCommand(
				this.getProperty('commandName'),
				this.getProperty('commandAliases'),
				this.getProperty('commandFlags'),
				this.getProperty('commandDescription')
			), TextType.QUICK, WHITE);
			Sys.print('\n\n');
			return;
		} else {
			new TypedText(_formatCommand(
				this.getProperty('commandName'), null, null, this.getProperty('commandDescription')
			), TextType.QUICK, WHITE);
			Sys.print('\n\n');
			return;
		}
	}

	private function _formatCommand(name:String, aliases:Array<String>, flags:Array<String>, description:Null<String>):String {
		var stringBuffer:StringBuffer = new StringBuffer();
		stringBuffer.write('* [ ${StringFormatter.color(name, Color.YELLOW)} ]', WriteMode.APPEND);
		if (aliases != null && flags != null) {
			if (aliases.length > 0 && aliases[0].toUpperCase() != "NO_ALIASES") {
				var aliasesString:String = '${
					StringFormatter.color(ArrayUtil.getStringContents(aliases, ' | '), Color.YELLOW)
				}';
				stringBuffer.write('\n  : [ {0} : {1} ]'.format([
					StringFormatter.color('Alias(es)', Color.WHITE, true),
					aliasesString
				]), WriteMode.APPEND);
			}
			if (flags.length > 0 && flags[0].toUpperCase() != "NO_FLAGS") {
				var flagsString:String = '${StringFormatter.color(
					ArrayUtil.getStringContents(flags, ', '), Color.CYAN)
				}';
				stringBuffer.write('\n  : ( {0} : {1} )'.format([
					StringFormatter.color('Flag(s)', Color.WHITE, true),
					flagsString
				]), WriteMode.APPEND);
			}
		}
		stringBuffer.write('\n', WriteMode.APPEND);
		if (description == "" || description.length <= 0) {
			description = "< Command Description >";
		}
		stringBuffer.write('  * \"${description}\"', WriteMode.APPEND);

		final stringBufferRead = stringBuffer.read();

		stringBuffer.clear();

		return stringBufferRead;
	}
}
