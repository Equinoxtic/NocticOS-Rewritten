package backend;

import nocticos.ui.Prompt;
import nocticos.ui.display.text.TypedText;
import nocticos.Variables;

using StringTools;

class Instance {
	/**
	 * Create a new NocticOS Instance.
	 */
	public function new():Void {}

	/**
	 * Intantiates / runs a new class. Can also be used to switch and run other code of classes.
	 * @param instanceClass The instance of the class to be called.
	 * @param hasPrompt Whether to toggle the prompt when the class is on its ``POST create()`` state.
	 * @param emptyPrompt Whether the prompt displays empty text.
	 */
	public static function instantiate(instanceClass:Instance, ?hasPrompt:Bool = false, ?emptyPrompt:Bool = true):Void {
		instanceClass._run(hasPrompt, emptyPrompt);
	}

	private final function _run(usePrompt:Bool, emptyPrompt:Bool):Void {
		create();
		if (usePrompt) {
			new Prompt(DEFAULT, ((!emptyPrompt) ? "Press any key to continue..." : ""));
			System._CLRSCR();
		}
	}

	/**
	 * Essentially where all the main code of an instance goes.
	 *
	 * When overriding, ``super.create()`` has an initial and a post state.
	 *
	 * Above ``super.create()`` is the initial state of the code while the post state is below ``super.create()``.
	 */
	public function create():Void {}
}
