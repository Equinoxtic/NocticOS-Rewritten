package nocticos.ui.display.text.effects;

class TypeEffect {
	public static function type(text:Null<String>, ?delayMS:Null<Int> = 10, ?newline:Bool = false):Void {
		var sbuf:String = "";
		if (text != null && text.length > 0) {
			sbuf += text;
		}
		if (delayMS <= 0) {
			delayMS = 0;
		}
		for (i in 0...sbuf.length) {
			Sys.print(sbuf.charAt(i));
			Thread.sleepMS(delayMS);
			if (i >= sbuf.length) {
				if (newline) {
					Sys.stdout().writeString('\n');
				}
			}
		}
		return;
	}
}
