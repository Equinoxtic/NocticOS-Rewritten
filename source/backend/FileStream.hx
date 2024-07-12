package backend;

import nocticos.lib.Colorizer.Color;
import nocticos.util.StringFormatter;
import nocticos.types.StringBuffer.WriteMode;
import haxe.io.Bytes;
import sys.io.FileOutput;
import nocticos.util.debug.Error;
import sys.FileSystem;
import haxe.io.Eof;
import sys.io.File;
import sys.io.FileInput;

using StringTools;
using nocticos.util.StringUtil;

enum FileWriteMode {
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

enum ItemType {
	FILE;
	DIRECTORY;
}

class FileStream extends File {
	/**
	 * Writes to the file, given the content and the specific mode for writing.
	 * @param path The path of the file.
	 * @param s The content / data to be written to the file.
	 * @param writeMode The way how the data should be written.
	 */
	public static function writeFile(path:String, ?s:String = '', ?writeMode:Null<FileWriteMode> = FileWriteMode.STRING):Void {
		if (path == null || path == "") {
			return;
		}
		var file:FileOutput = File.append(path, false);
		if (file != null) {
			if (writeMode == null) {
				writeMode = FileWriteMode.STRING;
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
		return;
	}

	public static function clearFile(path:String):Void {
		if (path == null || path == "") {
			return;
		}
		if (FileSystem.exists(path)) {
			var file:FileOutput = File.write(path, false);
			if (file != null) {
				file.writeString('');
			}
			file.close();
		}
		return;
	}

	public static function readFile(path:String):String {
		var line:String = "";
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

	public static function newItem(path:Null<String>, ?type:Null<ItemType> = ItemType.FILE):Void {
		if (path == null || path.trim() == '' || type == null) {
			return;
		}
		switch(type) {
			case FILE:
				writeFile(path, '', FileWriteMode.STRING);
			case DIRECTORY:
				FileSystem.createDirectory(path);
		}
		Sys.print('Created: \"{0}\"'.format([
			StringFormatter.color(path, Color.YELLOW)
		]));
	}
}
