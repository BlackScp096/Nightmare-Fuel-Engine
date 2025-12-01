package gameplay;

import backend.LogHandler;

class PlayState {
    public static function start(songPath:String):Void {
        LogHandler.log("PlayState: starting " + songPath);
        // placeholder: load chart and notes
        ChartParser.load(songPath);
    }
}
