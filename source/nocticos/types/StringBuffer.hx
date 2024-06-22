package nocticos.types;

using StringTools;

enum WriteMode {
	WRITE;
	APPEND;
}

class StringBuffer {
	private var _stringContent:Array<String> = [];

	public function new():Void {
		this._stringContent.push(""); // Push an empty string first
	}

	public function write(string:Null<String>, ?mode:Null<WriteMode> = WRITE):Void {
		if (string != null) {
			_contentWrite(string, mode);
		}
	}

	public function out():Void {
		if (this._stringContent.length != null) {
			Sys.print(_getStringContent(this));
		}
	}

	public function read():String {
		if (this._stringContent.length != null) {
			return _getStringContent(this);
		}
		return "";
	}

	public static function quotifyString(string:Null<String>):String {
		if (string != null) {
			return '\"${string}\"';
		}
		return "";
	}

	public function compare(a:StringBuffer, b:StringBuffer):Bool {
		return (_getStringContent(a) == _getStringContent(b));
	}

	private function _contentWrite(c:Null<String>, writeMode:Null<WriteMode>):Void {
		if (c == null) {
			return;
		}
		if (writeMode != null) {
			switch(writeMode) {
				case WRITE:
					this._stringContent[0] = c;
				case APPEND:
					this._stringContent.push(c);
			}
		}
	}

	private function _getStringContent(sbuf:StringBuffer):String {
		if (sbuf == null) {
			return "";
		}
		var buf:String = "";
		for (i in 0...sbuf._stringContent.length) {
			buf += sbuf._stringContent[i];
		}
		return buf;
	}
}