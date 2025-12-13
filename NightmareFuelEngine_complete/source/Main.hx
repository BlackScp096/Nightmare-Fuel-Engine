package;

import openfl.Lib;
import openfl.display.Sprite;
import backend.LogHandler;
import backend.CrashHandler;
import util.EngineUpdateChecker;
import engine.safety.InappropriateContentScanner;
import sys.FileSystem;

class Main extends Sprite {
    public function new() {
        super();
        // Ensure folders
        Paths.ensure();
        // Init systems
        LogHandler.init();
        CrashHandler.init();
        LogHandler.log("Starting " + EngineData.ENGINE_NAME + " " + EngineData.ENGINE_VERSION);
        EngineUpdateChecker.checkForUpdates();
        // Set window title (if desktop supported)
        try {
            Lib.current.stage.window.title = EngineData.ENGINE_NAME + " - " + EngineData.ENGINE_VERSION;
        } catch (e:Dynamic) {}
        // Scan mods folder for suspicious items (warning only)
        try {
            if (FileSystem.exists(Paths.MODS)) {
                if (InappropriateContentScanner.scanMod(Paths.MODS)) {
                    LogHandler.log("Scanner found potential issues in mods folder.");
                }
            }
        } catch (e:Dynamic) {
            LogHandler.log("Scanner error: " + Std.string(e));
        }
        // Placeholder: show title screen or load states here
        LogHandler.log("Initialization complete. (Placeholder - add TitleState)");
    }

    public static function main() {
        Lib.current.addChild(new Main());
    }
}
