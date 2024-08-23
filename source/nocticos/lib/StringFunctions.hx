package nocticos.lib;

using StringTools;

class StringFunctions {
	/**
	 * Checks whether the entire content of the string is empty.
	 * @return Bool
	 */
	public static function isEmpty(string:Null<String>):Bool {
		return (string == '');
	}

	/**
	 * Checks whether the string is just an empty whitespace.
	 * @return Bool
	 */
	public static function isWhitespace(string:Null<String>):Bool {
		return (string.trim().charAt(0) == '');
	}

	/**
	 * Checks whether the string is null.
	 * @return Bool
	 */
	public static function isNull(string:Null<String>):Bool {
		return (string == null);
	}

	/**
	 * Checks whether the string is null or empty.
	 * @return Bool
	 */
	public static function isNullOrEmpty(string:Null<String>):Bool {
		return (isNull(string) || isEmpty(string));
	}

	/**
	 * Checks whether the string is null or is a whitespace.
	 * @return Bool
	 */
	public static function isNullOrWhitespace(string:Null<String>):Bool {
		return (isNull(string) || isWhitespace(string));
	}

	/**
	 * Compare two different strings.
	 * @return Bool
	 */
	public static function compare(stringA:Null<String>, stringB:Null<String>):Bool {
		return (stringA == stringB);
	}

	/**
	 * C style comparison between two strings.
	 * @return Int
	 */
	public static function cstrcmp(stringA:Null<String>, stringB:Null<String>):Int {
		return ((stringA != stringB) ? 1 : 0);
	}
}
