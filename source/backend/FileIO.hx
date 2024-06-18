package backend;

import nocticos.util.debug.Error;
import sys.FileSystem;
import haxe.io.Eof;
import sys.io.File;
import sys.io.FileInput;

class FileIO {
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