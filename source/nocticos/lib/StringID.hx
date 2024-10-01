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

	public static function assignPool(id:Null<Int>, ?poolName:Null<String>):String {
		if (id == null) {
			return null;
		}
		final idString:String = Std.string(id);
		if (!ASSIGNED_POOLS.exists(idString)) {
			_assignIDToPool(id, poolName);
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
		_logAssignedMessage(id, null);
		return 0;
	}

	@:noPrivateAccess
	private static function _assignIDToPool(id:Int, poolName:String):Int {
		var poolName_c:String = "";
		if (poolName == null) {
			poolName_c = 'POOL_${_separateIndexes(id)}';
		}
		ASSIGNED_POOLS.set(poolName_c, []);
		ASSIGNED_POOLS.get(poolName_c)
			.push(id);
		_logAssignedMessage(id, poolName);
		return 0;
	}

	@:noPrivateAccess
	private static function _logAssignedMessage(id:Int, ?pool:Null<String>):Void {
		var buf:StringBuffer = new StringBuffer();
		buf.write('Assigned ID: ${Std.string(id)}');
		if (pool != null) {
			buf.write(' @ Pool: $pool');
		}
		Logging.logMessage(buf.read());
		buf.clear();
	}

	@:noPrivateAccess
	private static function _crashOS(id:Int, ?conflictingID:Int = 0):Void {
		var idString:String = _separateIndexes(id);
		var idStringConflicted:String = _separateIndexes(conflictingID);
		Logging.logMessage('ID $idString already exists! (CONFLICT)');
		Error.throwError(ExceptionType.ID_CONFLICT, 'ID \'$idString\' conflicts with ID \'$idStringConflicted\' as it already exists.');
	}
}
