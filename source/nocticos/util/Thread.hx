package nocticos.util;

class Thread {
	/**
	 * Delays/Waits the program in milliseconds (ms).
	 * @param ms The duration of the sleep in milliseconds.
	 */
	public static function sleepMS(?ms:Int = 1000):Void {
		if (ms < 0 || Math.isNaN(ms)) {
			return;
		}
		Sys.sleep(ms / 1000);
	}

	/**
	 * Delays/Waits the program in seconds (s).
	 * @param seconds The duration of the sleep in seconds.
	 */
	public static function sleep(?seconds:Float):Void {
		if (seconds < 0.0 || Math.isNaN(seconds)) {
			return;
		}
		Sys.sleep(seconds);
	}
}
