import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.system.Controls;
import flixel.addons.text.FlxTypeText;
import flixel.system.FlxAssets;
import flixel.ui.FlxButton;

var alongTheDialogue = 0;
var ground = 'thatSchoolThatIHate';
var char1var = 'dudeDating';
var canDoShitDude = false;

// actual like progression shit:
var happyMan = false;

function create() {

	FlxG.sound.playMusic(Paths.music('datingSim/datingMySimulator'), 1, true);

	bg = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/background/'+ground));
	bg.scrollFactor.set(0, 0);
	add(bg);

	bgOverflow = new FlxBackdrop(Paths.image('shh/DATINGSIM/dialogueBoxShit/overflow')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	bgOverflow.moves = true;
	bgOverflow.scrollFactor.set(0, 0);
	bgOverflow.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	bgOverflow.velocity.y = 100;
	bgOverflow.active = true;
	add(bgOverflow);

    char1 = new FlxSprite(375, 75).loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char1var));
	char1.scrollFactor.set(0, 0);
	add(char1);

    dialogueTop = new FlxSprite(59, 435).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
	dialogueTop.scrollFactor.set(0, 0);
	add(dialogueTop);

    dialogue = new FlxSprite(0, 512).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/box'));
    dialogue.screenCenter(FlxAxes.X);
	dialogue.scrollFactor.set(0, 0);
	add(dialogue);

    name = new FlxText(-3, 450, 400);
    name.text = '';
    name.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    name.color = 0xFF130022;
    name.antialiasing = false;
    name.borderColor = 0xFFFBF1FF;
    name.borderSize = 3;
    add(name);

    txtBro = new FlxTypeText(100, 525, 1200, "", 16, true);
    txtBro.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    txtBro.color = 0xFF130022;
    txtBro.antialiasing = false;
    txtBro.borderColor = 0xFFFBF1FF;
    txtBro.borderSize = 3;
    txtBro.delay = 0.02;
    txtBro.eraseDelay = 0.2;
    txtBro.autoErase = true;
    txtBro.waitTime = 0;
    txtBro.setTypingVariation(0.10, false);
    txtBro.color = 0xFF130022;
    txtBro.skipKeys = ["SHIFT"];
    txtBro.sounds = [
        FlxG.sound.load(Paths.sound("datingSim/typeSFX"))
    ];
    add(txtBro);

    key = new FlxSprite(975, 625).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/arrow'));           
    key.antialiasing = false;
    key.scale.set(0.6, 0.6);
    add(key);

    char1.alpha = 0;
    char1.y = 300;
    char1.scale.set(0.6, 0.6);

    dialogueButton1 = new FlxSprite(850, 100).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
    dialogueButton2 = new FlxSprite(850, 200).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
    dialogueButton3 = new FlxSprite(850, 300).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
    dialogueButton4 = new FlxSprite(850, 400).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));

    button1 = new FlxButton(949, 133, "", buttonSpaghetti1);
    button1.scale.set(3.5, 4.2);
    button1.alpha = 0.0000001;

    button2 = new FlxButton(949, 233, "", buttonSpaghetti2);
    button2.scale.set(3.5, 4.2);
    button2.alpha = 0.0000001;

    button3 = new FlxButton(949, 333, "", buttonSpaghetti3);
    button3.scale.set(3.5, 4.2);
    button3.alpha = 0.0000001;

    button4 = new FlxButton(949, 433, "", buttonSpaghetti4);
    button4.scale.set(3.5, 4.2);
    button4.alpha = 0.0000001;

    button1text = new FlxText(792, 122, 400);
    button1text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button1text.color = 0xFF130022;
    button1text.antialiasing = false;
    button1text.borderColor = 0xFFFBF1FF;
    button1text.borderSize = 3;

    button2text = new FlxText(792, 222, 400);
    button2text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button2text.color = 0xFF130022;
    button2text.antialiasing = false;
    button2text.borderColor = 0xFFFBF1FF;
    button2text.borderSize = 3;

    button3text = new FlxText(792, 322, 400);
    button3text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button3text.color = 0xFF130022;
    button3text.antialiasing = false;
    button3text.borderColor = 0xFFFBF1FF;
    button3text.borderSize = 3;

    button4text = new FlxText(792, 422, 400);
    button4text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button4text.color = 0xFF130022;
    button4text.antialiasing = false;
    button4text.borderColor = 0xFFFBF1FF;
    button4text.borderSize = 3;
    
    new FlxTimer().start(0.35, function(timer) {
        canDoShitDude = true;
        dialogueUpdateShit();
    });

}

function buttonText1Be(texty) {
    button1text.text = texty;
}

function buttonText2Be(texty) {
    button2text.text = texty;
}

function buttonText3Be(texty) {
    button3text.text = texty;
}

function buttonText4Be(texty) {
    button4text.text = texty;
}

function removeButtons() {

    new FlxTimer().start(0.35, function(timer) {
            remove(button1);
            remove(dialogueButton1);
            remove(button1text);
            remove(button2);
            remove(dialogueButton2);
            remove(button2text);
            remove(button3);
            remove(dialogueButton3); 
            remove(button3text); 
            remove(button4);
            remove(dialogueButton4);
            remove(button4text);
    });
}

function buttonAdd(type) {

    switch (type) {

        case 1:
            add(dialogueButton1);
            add(button1);
            add(button1text);
        case 2:
            add(dialogueButton2);
            add(button2);
            add(button2text);
        case 3:
            add(dialogueButton3);  
            add(button3);
            add(button3text);
        case 4:
            add(dialogueButton4);
            add(button4);
            add(button4text);
    }

}

function characterStatus(characters) {

    switch (characters) {

        case "char1APPEAR":
            FlxTween.tween(char1, {y: 75}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(char1, {alpha: 1}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(char1.scale, {x: 1, y: 1}, 0.5, {ease:FlxEase.quartOut});

    }

}

function changeDialogue() {
    canDoShitDude = false;
    txtBro.paused = true;
    FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);
    key.scale.x = 0.2;
    txtBro.alpha = 0.7;
    FlxTween.tween(key.scale, {x: 0.6}, 0.4, {ease:FlxEase.backOut});
    new FlxTimer().start(0.35, function(timer) {
        txtBro.paused = false;
        txtBro.alpha = 1;
        alongTheDialogue += 1;
        dialogueUpdateShit();
    });
}

function update() {

	if (controls.ACCEPT && canDoShitDude == true) {
        changeDialogue();
    }

	if (controls.BACK) {
		FlxG.switchState(new ModState("FreeplaySelector"));
	}

}

function dialogueUpdateShit() {

    if (alongTheDialogue == 0) {
        canDoShitDude = true;
        characterStatus("char1APPEAR");
        name.text = 'DudeMan';
        txtBro.resetText("I'm into fat bitches");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 1) {
        canDoShitDude = true;
        txtBro.resetText("I'm so buff and hot oh yeah baby kiss me on the lips");
        txtBro.start(0.03);
    } 

    if (alongTheDialogue == 2) {
        txtBro.resetText("do you like my abs bestie");
        txtBro.start(0.03);
        key.alpha = 0;
        buttonText3Be("Yeah, Man !");
        buttonText4Be("No, dude.");
        buttonAdd(3);
        buttonAdd(4);
    } 

    if (alongTheDialogue == 3 && happyMan == false) {
        canDoShitDude = true;
        FlxG.sound.playMusic(Paths.music('datingSim/datingMySimulator'), 0, true);
        txtBro.resetText("dude....................................................................man");
        txtBro.start(0.2);
        key.alpha = 1;
    } 

    if (alongTheDialogue == 3 && happyMan == true) {
        canDoShitDude = true;
        txtBro.resetText("YAYYAYAYAYAYAYYAYAYAY");
        txtBro.start(0.03);
        key.alpha = 1;
    } 

}

function buttonSpaghetti1() {
}

function buttonSpaghetti2() { 

}

function buttonSpaghetti3() {
    for (shitToDo in [dialogueButton3, button3text]) {
        shitToDo.scale.x = 0.6;
        FlxTween.tween(shitToDo.scale, {x: 1}, 0.35, {ease:FlxEase.backOut});
    }
    removeButtons();
    if (alongTheDialogue == 2) {
        happyMan = true;
        changeDialogue();
        }
}

function buttonSpaghetti4() {
    for (shitToDo in [dialogueButton4, button4text]) {
        shitToDo.scale.x = 0.6;
        FlxTween.tween(shitToDo.scale, {x: 1}, 0.35, {ease:FlxEase.backOut});
    }
    removeButtons();
    if (alongTheDialogue == 2) {
        happyMan = false;
        changeDialogue();
        }
}