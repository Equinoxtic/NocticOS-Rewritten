package nocticos;

class Paths {
	public static inline function file(name:String, ?ext:String = ""):String {
		return getAsset('$name$ext');
	}

	public static inline function getAsset(key:String, ?library:String = 'assets/data/'):String {
		return '${library}${key}';
	}
}
