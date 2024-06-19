package nocticos;

import nocticos.lib.HTTP;

class Variables
{
	public static final APPLICATION_TITLE = "NocticOS: Rewritten";

	public static final GLOBAL_APPLICATION_NAME = "NocticOS";

	public static final VERSION:String = FileIO.readFile(Paths.file('.VERSION'));

	public static final GIT_VERSION:String = HTTP.getStringFromURL('https://raw.githubusercontent.com/Equinoxtic/NocticOS-Rewritten/master/.GIT_VERSION');

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
	 *		// The aliases for the command. Must be separated by a "|" (i.e. "alias 1 | alias 2")
	 *		"COMMAND_ALIASES",
	 *
	 *		// The flags for the command. Must be separated by a "," (i.e. "flag 1, flag 2")
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
			"cmds",
			"--all, -a",
			"Shows the list of available commands and their usage."
		],

		[
			"clear",
			"clr | cls | clrscr",
			"",
			"Clears the current screen buffer."
		],

		[
			"refresh",
			"reload | rbuf | refbuf",
			"",
			"Refreshes / reloads the buffer."
		],

		[
			"exit",
			"quit [q]",
			"",
			'Exits out of ${Variables.GLOBAL_APPLICATION_NAME}.'
		],
	];
}
