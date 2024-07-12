package nocticos.ui;

class Shell {
	public function new(shellAttributes:Null<Array<Dynamic>>, ?color:Bool = true):Void {
		if (shellAttributes != null) {
			for (attributeIndex in 0...shellAttributes.length) {
				ShellRenderer.stage(
					shellAttributes[attributeIndex][0],
					(attributeIndex + 1),
					((color) ? shellAttributes[attributeIndex][1] : null)
				);
			}
			Sys.print(" ");
		}
	}
}
