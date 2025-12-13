package gameplay;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class ChartParser {
    public static function load(path:String):Void {
        trace("Load chart: " + path);
        try {
            var txt = File.getContent(path);
            var data = Json.parse(txt);
            // placeholder: parse notes and push to NoteHandler in actual gameplay
        } catch (e:Dynamic) {
            trace("Chart parse error: " + e);
        }
    }
}
