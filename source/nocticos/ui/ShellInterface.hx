package nocticos.ui;

import nocticos.lib.Colorizer.Color;

typedef ShellCharacter = {
	var symbol:String;
	var id:Int;
	@:optional var color:Color;
}

class ShellInterface {
	public function new(shellCharacters:Null<Array<ShellCharacter>>, ?color:Bool = true):Void {
		if (shellCharacters != null) {
			for (i in 0...shellCharacters.length) {
				ShellRenderer.stage(
					shellCharacters[i].symbol,
					(i + 1),
					((color) ? shellCharacters[i].color : null)
				);
			}
			Sys.print(" ");
		}
	}
}
