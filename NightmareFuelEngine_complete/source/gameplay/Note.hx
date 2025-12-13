package gameplay;

class Note {
    public var time:Float;
    public var lane:Int;
    public var isHold:Bool;

    public function new(time:Float, lane:Int, ?isHold:Bool) {
        this.time = time;
        this.lane = lane;
        this.isHold = isHold == null ? false : isHold;
    }
}
