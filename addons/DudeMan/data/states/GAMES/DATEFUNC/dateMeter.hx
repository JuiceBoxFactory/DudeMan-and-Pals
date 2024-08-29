import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.math.FlxRect;
import flixel.text.FlxTextBorderStyle;

var animationPlaying = false;
var barMax = 100;
var type = "love";
var saveDataCheck = FlxG.save.data.kathyBar;
var shake = false;

function create() {

    persistentUpdate = true;

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

    bar = new FlxSprite(-50, 70).loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
	bar.scrollFactor.set(0, 0);
    bar.cameras = [awesomeCam];
	add(bar);

    fill = new FlxSprite(-44, 77).loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/love'));
	fill.scrollFactor.set(0, 0);
    fill.cameras = [awesomeCam];
	add(fill);

    text = new FlxText(-50, 280, 400);
    text.text = type.toUpperCase(type)+" METER\n"+FlxG.save.data.showbar.toUpperCase(FlxG.save.data.showbar);
    text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    text.color = 0xFF130022;
    text.antialiasing = false;
    text.borderColor = 0xFFFBF1FF;
    text.borderSize = 2.25;
    text.cameras = [awesomeCam];
    add(text);

    showBar(FlxG.save.data.showbar);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [awesomeCam];
    add(cursor);

}

function showBar(person) {

    FlxTween.tween(bar, {x: 15}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(text, {x: 15}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(fill, {x: 21}, 1, {ease:FlxEase.quartOut}); 

}

function checkMeterType(person) {

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;
    
    switch (person) {

        case "kathy":

            saveDataCheck = FlxG.save.data.kathyBar;

        case "dudeman":


    }

    var prevType = type;

    if (saveDataCheck < 0) {
        type = "hate";
        bar.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/hateMeter'));
        fill.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/hate'));
    }
    else if (saveDataCheck > 1000) {
        type = "friend";
        bar.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
        fill.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/friendship'));
    }
    else {
        type = "love";
        bar.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
        fill.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/love'));
    }

    if (type != prevType) {
        shake = true;
        trace("\nmeter is now "+type);
        new FlxTimer().start(0.5, function(timer) {
            shake = false;
        });
    }

}

var trueOutput = 0;

function update() {

    text.text = type.toUpperCase(type)+" METER\n"+FlxG.save.data.showbar.toUpperCase(FlxG.save.data.showbar);

    if (shake == true) {
        bar.x = 15 + FlxG.random.int(-1.5, 1.5);
        bar.y = 70 + FlxG.random.int(-1.5, 1.5);
        text.x = bar.x;
        text.y = bar.y + 210;
        fill.x = bar.x + 6;
        fill.y = bar.y + 7;
    }

    checkMeterType(FlxG.save.data.showbar);

    if (type == "hate" && saveDataCheck * (-1) > trueOutput) {
        shake = true;
        new FlxTimer().start(0.5, function(timer) {
            shake = false;
        });
    }

    if (type == "love") {
        trueOutput = saveDataCheck;
    }
    if (type == "hate") {
        trueOutput = saveDataCheck * (-1);
    }
    if (type == "friend") {
        trueOutput = saveDataCheck - 1000;
    }

    if (type == "hate") {
        text.borderColor = 0xFF111111;
        text.color = 0xFFFDFDFD;
    }
    else {
        text.borderColor = 0xFF130022;
        text.color = 0xFFF7DCF7;
    }

    var sillyGooseling = ((100 - trueOutput) * 2);
    if (sillyGooseling < 0) {
        sillyGooseling = 0;
    }

    var clip = new FlxRect(0, sillyGooseling, fill.frameWidth, fill.frameHeight);
    fill.clipRect = clip;

}