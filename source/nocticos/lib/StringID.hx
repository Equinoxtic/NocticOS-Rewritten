package nocticos.lib;

using StringTools;

class StringID {
	public static function generate(id:Null<Int>):String {
		if (id == null) {
			return null;
		}

		var seperatedIndexes:Array<Int> = [];

		if (id >= 1000) {
			seperatedIndexes.push(_calculate(id, 1000));
		}

		seperatedIndexes.push(_calculate(id, 100));
		seperatedIndexes.push(_calculate(id, 10));
		seperatedIndexes.push(_calculate(id, 1));

		var r:String = '';

		for (i in 0 ... seperatedIndexes.length) {
			r += Std.string(seperatedIndexes[i]);
		}

		return r;
	}

	@:noPrivateAccess
	private static function _calculate(id:Int, v:Int):Int {
		return (Math.floor(id / v) % 10);
	}
}
