package events;

import backend.LogHandler;

class EventManager {
    public static function load(modPath:String):Void {
        LogHandler.log("EventManager: load events for " + modPath);
    }
}
