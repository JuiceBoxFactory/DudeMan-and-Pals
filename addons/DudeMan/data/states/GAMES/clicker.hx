import flixel.ui.FlxButton;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;
import funkin.backend.system.Controls;
import openfl.filters.BlurFilter;

// Dialogue Mechanics n Shit
var canDoShitDude = false;

// the actual inner-workings
var page = 1;
var unlockedPages = 1;
var blurFilter:BlurFilter;
var inDialogue = true;

// FUCKING PAGE NAMES
var page0name = "Shop";
var page1name = "Normal Dude";
var dialogProg = 0;


function create() {
    
    bgOverflow = new FlxBackdrop(Paths.image('titleScreen/checkerboardbg'));
    bgOverflow.moves = true;
    bgOverflow.scrollFactor.set(0, 0);
    bgOverflow.velocity.x = 50;
    bgOverflow.velocity.y = 50;
    bgOverflow.active = true;
    bgOverflow.alpha = 1;
    add(bgOverflow);

    dudeman1 = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/PUNCHER/in-game/DudeMan'));
	dudeman1.scrollFactor.set(0, 0);
    dudeman1.alpha = 1;
	add(dudeman1);

    arrowLeft = new FlxSprite(0, 0);
    arrowLeft.frames = Paths.getSparrowAtlas('shh/PUNCHER/ui/arrow');
	arrowLeft.antialiasing = false;
    arrowLeft.animation.addByPrefix('idle', 'idle', 6, true);
    arrowLeft.scrollFactor.set(0, 0);
    arrowLeft.animation.play('idle');
    add(arrowLeft);

    arrowRight = new FlxSprite(0, 0);
    arrowRight.frames = Paths.getSparrowAtlas('shh/PUNCHER/ui/arrow');
	arrowRight.antialiasing = false;
    arrowRight.animation.addByPrefix('idle', 'idle', 6, true);
    arrowRight.scrollFactor.set(0, 0);
    arrowRight.flipX = true;
    arrowRight.animation.play('idle');
    add(arrowRight);

    buttonLeft = new FlxButton(100, 100, "SHOP", update);
    add(buttonLeft);

    dark = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	dark.scrollFactor.set(0, 0);
    dark.alpha = 0;
	add(dark);

    dialogueCircle = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/PUNCHER/dialogue/circle'));
	dialogueCircle.scrollFactor.set(0, 0);
	add(dialogueCircle);

    icon = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/PUNCHER/dialogue/iconBase'));
	icon.scrollFactor.set(0, 0);
	add(icon);

    txtBro = new FlxTypeText(575, 1275, 300, "", 16, true);
    txtBro.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center");            
    txtBro.color = 0xFF130022;
    txtBro.antialiasing = false;
    txtBro.delay = 0.02;
    txtBro.eraseDelay = 0.2;
    txtBro.autoErase = true;
    txtBro.waitTime = 0;
    txtBro.prefix = "PUZZLE THE DEMON:\n";
    txtBro.setTypingVariation(0.10, false);
    txtBro.color = 0xFF231033;
    txtBro.skipKeys = ["SHIFT"];
    txtBro.sounds = [
        FlxG.sound.load(Paths.sound("datingSim/typeSFX"))
    ];
    add(txtBro);

    enterTEXT = new FlxText(425, 425, 600, "press ENTER to uhmm");
    enterTEXT.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center"); 
    enterTEXT.color = 0xFF231033; 
    add(enterTEXT);

    FlxTween.tween(dark, {alpha: 0.7}, 4, {ease:FlxEase.quartOut});
    new FlxTimer().start(2, function(timer) {
        FlxTween.tween(txtBro, {y: 275}, 2, {ease:FlxEase.quartOut});
        new FlxTimer().start(1.2, function(timer) {
            openingDialogueUpdate();
        });
    });


}

function openingDialogueUpdate() {

    if (dialogProg == 0) {
        txtBro.resetText("Greetings, I am Puzzle");
        txtBro.start(0.03);
    }
    if (dialogProg == 1) {
        updateIcon('SmugLook');
        txtBro.resetText("I am notorious for all things that involve using your brain");
        txtBro.start(0.03);
    }
    if (dialogProg == 2) {
        updateIcon('Look');
        txtBro.resetText("i hope you have one");
        txtBro.start(0.03);
    }
    if (dialogProg == 3) {
        updateIcon('BlankStare');
        txtBro.resetText("cause it'd be pretty awkward if you didn't");
        txtBro.start(0.03);
    }

}

function updateIcon(iconToBe) {
    icon.loadGraphic(Paths.image('shh/PUNCHER/dialogue/icon'+iconToBe));
}

function openingDialogProgession() {
    txtBro.paused = true;
    FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);
    txtBro.alpha = 0.7;
    new FlxTimer().start(0.35, function(timer) {
        txtBro.paused = false;
        txtBro.alpha = 1;
        dialogProg += 1;
        openingDialogueUpdate();
    });
}

function update() {

    icon.y = txtBro.y - 275;
    dialogueCircle.y = txtBro.y - 275;
    enterTEXT.y = txtBro.y + 150;

	if (controls.ACCEPT && inDialogue == true) {
        openingDialogProgession();
    }
    
	if (controls.BACK) {
		FlxG.switchState(new ModState("FreeplaySelector"));
	}

}