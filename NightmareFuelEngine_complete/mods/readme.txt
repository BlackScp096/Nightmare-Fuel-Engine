📁 Full Mod Folder Structure (Explained)

mods/
    This is where ALL mods go.

📁 myMod/
    A single mod folder.
    Everything inside belongs ONLY to this mod.

--------------------------------------------------
📁 data/
    Song chart folders
    Song metadata (.json)
    Custom difficulty settings
    Cutscene triggers
    Psych-style songname.json files

    Examples:
    mods/myMod/data/SongA/
    mods/myMod/data/SongB/

--------------------------------------------------
📁 characters/
    Character XML/PNG (Psych-style):

    Example:
    CharacterA.xml
    CharacterA.png
    Enemy.xml
    Enemy.png

--------------------------------------------------
📁 images/
    Extra images like:

    - title cards
    - HUD elements
    - stage props
    - logo graphics
    - extra animations

    Examples:
    images/hpbar.png
    images/customLogo.png
    images/jumpscare.png

--------------------------------------------------
📁 songs/
    Actual music and vocals:

    songs/SongA/SongA-inst.ogg
    songs/SongA/SongA-voices.ogg

--------------------------------------------------
📁 scripts/
    Lua or HScript used by the mod:

    scripts/effect.lua
    scripts/cameraZoom.lua
    scripts/onNoteHit.lua

    *Note: Custom events can also go here unless you use the folder below.*

--------------------------------------------------
📁 custom_events/
    Custom events for the mod:

    my_event.json
    my_event.lua

    Examples:
    custom_events/ScreenShake.lua
    custom_events/FlashRed.json

--------------------------------------------------
📁 videos/
    MP4 cutscenes (supported by the engine!)

    videos/intro.mp4
    videos/cutsceneA.mp4
    videos/cutsceneB.mp4

--------------------------------------------------
📁 weeks/
    Weeks, dialogue, character lists, backgrounds.

    WeekA.json
    WeekB.json

--------------------------------------------------
📁 stages/
    Stage scripts + images stored in images/ folder.

    Example:
    stages/room.lua
    stages/hallway.hx

--------------------------------------------------
🎯 YES — This folder structure is correct and fully engine-ready.

mods/
    myMod/
        data/
        characters/
        images/
        songs/
        scripts/
        custom_events/
        videos/
        weeks/
        stages/
