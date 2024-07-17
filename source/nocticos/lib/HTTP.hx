package nocticos.lib;

import haxe.Http as HaxeHTTP;

using StringTools;

class HTTP {
	// HTTP UserAgent.
	private static final userAgent:String = 'request';

	/**
	 * Requests and returns the contents of the given URL.
	 * @param url The given URL to request.
	 * @return String
	 */
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
