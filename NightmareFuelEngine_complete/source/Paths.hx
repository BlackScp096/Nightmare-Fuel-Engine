package;

import sys.FileSystem;
import sys.io.File;

class Paths {
    public static inline var MODS:String = "mods";
    public static inline var ASSETS:String = "assets";
    public static inline var GAMELOGS:String = "gamelogs";
    public static inline var CRASHLOGS:String = "crashlogs";

    public static function ensure():Void {
        var arr = [MODS, ASSETS, GAMELOGS, CRASHLOGS];
        for (p in arr) {
            if (!FileSystem.exists(p)) FileSystem.createDirectory(p);
        }
    }

    public static function timestamp():String {
        return Date.now().toString().replace(" ", "_").replace(":", "-");
    }
}
