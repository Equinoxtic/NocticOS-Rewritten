package nocticos.util;

using StringTools;

class StringUtil {
	public static function format(value:String, values:Array<Any>):String {
		for (i in 0...values.length) {
			value = value.replace('{$i}', values[i]);
		}
		return value;
	}
}
