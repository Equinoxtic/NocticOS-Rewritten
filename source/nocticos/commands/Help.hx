package nocticos.commands;

import backend.System;
import nocticos.ui.display.text.Text.TextColor;
import backend.ANSI;
import backend.ANSI.Attribute;
import nocticos.ui.display.text.TypedText;
import nocticos.lib.command.Command;
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

		var text:String = "";
		for (i in 0...Command._commandsList.length) {
			if (showAll) {
				text += pushCommandGuide(
					Command._commandsList[i][0],
					Command._commandsList[i][1],
					Command._commandsList[i][2],
					Command._commandsList[i][3]
				);
			} else {
				text += pushCommandGuide(Command._commandsList[i][0], null, null, Command._commandsList[i][3]);
			}
		}

		new TypedText(text, DEFAULT_FAST);
	}

	private function pushCommandGuide(name:String, ?aliasList:Null<String> = "", ?flagsList:Null<String>, ?description:Null<String> = ""):String
	{
		var commandString:String = "";

		commandString += '* [ $name ] '; /* + ((aliasList != null && aliasList != '') ? ' // ( Aliases: $aliasList )' : '' ) */

		if (aliasList != null && aliasList != '') {
			commandString += ' // ( Aliases: $aliasList )';
		}

		if (flagsList != null && flagsList != '') {
			commandString += ' < $flagsList > ';
		}

		commandString += "\n";

		var newDescription:String = "Command description.";
		if (description != null && description != "") {
			newDescription = description;
		}

		commandString += '  > \"$newDescription\"\n\n';

		return commandString;
	}
}
