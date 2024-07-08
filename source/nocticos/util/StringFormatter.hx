package nocticos.util;

import nocticos.lib.Colorizer;
import nocticos.types.StringBuffer;

class StringFormatter {
	public static function color(text:String, ?color:Null<Color> = Color.WHITE):String {
		return Colorizer.setColor(text, color);
	}

	public static function surround(text:String, ?surroundingString:String = '-'):String {
		var stringBuffer:StringBuffer = new StringBuffer();
		stringBuffer.writeArray(
			['${surroundingString}', '${text}', '${surroundingString}']
		);
		return stringBuffer.read();
	}

	public static function mappedSurround(text:String, ?surroundArray:Array<String>):String {
		if (surroundArray.length > 2) {
			return "";
		}
		var stringBuffer:StringBuffer = new StringBuffer();
		stringBuffer.writeArray(
			['${surroundArray[0]}', '${text}', '${surroundArray[1]}']
		);
		return stringBuffer.read();
	}
}
