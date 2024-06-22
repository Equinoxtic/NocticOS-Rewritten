package nocticos;

import backend.FileStream;
import nocticos.lib.HTTP;

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
	public static final VERSION:String = FileStream.readFile(Paths.file('.VERSION'));

	/**
	 * The GIT version of the application. (Typically on GitHub)
	 */
	public static final GIT_VERSION:String = HTTP.getStringFromURL('https://raw.githubusercontent.com/Equinoxtic/NocticOS-Rewritten/master/.GIT_VERSION');

	/**
	 * The prompt of the command line. [ Default: '~$' ]
	 */
	public static final COMMAND_LINE_PROMPT:String = "~$";

	/**
	 * The string of every prompt. [ Default: [ Yes (Y) / No (N) ] ]
	 */
	public static final PROMPT_STRING:String = "[ Yes (Y) / No (N) ]";

	/**
	 * The list of commands for NocticOS.
	 *
	 * Follow the format to make a custom command:
	 *
	 * [
	 *
	 *		// The name of the command. Must be a string.
	 *		"COMMAND_NAME",
	 *
	 *		// The array of aliases for the command. Type in ``[""]`` for no aliases.
	 *		"COMMAND_ALIASES",
	 *
	 *		// The array of flags for the command. Type in ``[""]`` for no flags.
	 *		"COMMAND_FLAGS",
	 *
	 *		// The description of the command. Must be a string.
	 *		"COMMAND_DESCRIPTION"
	 *
	 * ]
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
			"exit",
			["quit", "q"],
			["NO_FLAGS"],
			'Exits out of ${Variables.GLOBAL_APPLICATION_NAME}.'
		],
	];
}
