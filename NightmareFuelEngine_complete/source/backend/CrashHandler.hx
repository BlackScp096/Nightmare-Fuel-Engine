package backend;

import sys.FileSystem;
import sys.io.File;
import haxe.CallStack;
import Paths;
import Date;

class CrashHandler {
    public static function init():Void {
        // nothing complex here; call logCrash when needed
    }

    public static function logCrash(error:String, stack:String):Void {
        Paths.ensure();
        var ts = Paths.timestamp();
        var folder = Paths.CRASHLOGS;
        if (!sys.FileSystem.exists(folder)) sys.FileSystem.createDirectory(folder);
        var path = folder + "/crash_" + ts + ".txt";
        var content = "[CRASH] " + Date.now().toString() + "\nError: " + error + "\n\nStack Trace:\n" + stack + "\n\n----------------------------------------\nThis CrashLogs handler by BlackScp096\n";
        File.saveContent(path, content);
    }
}
