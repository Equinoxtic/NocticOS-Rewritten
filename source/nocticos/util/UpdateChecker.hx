package nocticos.util;

import nocticos.types.StringBuffer;

class UpdateChecker {
	public static function check():Void {
		var stringBuffer:StringBuffer = new StringBuffer();
		if (Variables.VERSION != Variables.GIT_VERSION) {
			stringBuffer.write(
				'\n- You are running an outdated version of NocticOS! -'
				+ '\nCurrent Version: ${Variables.VERSION}\nNew Version: ${Variables.GIT_VERSION}\n\n'
				+ 'Press any key to continue...', WriteMode.WRITE);
			stringBuffer.out();
			Sys.getChar(false);
		} else {
			stringBuffer.write('\nCurrent Version: ${Variables.VERSION}\n\n', WriteMode.WRITE);
			stringBuffer.out();
			Thread.sleep(0.002);
		}
		stringBuffer.clear();
	}
}
