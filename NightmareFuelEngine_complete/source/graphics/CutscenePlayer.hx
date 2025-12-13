package graphics;

import backend.LogHandler;

class CutscenePlayer {
    public static function play(path:String, unskippable:Bool = false):Void {
        LogHandler.log("Play cutscene: " + path + " unskippable=" + unskippable);
        // placeholder - integrate an MP4 player later
    }
}
