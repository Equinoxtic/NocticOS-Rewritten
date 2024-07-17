package nocticos.util;

import nocticos.util.debug.Error;
import nocticos.types.StringBuffer;

using nocticos.util.StringUtil;

class ArrayUtil {

	/**
	 * Gets the content of strings from a given string array.
	 * @param targetArray The array to get the strings from.
	 * @param sep An optional parameter that seperates each string with a character.
	 * @return String
	 */
	public static function getStringContents(targetArray:Null<Array<String>>, ?sep:String = ' | '):String {
		if (targetArray != null) {
			var stringBuffer:StringBuffer = new StringBuffer();
			for (i in 0...targetArray.length) {
				if (targetArray[i].charAt(0) != '') {
					if (i >= targetArray.length-1) {
						stringBuffer.write('{0}'.format([
							targetArray[i]
						]), WriteMode.APPEND);
					} else {
						stringBuffer.write('{0}{1}'.format([
							targetArray[i], sep
						]), WriteMode.APPEND);
					}
				} else {
					return "";
				}
			}
			final bufferRead = stringBuffer.read();
			stringBuffer.clear();
			return bufferRead;
		} else {
			Error.throwError(ExceptionType.NULL_EXCEPTION, "Targeted array to be looped over is NULL", true, true);
		}
		return null;
	}

	/**
	 * Clears the given contents of an array.
	 * @param array The array to be cleared.
	 */
	public static function clearArray(array:Array<Dynamic>):Void {
		if (array != null && array.length > 0) {
			do {
				array.pop();
			} while (array.length > 0);
		} else {
			return;
		}
	}
}
