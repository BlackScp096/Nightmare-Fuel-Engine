package gameplay;

import backend.LogHandler;

class NoteHandler {
    public static var ghostTap:Bool = true;
    public var notes:Array<Note> = [];

    public function new() {
        LogHandler.log("NoteHandler initialized (4-key).");
    }

    public function add(note:Note):Void {
        notes.push(note);
    }

    // Check input: returns true if a hit or miss (true = consumed as miss/hit), false = ignored (ghost tap)
    public function onInput(lane:Int, now:Float):Bool {
        // simple proximity check: if a note has same lane and time within window
        var window = 0.15; // seconds allowed
        for (n in notes) {
            if (n.lane == lane && Math.abs(n.time - now) <= window) {
                // hit
                LogHandler.log('Note hit on lane ' + lane);
                notes.remove(n);
                return true;
            }
        }
        // no note found
        if (ghostTap) {
            LogHandler.log('Ghost tap ignored on lane ' + lane);
            return false;
        } else {
            LogHandler.log('Miss registered on lane ' + lane);
            return true;
        }
    }
}
