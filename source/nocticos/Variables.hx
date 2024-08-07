package nocticos;

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
	public static final VERSION:String = "0.0.1";

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
	 * The list of commands for NocticOS.
	 *
	 * Follow the format to make a custom command:
	 *
	 * ```
	 * [
	 *    // The name of the command. Must be a string.
	 *    "COMMAND_NAME",         String
	 *
	 *    // The array of aliases for the command. Type in ``["NO_ALIASES"]`` in the array for no aliases.
	 *    [ "COMMAND_ALIASES" ],  Array (String)
	 *
	 *    // The array of flags for the command. Type in ``["NO_FLAGS"]`` in the array for no flags.
	 *    [ "COMMAND_FLAGS" ],    Array (String)
	 *
	 *    // The description of the command. Must be a string.
	 *    "COMMAND_DESCRIPTION"   String
	 * ]
	 * ```
	 */
	public static final commandsList:Array<Dynamic> = [
		[
			"help",
			["cmds"],
			["--all", "-a"],
			'Shows the list of available commands for ${Variables.GLOBAL_APPLICATION_NAME}'
		],
		[
			"clear",
			["clr", "cls", "clrscr"],
			["NO_FLAGS"],
			"Clears the current screen buffer."
		],
		[
			"reload",
			["refresh", "rbuf", "refbuf"],
			["NO_FLAGS"],
			"Refreshes / reloads the buffer."
		],
		[
			"logs",
			["NO_ALIASES"],
			["NO_FLAGS"],
			"Opens the log file of the current session."
		],
		[
			"exit",
			["quit", "q"],
			["NO_FLAGS"],
			'Exits out of ${Variables.GLOBAL_APPLICATION_NAME}.'
		]
	];

	/**
	 * Enable a more performant version of NocticOS. This will disable colors and the 'type effect'.
	 */
	public static var PERFORMANT_MODE:Bool = false;

	/**
	 * Forces the type effect to have a more instantaneous speed.
	 */
	public static final FORCE_INSTANTANEOUS_TYPE_EFFECT:Bool = true;

	/**
	 * Whether colors should be displayed on the screen.
	 */
	public static final ALLOW_COLORS:Bool = true;
}
