package nocticos.ui;

import nocticos.util.ArrayUtil;
import nocticos.lib.Logging;
import cpp.Callable;
import nocticos.ui.display.text.TypedText;

using StringTools;

enum PromptType
{
	DEFAULT;
}

private enum PromptAction
{
	APPEND_OPTIONS;
	REMOVE_OPTIONS;
}

class Prompt {
	private var _answers_DEFAULT:Array<Dynamic> = [
		["Yes", "Y", "y"],
		["No", "N", "n"]
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

	/**
	 * Initializes the current prompt.
	 */
	public function initializePrompt():Void {
		outputPromptOptions();
		switch(this._promptType) {
			case DEFAULT:
				new TypedText(this._promptString, TextType.DEFAULT, WHITE);
				Thread.sleepCallback(0.003, function() {
					new TypedText(' ${Variables.getPromptString(PromptType.DEFAULT)}: ', TextType.DEFAULT, WHITE);
				});

				var uInput:String = Sys.stdin().readLine();

				if (uInput != null) {
					_evaluateAnswers(uInput, function():Void {
						this._promptCallback();
					});
				}
		}
	}

	/**
	 * Pushes options to the prompt. Keep in mind that you may want to call ``clearPromptOptions()`` to insert and push customized options/answers.
	 * @param optionsList The list options to push.
	 */
	public function pushPromptOptions(optionsList:Array<Dynamic>):Void {
		if (optionsList != null) {
			_promptAction(
				this._promptType,
				PromptAction.APPEND_OPTIONS,
				optionsList
			);
		} else {
			return;
		}
	}

	/**
	 * Clears all the current options for the current prompt.
	 */
	public function clearPromptOptions():Void {
		_promptAction(
			this._promptType,
			PromptAction.REMOVE_OPTIONS,
			null
		);
	}

	public function outputPromptOptions():Void {
		switch(this._promptType) {
			case DEFAULT:
				for (i in 0..._answers_DEFAULT.length) {
					Logging.logMessage('[Prompt Option ${i+1}]: ${_answers_DEFAULT[i]}\n');
				}
		}
	}

	private function _promptAction(promptMode:Null<PromptType>, ?action:Null<PromptAction> = PromptAction.APPEND_OPTIONS, ?list:Null<Array<Dynamic>>):Void {
		if (promptMode != null) {
			switch(promptMode) {
				case DEFAULT:
					_promptActionCreate(action, _answers_DEFAULT, list);
			}
		}
	}

	private function _promptActionCreate(?currentAction:Null<PromptAction> = PromptAction.APPEND_OPTIONS, ?targetList:Null<Array<Dynamic>>, ?pushList:Null<Array<Dynamic>>):Void {
		if (targetList == null) {
			return;
		}
		switch(currentAction) {
			case APPEND_OPTIONS:
				if (pushList == null || pushList.length <= 0) {
					return;
				}
				targetList.push(pushList);
			case REMOVE_OPTIONS:
				ArrayUtil.clearArray(targetList);
		}
	}

	private function _evaluateAnswers(input:String, ?callback:Null<Void->Void>):Void {
		switch(this._promptType) {
			case DEFAULT:
				// Check if the length of valid answers is 0, otherwise return.
				if (_answers_DEFAULT.length <= 0) {
					return;
				}
				if (input != null) {
					for (i in 0..._answers_DEFAULT.length) {
						for (j in 0..._answers_DEFAULT[i].length) {
							if (input == _answers_DEFAULT[0][j]) {
								callback();
								break;
							} else if (input == _answers_DEFAULT[1][j]) {
								break;
							}
						}
					}
					return;
				}
		}
	}
}
