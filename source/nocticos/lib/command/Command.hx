package nocticos.lib.command;

class Command {
	public static var _commandsList:Array<Dynamic> = [];

	public static function insantiateCommand(commandInstance:BaseCommand):Void {
		commandInstance._handle();
	}
}

class BaseCommand {
	public var name:String = "Command";
	public var alias:String = "cmd";
	public var flagList:Array<String> = [];

	public function new(flags:Array<String>):Void {}

	public function _handle():Void {
		#if (debug)
		Sys.stdout().writeString("\n\nCreated command instance\n\n")
		#end
	}
}