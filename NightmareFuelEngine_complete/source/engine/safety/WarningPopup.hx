package engine.safety;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.Lib;

class WarningPopup extends Sprite {
    public function new(message:String) {
        super();
        var tf = new TextField();
        tf.text = message;
        tf.width = 800;
        tf.height = 40;
        tf.selectable = false;
        this.addChild(tf);
    }

    public static function show(message:String):Void {
        try {
            var stage = Lib.current.stage;
            var p = new WarningPopup(message);
            stage.addChild(p);
        } catch (e:Dynamic) {}
    }
}
