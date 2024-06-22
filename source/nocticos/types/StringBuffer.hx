package nocticos.types;

using StringTools;

enum WriteMode {
	WRITE;
	APPEND;
	READ;
}

class StringBuffer {
	private var _stringContent:String = '';

	public function new():Void {
		this._stringContent = '';
	}

	public function writeString(string:Null<String>, ?mode:Null<WriteMode>):Void {
		if (s != null) {
			_stringContent.push(string)
		} else {
			return;
		}
	}

	private function _contentWrite(c:Null<String>, writeMode:Null<WriteMode>):Void {
		if (writeMode != null) {
			switch(writeMode) {
				case WRITE:
					_stringContent = c;
				case APPEND:
					_stringContent += c;
				case READ:
					var osc:String = _stringContent;
					_stringContent = _contentRead();
			}
		}
	}

	private _contentRead():String {
		return _stringContent;
	}

	public function quotifyString(string:Null<String>):String {
		if (s != null) {
			return '${\"string\"}';
		}
		return "";
	}
}