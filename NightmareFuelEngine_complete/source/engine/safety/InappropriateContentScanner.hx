package engine.safety;

import sys.FileSystem;
import sys.io.File;
import backend.LogHandler;
import Paths;

class InappropriateContentScanner {
    public static function scanMod(modPath:String):Bool {
        var flagged:Bool = false;
        try {
            if (!FileSystem.exists(modPath)) return false;
            var list = FileSystem.readDirectory(modPath);
            for (f in list) {
                var lower = f.toLowerCase();
                for (k in ScannerRules.filenameKeywords) {
                    if (lower.indexOf(k) != -1) {
                        flagged = true;
                        logFlag(modPath, "filename", f, k);
                        break;
                    }
                }
                if (flagged) break;
            }
            if (!flagged) {
                for (d in list) {
                    var lower = d.toLowerCase();
                    for (k in ScannerRules.folderKeywords) {
                        if (lower.indexOf(k) != -1) {
                            flagged = true;
                            logFlag(modPath, "folder", d, k);
                            break;
                        }
                    }
                    if (flagged) break;
                }
            }
            if (!flagged) {
                // scan nested JSON for metadata keys
                var all = FileSystem.readDirectoryTree(modPath);
                for (p in all) {
                    if (p.toLowerCase().endsWith(".json")) {
                        try {
                            var s = File.getContent(p).toLowerCase();
                            for (k in ScannerRules.metadataKeys) {
                                if (s.indexOf('"'+k+'"') != -1) {
                                    flagged = true;
                                    logFlag(modPath, "metadata", p, k);
                                    break;
                                }
                            }
                            if (flagged) break;
                        } catch (e:Dynamic) {}
                    }
                }
            }
        } catch (e:Dynamic) {
            LogHandler.log("Scanner error: " + Std.string(e));
        }
        return flagged;
    }

    static function logFlag(modPath:String, reason:String, item:String, keyword:String):Void {
        Paths.ensure();
        var folder = Paths.GAMELOGS;
        var ts = Paths.timestamp();
        var path = folder + "/scan_" + ts + ".txt";
        var content = "Inappropriate Content Scanner Report\n";
        content += "Timestamp: " + Date.now().toString() + "\n";
        content += "Mod scanned: " + modPath + "\n";
        content += "Flag reason: " + reason + "\n";
        content += "Item: " + item + "\n";
        content += "Keyword matched: " + keyword + "\n\n";
        content += "----------------------------------------\nThis GameLogs handler by BlackScp096\n";
        File.saveContent(path, content);
    }
}
