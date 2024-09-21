package nocticos.types;

import nocticos.util.ArrayUtil;
using StringTools;

enum WriteMode {
	WRITE;
	APPEND;
	SPLIT_APPEND;
}

class StringBuffer {
	private var _stringContent:Array<String> = [];

	/**
	 * Create a new StringBuffer.
	 */
	public function new():Void {}

	/**
	 * Writes to the current StringBuffer with the given write mode.
	 * @param string The string to write into the StringBuffer.
	 * @param mode The writing mode for the StringBuffer. (APPEND | WRITE)
	 */
	public function write(string:Null<String>, ?mode:Null<WriteMode> = APPEND):Void {
		if (string != null) {
			_contentWrite(string, mode);
		}
	}

	/**
	 * Writes the current array of string to the StringBuffer. The write mode is always ``APPEND`` by default.
	 * @param stringArray The array of strings to be written into the StringBuffer.
	 */
	public function writeArray(stringArray:Null<Array<String>>):Void {
		if (stringArray == null || stringArray.length <= 0) {
			return;
		}
		for (i in 0...stringArray.length) {
			_contentWrite(stringArray[i], WriteMode.APPEND);
		}
	}

	/**
	 * Outputs the StringBuffer's content with a ``Sys.print()`` call.
	 */
	public function out():Void {
		if (this._stringContent != null) {
			Sys.print(_getStringContent(this));
		}
	}

	/**
	 * Reads and returns the string / contents of the StringBuffer.
	 * @return String
	 */
	public function read():String {
		if (this._stringContent != null) {
			return _getStringContent(this);
		}
		return "";
	}

	/**
	 * Compares the contents of two StringBuffers.
	 * @return Bool
	 */
	public function compare(s_buf_a:StringBuffer, s_buf_b:StringBuffer):Bool {
		if (s_buf_a == null || s_buf_b == null) {
			return false;
		}
		return (_getStringContent(s_buf_a) == _getStringContent(s_buf_b));
	}

	/**
	 * Clears the current StringBuffer.
	 */
	public function clear():Void {
		ArrayUtil.clearArray(this._stringContent);
	}

	private function _contentWrite(string:Null<String>, writeMode:Null<WriteMode>):Void {
		if (string == null || string.charAt(0) == '') {
			return;
		}
		if (writeMode != null) {
			switch(writeMode) {
				case WRITE:
					ArrayUtil.clearArray(this._stringContent);
					this._stringContent[0] = string;
				case APPEND:
					this._stringContent.push(string);
				case SPLIT_APPEND:
					var split:Array<String> = string.split(',');
					if (split != null) {
						for (i in 0...split.length) {
							this._stringContent.push(split[i]);
						}
					}
			}
		}
	}

	private function _getStringContent(sbuf:StringBuffer):String {
		if (sbuf != null) {
			var buf:String = "";
			for (i in 0...sbuf._stringContent.length) {
				buf += sbuf._stringContent[i];
			}
			return buf;
		} else {
			return null;
		}
	}
}
