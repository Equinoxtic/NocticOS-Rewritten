package nocticos.ui.display;

import nocticos.ui.command.Command.CommandProperties;
import nocticos.lib.Logging;
import nocticos.util.ArrayUtil;
import nocticos.lib.Colorizer.Color;
import nocticos.util.StringFormatter;
import nocticos.types.StringBuffer;
import nocticos.ui.display.text.TypedText;
import nocticos.util.CommandUtility;

using StringTools;
using nocticos.util.StringUtil;

class TypedCommandText extends BasicElement {
	public function new(commandProperties:Null<CommandProperties>, ?detailed:Bool = true):Void {
		super();

		if (commandProperties == null) {
			return;
		}

		this.pushProperty('commandName', commandProperties.name);
		this.pushProperty('commandDescription', commandProperties.description);
		this.pushProperty('commandAliases', commandProperties.aliases);
		this.pushProperty('commandFlags', commandProperties.flags);

		if (this.getProperty('commandAliases') != null && this.getProperty('commandFlags') != null && detailed) {
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
				var aliasesString:String = StringFormatter.color(ArrayUtil.getStringContents(aliases, ' | '), Color.YELLOW);
				stringBuffer.write('\n  : [ {0} : {1} ]'.format([
					StringFormatter.color('Alias(es)', Color.WHITE, true),
					aliasesString
				]), WriteMode.APPEND);
			}
			if (flags.length > 0 && flags[0].toUpperCase() != "NO_FLAGS") {
				var flagsString:String = StringFormatter.color(ArrayUtil.getStringContents(flags, ', '), Color.CYAN);
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

		stringBuffer.write('  {0} {1}'.format([
			StringFormatter.color('->', Color.GREEN), '\"${description}\"'
		]), WriteMode.APPEND);

		final stringBufferRead = stringBuffer.read();

		Logging.logMessage('FORMATTED COMMAND: ${stringBufferRead}');

		stringBuffer.clear();

		return stringBufferRead;
	}
}
