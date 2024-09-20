package nocticos.lib;

import nocticos.types.StringBuffer;
import nocticos.util.debug.Error;
using StringTools;

class StringID {
	private static var ASSIGNED_IDS:Array<Int> = [];

	private static var ASSIGNED_POOLS:Map<String, Array<Int>> = [];

	public static function assign(id:Null<Int>):String {
		if (id == null) {
			return null;
		}
		var existingID:Bool = false;
		var conflictingID:Int = 0;
		for (i in 0 ... ASSIGNED_IDS.length) {
			existingID = (id == ASSIGNED_IDS[i]);
			conflictingID = ASSIGNED_IDS[i];
			if (existingID) {
				break;
			}
		}
		if (existingID) {
			_crashOS(id, conflictingID);
		} else {
			_assignID(id);
		}
		return _separateIndexes(id);
	}

	public static function assignPool(id:Null<Int>):String {
		if (id == null) {
			return null;
		}
		final idString:String = Std.string(id);
		if (!ASSIGNED_POOLS.exists(idString)) {
			_assignIDToPool(id);
		}
		return _separateIndexes(id);
	}

	@:noPrivateAccess
	private static function _separateIndexes(id:Int):String {
		var indexes:Array<Int> = [];
		if (id >= 1000) {
			indexes.push(_calculate(id, 1000));
		}
		indexes.push(_calculate(id, 100));
		indexes.push(_calculate(id, 10));
		indexes.push(_calculate(id, 1));
		var buf:StringBuffer = new StringBuffer();
		for (i in 0 ... indexes.length) {
			buf.write(Std.string(indexes[i]));
		}
		final rbuf = buf.read();
		final r = rbuf;
		buf.clear();
		return r;
	}

	@:noPrivateAccess
	private static function _calculate(id:Int, v:Int):Int {
		return (Math.floor(id / v) % 10);
	}

	@:noPrivateAccess
	private static function _assignID(id:Int):Int {
		ASSIGNED_IDS.push(id);
		_logAssignedMessage(id);
		return 0;
	}

	@:noPrivateAccess
	private static function _assignIDToPool(id:Int):Int {
		final k:String = _separateIndexes(id);
		ASSIGNED_POOLS.set(k, []);
		ASSIGNED_POOLS.get(k).push(id);
		_logAssignedMessage(id);
		return 0;
	}

	@:noPrivateAccess
	private static function _logAssignedMessage(id:Int):Void {
		Logging.logMessage('Assigned ID: ${Std.string(id)}');
	}

	@:noPrivateAccess
	private static function _crashOS(id:Int, ?conflictingID:Int = 0):Void {
		var idString:String = _separateIndexes(id);
		var idStringConflicted:String = _separateIndexes(conflictingID);
		Logging.logMessage('ID $idString already exists! (CONFLICT)');
		Error.throwError(ExceptionType.ID_CONFLICT, 'ID \'$idString\' conflicts with ID \'$idStringConflicted\' as it already exists.');
	}
}
