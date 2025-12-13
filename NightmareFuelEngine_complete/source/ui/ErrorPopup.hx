package ui;

import openfl.display.Sprite;
import openfl.text.TextField;

class ErrorPopup extends Sprite {
    public function new(msg:String) {
        super();
        var tf = new TextField();
        tf.text = msg;
        tf.width = 600;
        tf.height = 100;
        this.addChild(tf);
    }
}
