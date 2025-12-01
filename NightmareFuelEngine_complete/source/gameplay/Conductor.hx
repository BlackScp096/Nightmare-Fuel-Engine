package gameplay;

class Conductor {
    public static var bpm:Float = 120;
    public static var songPos:Float = 0;

    public static function update(dt:Float):Void {
        songPos += dt;
    }
}
