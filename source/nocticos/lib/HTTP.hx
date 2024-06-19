package nocticos.lib;

import haxe.Http as HaxeHTTP;

using StringTools;

class HTTP {

	public static final userAgent:String = 'request';

	public static function getStringFromURL(?url:Null<String> = ''):String {
		var res:String = null;

		if (url == null || url == '') {
			return null;
		}

		var http:HaxeHTTP = new HaxeHTTP(url);
		http.setHeader('User-Agent', userAgent);
		http.onData = function(_data:String):Void {
			if (res == null) {
				res = _data.split('\n')[0].trim();
			}
		}
		http.onError = function(_err:Dynamic):Void {
			throw _err;
		}
		http.request();

		return res;
	}
}
