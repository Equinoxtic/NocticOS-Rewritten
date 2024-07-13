package nocticos.commands;

import nocticos.util.CommandUtility;
import nocticos.ui.display.TypedCommandText;
import backend.System;
import nocticos.ui.display.text.TypedText;
import nocticos.ui.command.Command;
import nocticos.ui.command.Command.BaseCommand;
import nocticos.lib.Random;

class Help extends BaseCommand
{
	final messagesArray:Array<String> = [
		"Welcome, commander.",
		"Hello there, user.",
		"Hallo! America Ya! =D",
		"Programmed by Equinoxtic! :D",
		"Go play FNF! Cool Haxeflixel Rhythm Game :]",
		"THE CYBERGRIND, RAHHH!",
		"Hi, Fundamental Paper Education :)",
		"Not the best, but it works LMFAO",
		"Rewritten in Haxe?!?! Crazy!!!",
		"Long story short, this used to be written in C#."
	];

	public function new(flags:Array<String>):Void
	{
		super(flags);

		System._CLRSCR();

		var messageString:String = '\"${messagesArray[Random.int(0, messagesArray.length - 1)]}\"';
		new TypedText('[ ${Variables.GLOBAL_APPLICATION_NAME} Help / Usage ] - $messageString\n\n', DEFAULT, YELLOW);

		var text:String = "* NOTE: All commands are CASE SENSITIVE, so make sure to type them correctly!\n\n";
		new TypedText(text, DEFAULT_FAST, RED);

		var showAll:Bool = (flags[1] == '-a' || flags[1] == '--all');

		for (i in 0...Command.commandsList.length) {
			if (showAll) {
				new TypedCommandText(
					CommandUtility.getCommandData(i, CommandData.NAME),
					CommandUtility.getCommandData(i, CommandData.DESCRIPTION),
					CommandUtility.getCommandData(i, CommandData.ALIASES),
					CommandUtility.getCommandData(i, CommandData.FLAGS)
				);
			} else {
				new TypedCommandText(Command.commandsList[i][0], Command.commandsList[i][3], null, null);
			}
		}
	}
}
