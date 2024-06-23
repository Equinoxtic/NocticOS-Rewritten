package nocticos.util;

class Thread {
	/**
	 * Delays/Waits the program in milliseconds (ms).
	 * @param ms The duration of the sleep in milliseconds.
	 */
	public static function sleepMS(ms:Int):Void {
		if (Math.isNaN(ms)) {
			return;
		}
		Sys.sleep(Math.abs(ms) / 1000);
	}

	/**
	 * Delays/Waits the program in seconds (s).
	 * @param seconds The duration of the sleep in seconds.
	 */
	public static function sleep(seconds:Float):Void {
		if (Math.isNaN(seconds)) {
			return;
		}
		Sys.sleep(Math.abs(seconds));
	}

	public static function sleepCallback(seconds:Float, callback:Void->Void):Void {
		if (callback != null) {
			sleep(seconds);
			callback();
		} else {
			return;
		}
	}
}
