package nocticos;

import nocticos.ui.command.Command.CommandProperties;
import nocticos.ui.Prompt.PromptType;
import nocticos.lib.HTTP;

enum OutputSymbols {
	INFO;
	WARNING;
	ERROR;
}

class Variables
{
	/**
	 * The main application title. [ Default: NocticOS: Rewritten ]
	 */
	public static final APPLICATION_TITLE = "NocticOS: Rewritten";

	/**
	 * The application name that is used globally. [ Default: NocticOS ]
	 */
	public static final GLOBAL_APPLICATION_NAME = "NocticOS";

	/**
	 * The version of the application.
	 */
	public static final VERSION:String = "0.0.2";

	/**
	 * The GIT version of the application. (Typically on GitHub)
	 */
	public static final GIT_VERSION:String = HTTP.getStringFromURL('https://raw.githubusercontent.com/Equinoxtic/NocticOS-Rewritten/master/.GIT_VERSION');

	/**
	 * The map of output symbols given by a type as its key.
	 */
	private static final OUTPUT_SYMBOLS:Map<OutputSymbols, String> = [
		INFO 	=> '+',
		WARNING => '?',
		ERROR 	=> '!'
	];

	/**
	 * The map of strings for a specific type of prompt.
	 */
	private static final PROMPT_STRINGS:Map<PromptType, String> = [
		PromptType.DEFAULT		=>		"[ Yes (Y) / No (N) ]"
	];

	/**
	 * Returns an output symbol with the given type.
	 * @param type The type of the output symbol.
	 * @return String
	 */
	public static function getOutputSymbol(?type:Null<OutputSymbols> = INFO):String {
		return OUTPUT_SYMBOLS[type];
	}

	/**
	 * Returns a prompt string with the given type.
	 * @param promptType The type of the prompt.
	 * @return String
	 */
	public static function getPromptString(promptType:Null<PromptType> = PromptType.DEFAULT):String {
		return PROMPT_STRINGS[promptType];
	}

	/**
	 * Enable a more performant version of NocticOS. This will disable colors and the 'type effect'.
	 */
	public static var PERFORMANT_MODE:Bool = false;

	/**
	 * Forces the type effect to have a more instantaneous speed.
	 */
	public static final FORCE_INSTANTANEOUS_TYPE_EFFECT:Bool = false;

	/**
	 * Whether colors should be displayed on the screen.
	 */
	public static final ALLOW_COLORS:Bool = true;
}
