package;

import lime.app.Application;
import flixel.FlxGame;

class Main extends FlxGame {
    public function new() {
        super(1280, 720, TitleState);

        // Set window title using your engine metadata
        Application.current.window.title =
            EngineData.ENGINE_NAME + " - v" + EngineData.ENGINE_VERSION;
    }
}
