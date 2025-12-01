package scripting;

import backend.LogHandler;

class ScriptManager {
    public static function run(path:String):Void {
        LogHandler.log("ScriptManager: running " + path);
    }
}
