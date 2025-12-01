package backend;

import sys.FileSystem;
import sys.io.File;
import Paths;
import Date;

class LogHandler {
    public static var filePath:String = "";

    public static function init():Void {
        Paths.ensure();
        var ts = Paths.timestamp();
        var folder = Paths.GAMELOGS;
        if (!FileSystem.exists(folder)) FileSystem.createDirectory(folder);
        filePath = folder + "/gamelog_" + ts + ".txt";
        File.saveContent(filePath, "[BOOT] " + Date.now().toString() + " - Nightmare Fuel Engine Started\n");
    }

    public static function log(msg:String):Void {
        if (filePath == "") return;
        var line = "[" + Date.now().toString() + "] " + msg + "\n";
        File.append(filePath, line);
    }

    public static function close():Void {
        if (filePath == "") return;
        File.append(filePath, "----------------------------------------\nThis GameLogs handler by BlackScp096\n");
    }
}
