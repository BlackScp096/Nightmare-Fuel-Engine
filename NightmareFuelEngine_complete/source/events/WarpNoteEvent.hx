package events;

class WarpNoteEvent {
    public static function trigger(id:Int):Void {
        trace("WarpNoteEvent triggered: " + id);
    }
}
