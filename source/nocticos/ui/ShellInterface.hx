package nocticos.ui;

import nocticos.lib.Colorizer.Color;

class ShellInterface {
	public function new(shellCharacters:Array<{symbol:String, id:Int, color:Color}>, ?color:Bool = true):Void {
		if (shellCharacters != null) {
			for (tdata in shellCharacters) {
				ShellRenderer.stage(
					tdata.symbol,
					(tdata.id),
					((color) ? tdata.color : null)
				);
			}
			Sys.print(" ");
		}
	}
}
