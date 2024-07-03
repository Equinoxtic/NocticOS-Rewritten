package nocticos.types;

using StringTools;

enum WriteMode {
	WRITE;
	APPEND;
}

class StringBuffer {
	private var _stringContent:Array<String> = [];

	/**
	 * Create a new StringBuffer.
	 */
	public function new():Void {
		this._stringContent.push(""); // Push an empty string first
	}

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
		this._stringContent.pop();
	}

	private function _contentWrite(stringContent:Null<String>, writeMode:Null<WriteMode>):Void {
		if (stringContent == null || stringContent.charAt(0) == '') {
			return;
		}
		if (writeMode != null) {
			switch(writeMode) {
				case WRITE:
					this._stringContent.pop(); // Pop everything in the array first so no strings can conflict with eachother.
					this._stringContent[0] = stringContent;
				case APPEND:
					this._stringContent.push(stringContent);
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
