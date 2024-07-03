package nocticos.util;

import nocticos.types.StringBuffer;

class UpdateChecker {
	public static function check():Void {
		var stringBuffer:StringBuffer = new StringBuffer();
		if (Variables.VERSION != Variables.GIT_VERSION) {
			stringBuffer.write("\n- You are running an outdated version of NocticOS! -", WriteMode.APPEND);
			stringBuffer.write('\nCurrent Version: ${Variables.VERSION}\nNew Version: ${Variables.GIT_VERSION}\n\n', WriteMode.APPEND);
			stringBuffer.out();
			stringBuffer.clear();
			Sys.getChar(false);
		} else {
			stringBuffer.write('\nCurrent Version: ${Variables.VERSION}\n\n');
			stringBuffer.out();
			stringBuffer.clear();
			Thread.sleep(0.001);
		}
	}
}
