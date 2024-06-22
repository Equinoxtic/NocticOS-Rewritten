package nocticos.ui;

import cpp.Callable;
import nocticos.ui.display.text.TypedText;

using StringTools;

enum PromptType
{
	DEFAULT;
}

class Prompt {
	private var _answers:Array<Dynamic> = [
		["Yes", "Y", "y"],
		["No", "N", "n"],
	];

	private var _promptType:PromptType = null;
	private var _promptString:String = "";
	private var _promptCallback:Void->Void = null;

	/**
	 * Creates a new user prompt.
	 * @param promptType The type of the prompt.
	 * @param promptString The string/message of the prompt.
	 */
	public function new(promptType:Null<PromptType>, ?promptString:String = "Continue?", ?callback:Null<Void->Void>):Void {
		if (promptType == null) {
			return;
		}

		this._promptType = promptType;
		this._promptString = promptString;
		this._promptCallback = callback.bind();
	}

	public function initializePrompt():Void {
		switch(this._promptType) {
			case DEFAULT:
				new TypedText(this._promptString, DEFAULT, WHITE);
				Thread.sleepCallback(1.0, function() {
					Sys.print(" ");
					new TypedText('${Variables.PROMPT_STRING}: ', DEFAULT, WHITE);
				});

				var uInput:String = Sys.stdin().readLine();

				if (uInput != null) {
					_evaluateAnswers(uInput, function():Void {
						this._promptCallback();
					});
				}
		}
	}

	public function pushPromptOption(optionsList:Array<String>):Void {
		if (optionsList != null && _answers != null) {
			_answers.push(optionsList);
		} else {
			return;
		}
	}

	public function clearPromptOptions():Void {
		if (_answers != null) {
			_answers.pop();
		}
	}

	private function _evaluateAnswers(input:String, ?callback:Null<Void->Void>):Void {
		if (input != null) {
			for (i in 0..._answers.length) {
				if (input == _answers[i][0]) {
					callback();
					break;
				} else if (input == _answers[i][1]) {
					return;
				}
			}
		}
	}
}
