package nocticos.ui.display.text.effects;

class TypeEffect {
	public static function type(text:Null<String>, ?delay:Null<Float> = 10.0, ?newline:Bool = false):Void {
		var sbuf:String = "";
		if (text != null && text.length > 0) {
			sbuf += text;
		}
		if (delay <= 0) {
			delay = 0;
		}
		for (i in 0...sbuf.length) {
			Sys.print(sbuf.charAt(i));
			Thread.sleep(delay);
			if (i >= sbuf.length) {
				if (newline) {
					Sys.print('\n');
				}
			}
		}
		return;
	}
}
