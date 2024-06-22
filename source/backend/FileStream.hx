package backend;

import haxe.io.Bytes;
import sys.io.FileOutput;
import nocticos.util.debug.Error;
import sys.FileSystem;
import haxe.io.Eof;
import sys.io.File;
import sys.io.FileInput;

enum WriteMode {
	/**
	 * Write into file as a String.
	 */
	STRING;

	/**
	 * Write into file as Bytes.
	 */
	BYTES;

	/**
	 * Write into file as an Int.
	 */
	INT;

	/**
	 * Write into file as a Float.
	 */
	FLOAT;

	/**
	 * Write into file as a Double.
	 */
	DOUBLE;
}

class FileStream extends File {
	/**
	 * Writes to the file, given the content and the specific mode for writing.
	 * @param path The path of the file.
	 * @param s The content / data to be written to the file.
	 * @param writeMode The way how the data should be written.
	 */
	public static function writeFile(path:String, ?s:String = '', ?writeMode:Null<WriteMode> = WriteMode.STRING):Void {
		if (path == null || path == "") {
			return;
		}

		#if (debug)
		trace('\n\nReading path: $path\n\n');
		#end

		if (FileSystem.exists(path)) {
			var file:FileOutput = File.write(path, false);
			if (file != null) {
				if (writeMode == null) {
					writeMode = WriteMode.STRING;
				}
				switch(writeMode) {
					case STRING:
						file.writeString(s);
					case BYTES:
						file.writeByte(Std.parseInt(s));
					case INT:
						file.writeInt32(Std.parseInt(s));
					case FLOAT:
						file.writeFloat(Std.parseFloat(s));
					case DOUBLE:
						file.writeDouble(Std.parseFloat(s));
				}
			}
			file.close();
		}

		return;
	}

	public static function readFile(path:String):String {
		var line:String = "";

		#if debug
		trace('\n\nReading path: $path\n\n');
		#end

		if (FileSystem.exists(path) && path != "" && path != null) {
			var file:FileInput = File.read(path, false);
			if (file != null) {
				line = file.readLine();
			}
			file.close();
		} else {
			Error.throwError(NO_PATH_EXISTS, 'Path does not exist! [$path]', true, true);
		}

		return line;
	}
}
