import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.math.FlxRect;
import flixel.text.FlxTextBorderStyle;

var type = "love";
var saveDataCheck = FlxG.save.data.kathyBar;
var shake = false;
var prevPpl = null;
var type2 = "love";
var saveDataCheck2 = FlxG.save.data.kathyBar;
var shake2 = false;
var prevPpl2 = null;

function create() {

    persistentUpdate = true;

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

    bar = new FlxSprite(-100, 70).loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
	bar.scrollFactor.set(0, 0);
    bar.cameras = [awesomeCam];
	add(bar);

    fill = new FlxSprite(-94, 77).loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/love'));
	fill.scrollFactor.set(0, 0);
    fill.cameras = [awesomeCam];
	add(fill);

    text = new FlxText(-180, 280, 400);
    text.text = type.toUpperCase(type)+" METER\n"+FlxG.save.data.showbar.toUpperCase(FlxG.save.data.showbar);
    text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    text.color = 0xFF130022;
    text.antialiasing = false;
    text.borderColor = 0xFFFBF1FF;
    text.borderSize = 2.25;
    text.cameras = [awesomeCam];
    add(text);

    showBar(FlxG.save.data.showbar);

    if (FlxG.save.data.showbarSecondary != null) {
        create2();
    }

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [awesomeCam];
    add(cursor);

}

function create2() {

    bar2 = new FlxSprite(1275, 70).loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
	bar2.scrollFactor.set(0, 0);
    bar2.cameras = [awesomeCam];
	add(bar2);

    fill2 = new FlxSprite(1281, 77).loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/love'));
	fill2.scrollFactor.set(0, 0);
    fill2.cameras = [awesomeCam];
	add(fill2);

    text2 = new FlxText(1200, 280, 400);
    text2.text = type.toUpperCase(type)+" METER\n"+FlxG.save.data.showbarSecondary.toUpperCase(FlxG.save.data.showbarSecondary);
    text2.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    text2.color = 0xFF130022;
    text2.antialiasing = false;
    text2.borderColor = 0xFFFBF1FF;
    text2.borderSize = 2.25;
    text2.cameras = [awesomeCam];
    add(text2);

    showBar2(FlxG.save.data.showbarSecondary);

}

function showBar2() {

    FlxTween.tween(bar2, {x: 1180}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(text2, {x: 870}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(fill2, {x: 1186}, 1, {ease:FlxEase.quartOut}); 

}

function hideBar2() {

    FlxTween.tween(bar2, {x: 1275}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(text2, {x: 1281}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(fill2, {x: 1200}, 1, {ease:FlxEase.quartOut}); 

}

function showBar() {

    FlxTween.tween(bar, {x: 15}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(text, {x: 15}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(fill, {x: 21}, 1, {ease:FlxEase.quartOut}); 

}

function hideBar() {

    FlxTween.tween(bar, {x: -100}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(text, {x: -180}, 1, {ease:FlxEase.quartOut}); 
    FlxTween.tween(fill, {x: -94}, 1, {ease:FlxEase.quartOut}); 

}

function checkMeterType(person) {
    
    switch (person) {

        case null:

            hideBar();

        case "kathy":

            saveDataCheck = FlxG.save.data.kathyBar;

        case "dudeman":

            saveDataCheck = FlxG.save.data.dudemanBar;


        case "fruity":

            saveDataCheck = FlxG.save.data.fruityBar;

        case "zee":

            saveDataCheck = FlxG.save.data.zeeBar;

    }

    prevPpl = person;
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
        trace("meter is now "+type);
        new FlxTimer().start(0.5, function(timer) {
            shake = false;
        });
    }

}

var trueOutput = 0;

function update() {

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

    if (FlxG.save.data.showbar == null && FlxG.save.data.showbarSecondary == null && text.x == -180) {
        close();
    }
    
    if (FlxG.save.data.showbar != null) {
        text.text = type.toUpperCase(type)+" METER\n"+FlxG.save.data.showbar.toUpperCase(FlxG.save.data.showbar);
    }

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

    if (FlxG.save.data.showbarSecondary != null) {
        updateSecondary();
    }

}

function checkMeterType2(person) {
    
    switch (person) {

        case null:

            hideBar2();

        case "kathy":

            saveDataCheck2 = FlxG.save.data.kathyBar;

        case "dudeman":

            saveDataCheck2 = FlxG.save.data.dudemanBar;

        case "fruity":

            saveDataCheck2 = FlxG.save.data.fruityBar;

        case "zee":

            saveDataCheck2 = FlxG.save.data.zeeBar;

    }

    prevPpl2 = person;
    var prevType2 = type2;

    if (saveDataCheck < 0) {
        type2 = "hate";
        bar2.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/hateMeter'));
        fill2.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/hate'));
    }
    else if (saveDataCheck > 1000) {
        type2 = "friend";
        bar2.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
        fill2.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/friendship'));
    }
    else {
        type2 = "love";
        bar2.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/meter'));
        fill2.loadGraphic(Paths.image('shh/DATINGSIM/loveMeterShit/love'));
    }

    if (type2 != prevType2) {
        shake2 = true;
        trace("meter is now "+type2);
        new FlxTimer().start(0.5, function(timer) {
            shake2 = false;
        });
    }

}

var trueOutput2 = 0;

function updateSecondary() {

    checkMeterType2(FlxG.save.data.showbarSecondary);

    if (FlxG.save.data.showbarSecondary != null) {
        text2.text = type.toUpperCase(type)+" METER\n"+FlxG.save.data.showbarSecondary.toUpperCase(FlxG.save.data.showbarSecondary);
    }

    if (shake2 == true) {
        bar2.x = 15 + FlxG.random.int(-1.5, 1.5);
        bar2.y = 70 + FlxG.random.int(-1.5, 1.5);
        text2.x = bar.x;
        text2.y = bar.y + 210;
        fill2.x = bar.x + 6;
        fill2.y = bar.y + 7;
    }

    if (type2 == "hate" && saveDataCheck * (-1) > trueOutput2) {
        shake2 = true;
        new FlxTimer().start(0.5, function(timer) {
            shake2 = false;
        });
    }

    if (type2 == "love") {
        trueOutput2 = saveDataCheck2;
    }
    if (type2 == "hate") {
        trueOutput2 = saveDataCheck2 * (-1);
    }
    if (type2 == "friend") {
        trueOutput2 = saveDataCheck2 - 1000;
    }

    if (type2 == "hate") {
        text2.borderColor = 0xFF111111;
        text2.color = 0xFFFDFDFD;
    }
    else {
        text2.borderColor = 0xFF130022;
        text2.color = 0xFFF7DCF7;
    }

    var sillyGooseling2 = ((100 - trueOutput2) * 2);
    if (sillyGooseling2 < 0) {
        sillyGooseling2 = 0;
    }

    var clip2 = new FlxRect(0, sillyGooseling2, fill2.frameWidth, fill2.frameHeight);
    fill2.clipRect = clip2;
}