import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.math.FlxRect;
import flixel.util.FlxSpriteUtil;

var iFUCKINGHATEARRAYSwaitilied:FlxSpriteGroup<FlxSprite> = [];
var iFUCKINGHATEARRAYSwaitilied2:FlxSpriteGroup<FlxSprite> = [];
var iFUCKINGLOVEARRAYSwaititrue:FlxSpriteGroup<FlxText> = [];

var saveNumber = null;
var selected = null;
var posYBeButtons = 200;
var prevFile;
var canBePressed = false;

function create() {

    persistentUpdate = true;

    clipCAM = new FlxCamera(92, 48, 1096, 624);
    FlxG.cameras.add(clipCAM, false);
    clipCAM.bgColor = 0x00000000;

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

    clipCAM2 = new FlxCamera(92, 48, 1096, 624);
    FlxG.cameras.add(clipCAM2, false);
    clipCAM2.bgColor = 0x00000000;
    
    cursorCAM = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(cursorCAM, false);
    cursorCAM.bgColor = 0x00000000;

	bgOverflow = new FlxBackdrop(Paths.image('ui/bg'));
	bgOverflow.moves = true;
	bgOverflow.scrollFactor.set(0, 0);
	bgOverflow.velocity.x = 50;
	bgOverflow.velocity.y = 50;
	bgOverflow.active = true;
    bgOverflow.alpha = 1;
    bgOverflow.cameras = [clipCAM];
	add(bgOverflow);

    title = new FlxSprite(0, 75).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/Title'));
    title.cameras = [awesomeCam];
    title.screenCenter(FlxAxes.X);
    title.scrollFactor.set(0, 0);
	add(title);

    for (i in 0...8) {

        truFileBoxText = new FlxText(0, 360, 208);
        truFileBoxText.setFormat(Paths.font("Bahnschrift.ttf"), 20, 0xFFFEF9FF, "center", FlxTextBorderStyle.OUTLINE, 0xFF130022);        
        truFileBoxText.text = "MENU IS BROKEN";
        truFileBoxText.x = ((280 * i) + 22);
        truFileBoxText.cameras = [clipCAM];
        truFileBoxText.borderSize = 2.1;
        iFUCKINGLOVEARRAYSwaititrue.push(truFileBoxText);
        add(truFileBoxText);

    }

    mouseSpotL = new FlxSprite(100, 56).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/mouseSpot'));
    mouseSpotL.cameras = [cursorCAM];
    mouseSpotL.scrollFactor.set(0, 0);
    mouseSpotL.alpha = 0;
    add(mouseSpotL);

    mouseSpotR = new FlxSprite(1040, 56).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/mouseSpot'));
    mouseSpotR.cameras = [cursorCAM];
    mouseSpotR.scrollFactor.set(0, 0);
    mouseSpotR.alpha = 0;
    add(mouseSpotR);

    saveBut = new FlxSprite(117, 200).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/save'));
    saveBut.cameras = [awesomeCam];
    add(saveBut);

    loadBut = new FlxSprite(186, 200).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/load'));
    loadBut.cameras = [awesomeCam];
    add(loadBut);

    deleteBut = new FlxSprite(255, 200).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/delete'));
    deleteBut.cameras = [awesomeCam];
    add(deleteBut);

    textBut = new FlxText(113, 430, 208);
    textBut.setFormat(Paths.font("Bahnschrift.ttf"), 20, 0xFFFEF9FF, "center", FlxTextBorderStyle.OUTLINE, 0xFF130022);        
    textBut.text = "NONE SELC";
    textBut.cameras = [awesomeCam];
    textBut.borderSize = 2.1;
    add(textBut);

    for (i in 0...8) {

        truFileBox = new FlxSprite(92, 198).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        truFileBox.cameras = [awesomeCam];
        truFileBox.x = ((280 * i) + 22) + 92;
        truFileBox.alpha = 0;
        iFUCKINGHATEARRAYSwaitilied.push(truFileBox);
        add(truFileBox);

        fakeFileBox = new FlxSprite(0, 150).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        fakeFileBox.cameras = [clipCAM2];
        fakeFileBox.x = (280 * i) + 22;
        iFUCKINGHATEARRAYSwaitilied2.push(fakeFileBox);
        add(fakeFileBox);

    }

    fileBox = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/box'));
    fileBox.cameras = [clipCAM2];
    fileBox.scrollFactor.set(0, 0);
	add(fileBox);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCAM];
    add(cursor);

    loadSave(null);

}

function fileOptions(file) {

    if (prevFile != file) {
        selected = file;
        canBePressed = true;
        posYBeButtons = 400;
        prevFile = file;
        
        saveBut.alpha = 1;

        saveBut.x = (3 + ((280 * file) + 22)) + 92;
        loadBut.x = (72 + ((280 * file) + 22)) + 92;
        deleteBut.x = (141 + ((280 * file) + 22)) + 92;

        for (i in 0...iFUCKINGLOVEARRAYSwaititrue.length) {
            iFUCKINGLOVEARRAYSwaititrue[i].alpha = 1;  
        }
        iFUCKINGLOVEARRAYSwaititrue[file].alpha = 0.5;

    }
    else {
        selected = null;
        canBePressed = false;
        prevFile = null;
        posYBeButtons = 200;
        iFUCKINGLOVEARRAYSwaititrue[file].alpha = 1;
    }

}

function setSaveData(file) {

    var num = file;

    iFUCKINGHATEARRAYSwaitilied2[file].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquareFILED'));
    if (FlxG.save.data.name == null) {
        iFUCKINGLOVEARRAYSwaititrue[file].text = "SAVE FILE "+(file + 1)+"\n\nSCENE:\n"+FlxG.save.data.fileSceneName+"\n\nDAY:\n"+FlxG.save.data.curDay;
    }
    else {
        iFUCKINGLOVEARRAYSwaititrue[file].text = "SAVE FILE "+(file + 1)+"\nNAME:\n"+FlxG.save.data.name+"\n\nSCENE:\n"+FlxG.save.data.fileSceneName+"\n\nDAY:\n"+FlxG.save.data.curDay;
    }
    var arrayToUse2 = [
        "FlxG.save.data.datingDialogue" => FlxG.save.data.datingDialogue,
        "FlxG.save.data.datingChar1Asset" => FlxG.save.data.datingChar1Asset,
        "FlxG.save.data.datingChar2Asset" => FlxG.save.data.datingChar2Asset,
        "FlxG.save.data.datingChar1X" => FlxG.save.data.datingChar1X,
        "FlxG.save.data.datingChar2X" => FlxG.save.data.datingChar2X,
        "FlxG.save.data.name" => FlxG.save.data.name,
        "FlxG.save.data.datingChar1State" => FlxG.save.data.datingChar1State,
        "FlxG.save.data.datingChar2State" => FlxG.save.data.datingChar2State,
        "FlxG.save.data.datingScene" => FlxG.save.data.datingScene,
        "FlxG.save.data.boxState" => FlxG.save.data.boxState,
        "FlxG.save.data.datingBackground" => FlxG.save.data.datingBackground,
        "FlxG.save.data.showbar" => FlxG.save.data.showbar,
        "FlxG.save.data.kathyBar" => FlxG.save.data.curDay,
        "FlxG.save.data.fileSceneName" => FlxG.save.data.fileSceneName,
        "FlxG.save.data.curDay" => FlxG.save.data.curDay,
        "FlxG.save.data.energy" => FlxG.save.data.energy,
        "FlxG.save.data.kathyInteractedMonday" => FlxG.save.data.kathyInteractedMonday,
        "FlxG.save.data.fruityInteractedMonday" => FlxG.save.data.fruityInteractedMonday,
        "FlxG.save.data.dudemanInteractedMonday" => FlxG.save.data.dudemanInteractedMonday,
    ];
    FlxG.save.data.fileDesc[num] = ""+iFUCKINGLOVEARRAYSwaititrue[file].text;
    selected = null;
    canBePressed = false;
    prevFile = null;
    posYBeButtons = 200;
    iFUCKINGLOVEARRAYSwaititrue[file].alpha = 1;

        // SHITTY BAD CODE NEVER DO THIS ITS INSANE JANK
            if (file == 0) {
                FlxG.save.data.datingSave1 = arrayToUse2;
            }
            if (file == 1) {
                FlxG.save.data.datingSave2 = arrayToUse2;
            }
            if (file == 2) {
                FlxG.save.data.datingSave3 = arrayToUse2;
            }
            if (file == 3) {
                FlxG.save.data.datingSave4 = arrayToUse2;
            }
            if (file == 4) {
                FlxG.save.data.datingSave5 = arrayToUse2;
            }
            if (file == 5) {
                FlxG.save.data.datingSave6 = arrayToUse2;
            }
            if (file == 6) {
                FlxG.save.data.datingSave7 = arrayToUse2;
            }
            if (file == 7) {
                FlxG.save.data.datingSave8 = arrayToUse2;
            }

}

function fileExists(theNum) {

    iFUCKINGLOVEARRAYSwaititrue[theNum].text = FlxG.save.data.fileDesc[theNum];
    iFUCKINGHATEARRAYSwaitilied2[theNum].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquareFILED'));

}

function deleteSaveData(file) {

    selected = null;
    canBePressed = false;
    prevFile = null;
    posYBeButtons = 200;
    iFUCKINGLOVEARRAYSwaititrue[file].alpha = 1;
    FlxG.save.data.fileDesc[file] = null;

    // SHITTY BAD CODE NEVER DO THIS ITS INSANE JANK
        if (file == 0) {
            FlxG.save.data.datingSave1 = "blank";
        }
        if (file == 1) {
            FlxG.save.data.datingSave2 = "blank";
        }
        if (file == 2) {
            FlxG.save.data.datingSave3 = "blank";
        }
        if (file == 3) {
            FlxG.save.data.datingSave4 = "blank";
        }
        if (file == 4) {
            FlxG.save.data.datingSave5 = "blank";
        }
        if (file == 5) {
            FlxG.save.data.datingSave6 = "blank";
        }
        if (file == 6) {
            FlxG.save.data.datingSave7 = "blank";
        }
        if (file == 7) {
            FlxG.save.data.datingSave8 = "blank";
        }
    
    saveNumber = file;
    new FlxTimer().start(0.25, function(timer) {
        loadSave(file);
    });

}

function loadTheFile(file) {

    var faggot;
    
    if (file == 0) {
        faggot = FlxG.save.data.datingSave1;
    }
    if (file == 1) {
        faggot = FlxG.save.data.datingSave2;
    }
    if (file == 2) {
        faggot = FlxG.save.data.datingSave3;
    }
    if (file == 3) {
        faggot = FlxG.save.data.datingSave4;
    }
    if (file == 4) {
        faggot = FlxG.save.data.datingSave5;
    }
    if (file == 5) {
        faggot = FlxG.save.data.datingSave6;
    }
    if (file == 6) {
        faggot = FlxG.save.data.datingSave7;
    }
    if (file == 7) {
        faggot = FlxG.save.data.datingSave8;
    }

    if (faggot["FlxG.save.data.datingDialogue"] != null) {
        FlxG.save.data.datingDialogue = faggot["FlxG.save.data.datingDialogue"];
        FlxG.save.data.datingChar1Asset = faggot["FlxG.save.data.datingChar1Asset"];
        FlxG.save.data.datingChar2Asset = faggot["FlxG.save.data.datingChar2Asset"];
        FlxG.save.data.datingChar1X = faggot["FlxG.save.data.datingChar1X"];
        FlxG.save.data.datingChar2X = faggot["FlxG.save.data.datingChar2X"];
        FlxG.save.data.name = faggot["FlxG.save.data.name"];
        FlxG.save.data.datingChar1State = faggot["FlxG.save.data.datingChar1State"];
        FlxG.save.data.datingChar2State = faggot["FlxG.save.data.datingChar2State"];
        FlxG.save.data.datingScene = faggot["FlxG.save.data.datingScene"];
        FlxG.save.data.boxState = faggot["FlxG.save.data.boxState"];
        FlxG.save.data.datingBackground = faggot["FlxG.save.data.datingBackground"];
        FlxG.save.data.showbar = faggot["FlxG.save.data.showbar"];
        FlxG.save.data.kathyBar = faggot["FlxG.save.data.kathyBar"];
        FlxG.save.data.fileSceneName = faggot["FlxG.save.data.fileSceneName"];
        FlxG.save.data.curDay = faggot["FlxG.save.data.curDay"];
        FlxG.save.data.energy = faggot["FlxG.save.data.energy"];
        FlxG.save.data.fruityInteractedMonday = faggot["FlxG.save.data.fruityInteractedMonday"];
        FlxG.save.data.dudemanInteractedMonday = faggot["FlxG.save.data.dudemanInteractedMonday"];
        FlxG.save.data.kathyInteractedMonday = faggot["FlxG.save.data.kathyInteractedMonday"];
    }
    else {
        FlxG.save.data.datingDialogue = faggot["FlxG.save.data.datingDialogue"];
    }

        FlxG.switchState(new ModState("GAMES/datingSim"));

}

function loadSave(number) {

//	for (datingSaves in [FlxG.save.data.datingSave1, FlxG.save.data.datingSave2, FlxG.save.data.datingSave3, FlxG.save.data.datingSave4, FlxG.save.data.datingSave5, FlxG.save.data.datingSave6, FlxG.save.data.datingSave7, FlxG.save.data.datingSave8]) {
//  unfortunately, this didnt work. i must do. really shitty bad code, for the fourth time.

    var arrayToUse = [
        "FlxG.save.data.datingDialogue" => null,
    ];

    if (number != null) {
        iFUCKINGHATEARRAYSwaitilied2[number].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[number].text = "NO DATA IN SAVE "+(number + 1)+", COMPLETELY CLEAN!";
    }
    else {
        iFUCKINGHATEARRAYSwaitilied2[0].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[0].text = "NO DATA IN SAVE "+1+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[1].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[1].text = "NO DATA IN SAVE "+2+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[2].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[2].text = "NO DATA IN SAVE "+3+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[3].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[3].text = "NO DATA IN SAVE "+4+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[4].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[4].text = "NO DATA IN SAVE "+5+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[5].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[5].text = "NO DATA IN SAVE "+6+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[6].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[6].text = "NO DATA IN SAVE "+7+", COMPLETELY CLEAN!";
        iFUCKINGHATEARRAYSwaitilied2[7].loadGraphic(Paths.image('shh/DATINGSIM/fileMenu/saveFileSquare'));
        iFUCKINGLOVEARRAYSwaititrue[7].text = "NO DATA IN SAVE "+8+", COMPLETELY CLEAN!";
    }

    if (FlxG.save.data.datingSave1["FlxG.save.data.datingDialogue"] != null) {
        fileExists(0);
    }
    else {
        FlxG.save.data.datingSave1 = arrayToUse;
    }

    if (FlxG.save.data.datingSave2["FlxG.save.data.datingDialogue"] != null) {
        fileExists(1);
    }
    else {
        FlxG.save.data.datingSave2 = arrayToUse;
    }

    if (FlxG.save.data.datingSave3["FlxG.save.data.datingDialogue"] != null) {
        fileExists(2);
    }
    else {
        FlxG.save.data.datingSave3 = arrayToUse;
    }

    if (FlxG.save.data.datingSave4["FlxG.save.data.datingDialogue"] != null) {
        fileExists(3);
    }
    else {
        FlxG.save.data.datingSave4 = arrayToUse;
    }

    if (FlxG.save.data.datingSave5["FlxG.save.data.datingDialogue"] != null) {
        fileExists(4);
    }
    else {
        FlxG.save.data.datingSave5 = arrayToUse;
    }

    if (FlxG.save.data.datingSave6["FlxG.save.data.datingDialogue"] != null) {
        fileExists(5);
    }
    else {
        FlxG.save.data.datingSave6 = arrayToUse;
    }

    if (FlxG.save.data.datingSave7["FlxG.save.data.datingDialogue"] != null) {
        fileExists(6);
    }
    else {
        FlxG.save.data.datingSave7 = arrayToUse;
    }

    if (FlxG.save.data.datingSave8["FlxG.save.data.datingDialogue"] != null) {
        fileExists(7);
    }
    else {
        FlxG.save.data.datingSave8 = arrayToUse;
    }


}


function update(elapsed:Float) {

    textBut.x = saveBut.x - 4;
    textBut.y = saveBut.y + 30;

    for (sillies in [saveBut, loadBut, deleteBut]) {
        if (sillies.y < posYBeButtons) {
            sillies.y += 2;
        }
        if (sillies.y > posYBeButtons) {
            sillies.y -= 2;
        }
    }

    for (sillies in [saveBut, loadBut, deleteBut]) {
        if (saveBut.y == 200) {
            sillies.alpha = 0;
            textBut.alpha = 0;
        }
        else {
            sillies.alpha = 1;
            textBut.alpha = 1;
        }
    }

    if (FlxG.keys.justPressed.R) {
        FlxG.save.data.datingSave1 = "blank";
        FlxG.save.data.datingSave2 = "blank";
        FlxG.save.data.datingSave3 = "blank";
        FlxG.save.data.datingSave4 = "blank";
        FlxG.save.data.datingSave5 = "blank";
        FlxG.save.data.datingSave6 = "blank";
        FlxG.save.data.datingSave7 = "blank";
        FlxG.save.data.datingSave8 = "blank";
        FlxG.save.data.fileDesc = [];
        loadSave(null);
        trace('full reset');
    }

    for (i in 0...iFUCKINGHATEARRAYSwaitilied.length) {

        if (FlxG.mouse.overlaps(iFUCKINGHATEARRAYSwaitilied[i])) {
            if (FlxG.mouse.justReleased) {
                new FlxTimer().start(0.1, function(timer) {
                    fileOptions(i);
                });
            }
        }

    }

    if (FlxG.keys.justPressed.H) {
        FlxG.save.data.defaultSaveData = null;
    }

    if (FlxG.mouse.overlaps(saveBut) && canBePressed == true) {
        textBut.text = "SAVE";
        if (FlxG.mouse.justReleased) {
            setSaveData(selected);
        }
    }

    if (FlxG.mouse.overlaps(deleteBut) && canBePressed == true) {
        textBut.text = "DELETE";
        if (FlxG.mouse.justReleased) {
            deleteSaveData(selected);
        }
    }

    if (FlxG.mouse.overlaps(loadBut) && canBePressed == true) {
        textBut.text = "LOAD";
        if (FlxG.mouse.justReleased) {
            loadTheFile(selected);
        }
    }

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

    if (FlxG.keys.justPressed.ESCAPE) {
        FlxG.save.data.substateOpen = false;
        new FlxTimer().start(0.25, function(timer) {
            FlxG.switchState(new ModState("GAMES/datingSim"));
        });
    }

    if (FlxG.mouse.overlaps(mouseSpotL) && camera.scroll.x != 0) {
        camera.scroll.x -= 10;
        awesomeCam.scroll.x -= 10;
        clipCAM.scroll.x -= 10;
        clipCAM2.scroll.x -= 10;
        cursorCAM.scroll.x -= 10;
    }

    if (FlxG.mouse.overlaps(mouseSpotR) && camera.scroll.x != 1120) {
        camera.scroll.x += 10;
        awesomeCam.scroll.x += 10;
        clipCAM.scroll.x += 10;
        clipCAM2.scroll.x += 10;
        cursorCAM.scroll.x += 10;
    }

}