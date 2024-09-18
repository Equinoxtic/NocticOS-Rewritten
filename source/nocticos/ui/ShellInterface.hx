package nocticos.ui;

import nocticos.lib.Colorizer.Color;

typedef ShellCharacterProperties = {
	var id:Int;
	var color:Color;
}

class ShellInterface {
	public function new(shellCharacters:Map<String, ShellCharacterProperties>, ?color:Bool = true):Void {
		if (shellCharacters != null) {
			for (symbol => properties in shellCharacters) {
				ShellRenderer.stage(
					symbol,
					(properties.id + 1),
					((color) ? properties.color : null)
				);
			}
			Sys.print(" ");
		}
	}
}
