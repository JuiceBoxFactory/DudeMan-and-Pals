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
var inDialogue = false;
var redditKarmaScore = 0;
var basicClickAmount = 1;
var clickAmount = 0;
var fistHitPosition = -550;
var openingPlaying = false;
var respectiveDialogue = "";
var aussieMode = false;
var curHand = "punch";
var talkState = "Idle";
var iconBeing = "sil";

// FUCKING PAGE NAMES
var page0name = "Shop";
var page1name = "Normal Dude";
var dialogProg = 0;

function create() {

    voicelines = new FlxSound();
    add(voicelines);

    bgOverflow = new FlxBackdrop(Paths.image('titleScreen/checkerboardbg'));
    bgOverflow.moves = true;
    bgOverflow.scrollFactor.set(0, 0);
    bgOverflow.velocity.x = 50;
    bgOverflow.velocity.y = 50;
    bgOverflow.active = true;
    bgOverflow.alpha = 1;
    add(bgOverflow);

    dudeman1 = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/PUNCHER/in-game/mans/DudeMan'));
	dudeman1.scrollFactor.set(0, 0);
    dudeman1.alpha = 1;
	add(dudeman1);

    fist = new FlxSprite(-550, 230).loadGraphic(Paths.image('shh/PUNCHER/in-game/hands/'+curHand));
	fist.scrollFactor.set(0, 0);
	add(fist);

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
    buttonLeft.updateHitbox();
    add(buttonLeft);

    statsBox = new FlxSprite(602, 10).loadGraphic(Paths.image('shh/PUNCHER/ui/box'));
	statsBox.scrollFactor.set(0, 0);
    statsBox.scale.set(0.3, 0.6);
	add(statsBox);
    statsBox.angle = 90;

    karmaIcon = new FlxSprite(785, 90).loadGraphic(Paths.image('shh/PUNCHER/ui/iconsNShit/karma'));
	karmaIcon.scrollFactor.set(0, 0);
    karmaIcon.scale.set(0.2, 0.2);
	add(karmaIcon);

    redditKarma = new FlxText(900, 170, 600, "");
    redditKarma.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "left"); 
    redditKarma.color = 0xFF231033; 
    add(redditKarma);

    dmgIcon = new FlxSprite(785, 140).loadGraphic(Paths.image('shh/PUNCHER/ui/iconsNShit/punchPower'));
	dmgIcon.scrollFactor.set(0, 0);
    dmgIcon.scale.set(0.2, 0.2);
	add(dmgIcon);

    dmgCounter = new FlxText(900, 220, 600, "");
    dmgCounter.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "left"); 
    dmgCounter.color = 0xFF231033; 
    add(dmgCounter);

    dmgIcon = new FlxSprite(785, 190).loadGraphic(Paths.image('shh/PUNCHER/ui/iconsNShit/springPower'));
	dmgIcon.scrollFactor.set(0, 0);
    dmgIcon.scale.set(0.2, 0.2);
	add(dmgIcon);

    springDmgCounter = new FlxText(900, 270, 600, "");
    springDmgCounter.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "left"); 
    springDmgCounter.color = 0xFF231033; 
    add(springDmgCounter);

    clicksIcon = new FlxSprite(785, 240).loadGraphic(Paths.image('shh/PUNCHER/ui/iconsNShit/clickCount'));
	clicksIcon.scrollFactor.set(0, 0);
    clicksIcon.scale.set(0.2, 0.2);
	add(clicksIcon);

    clickCounter = new FlxText(900, 320, 600, "");
    clickCounter.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "left"); 
    clickCounter.color = 0xFF231033; 
    add(clickCounter);

    clickSpot = new FlxButton(490, 200, "this wont be visible", normalClick);
    clickSpot.scale.set(4, 40);
    clickSpot.updateHitbox();
    clickSpot.alpha = 0.000000000001;
    add(clickSpot);

    dark = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	dark.scrollFactor.set(0, 0);
    dark.alpha = 0;
	add(dark);

    dialogueCircle = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/PUNCHER/dialogue/circle'));
	dialogueCircle.scrollFactor.set(0, 0);
	add(dialogueCircle);

    icon = new FlxSprite(0, 0);
    icon.frames = Paths.getSparrowAtlas('shh/PUNCHER/dialogue/puzzleTalk');
	icon.antialiasing = false;
    icon.animation.addByPrefix('baseIdle', 'baseIdle', 6, true);
    icon.animation.addByPrefix('baseTalk', 'baseTalk', 6, true);
    icon.animation.addByPrefix('silIdle', 'silIdle', 6, true);
    icon.animation.addByPrefix('silTalk', 'silTalk', 6, true);
    icon.scrollFactor.set(0, 0);
    icon.animation.play('silIdle');
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
    txtBro.prefix = "???:\n";
    txtBro.setTypingVariation(0.10, false);
    txtBro.color = 0xFF231033;
    txtBro.skipKeys = ["SHIFT"];
    txtBro.sounds = [
        FlxG.sound.load(Paths.sound("clear"))
    ];
    add(txtBro);

    enterTEXT = new FlxText(485, 430, 600, "press ENTER to uhmm");
    enterTEXT.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center"); 
    enterTEXT.color = 0xFF231033; 
    add(enterTEXT);

    shiftTEXT = new FlxText(310, 430, 600, "SHIFT to skip");
    shiftTEXT.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center"); 
    shiftTEXT.color = 0xFF231033; 
    add(shiftTEXT);

    inDialogue = true;
    openingPlaying = true;
    FlxTween.tween(dark, {alpha: 0.7}, 4, {ease:FlxEase.quartOut});
    new FlxTimer().start(2, function(timer) {
    FlxTween.tween(FlxG.sound.music, {volume: 0.2}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(txtBro, {y: 275}, 2, {ease:FlxEase.quartOut});
        new FlxTimer().start(1.2, function(timer) {
            openingDialogueUpdate();
        });
    });

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    add(cursor);

}

function postCreate() {
    window.title = "DudeMan Punching Simulator - By HotSexyDemon972 ( Puzzle )";
}

function normalClick() {
    
    if (inDialogue == false) {

        dudeman1.scale.x -= 0.05;
        dudeman1.angle -= 2;

        if (curHand == "pickaxe") {
            FlxG.sound.play(Paths.sound('puncher/pickaxe'), 0.7);
        }
        else {
            FlxG.sound.play(Paths.sound('puncher/punch'), 1);
        }

        fist.x += 10;
        fist.scale.y = 0.8;
        fistHitPosition = 265;
    
        redditKarmaScore += basicClickAmount;
        clickAmount += 1;

        new FlxTimer().start(0.5, function(timer) {
            fistHitPosition = -550;
        });   
    }
}



function dialogueUpdate(dialogueInQuesiton) {

    playVoiceline(dialogueInQuesiton+"/"+dialogProg);

    switch (dialogueInQuesiton) {
        case "fatBitches":
        if (dialogProg == 0) {
            txtBro.resetText("I love fat bitches.");
            txtBro.start(0.03);
        }
        if (dialogProg == 1) {
            closeDialogue();
        }

        case "skippedDialogue":
        if (dialogProg == 0) {
            updateIcon('sil');
            txtBro.resetText("Oh, Okay");
            txtBro.start(0.03);
        }

    }
}

function openingDialogueUpdate() {

    playVoiceline("opening/"+dialogProg);

    if (dialogProg == 0) {
        updateIcon("sil");
        talkState = "Talk";
        txtBro.resetText("Oh ho ho, it would seem you've... stumbled upon my.. awesome game! hehehe");
        txtBro.start(0.03);
    }
    if (dialogProg == 1) {
        txtBro.resetText("The game where you can... PUNCH DUDEMAN! yes.. yes! YES!");
        txtBro.start(0.03);
    }
    if (dialogProg == 2) {
        txtBro.resetText("Oh, you wanna know my name? well that- that makes sense. uhm. well! i'd be glad to tell you!");
        txtBro.start(0.03);
    }
    if (dialogProg == 3) {
        txtBro.resetText("My name is...");
        txtBro.start(0.03);
    }
    if (dialogProg == 4) {
        updateIcon("base");
        txtBro.prefix = "PUZZLE THE PRICK:\n";
        txtBro.resetText("PUZZLE THE PRICK, BABY! #1 dudeman hater!");
        txtBro.start(0.03);
    }
    if (dialogProg == 5) {
        updateIcon("base");
        txtBro.resetText("Not at all because he beat me 33 times in blackjack.. in a row. that'd be... poposterous. yeah.");
        txtBro.start(0.03);
    }
    if (dialogProg == 6) {
        updateIcon("base");
        txtBro.resetText("ANYWAYS in this game of mine? your goal is to punch the SHIT out of these DudeMen! yes thats plural!");
        txtBro.start(0.03);
    }
    if (dialogProg == 7) {
        updateIcon("base");
        txtBro.resetText("DudeMan IS quite the punchable fellow, of course you can punch him multiple times! im just being nice");
        txtBro.start(0.03);
    }
    if (dialogProg == 8) {
        updateIcon("base");
        txtBro.resetText('Punching him will get you a "form" of "currency" which can be used in MY shop on the left!');
        txtBro.start(0.03);
    }
    if (dialogProg == 9) {
        updateIcon("base");
        txtBro.resetText('Buy Upgrades, Buy DudeMen, Buy whatever your heart desires!! that i can provide, of course.');
        txtBro.start(0.03);
    }
    if (dialogProg == 10) {
        updateIcon("base");
        txtBro.resetText('That should be all you need to know! have fun punishing him for his misdeeds OF DEFINITELY CHEATING IN BLACKJACK. THERE IS NO WAY SOMEONE COULD WIN 33 TIMES IN A ROW JRRHAJRHJHAJRJGAJGRHGHJASGHRGhGASHRGRAREARAFSAGASRASRVASTFASRAFRAFRAFAGAFf');
        txtBro.start(0.03);
    }
    if (dialogProg == 11) {
        updateIcon("base");
        txtBro.resetText("sorry");
        txtBro.start(0.03);
    }
    if (dialogProg == 12) {
        closeDialogue();
    }

}

function openDialogue() {
    
    inDialogue = true;
    FlxTween.tween(dark, {alpha: 0.7}, 4, {ease:FlxEase.quartOut});
    new FlxTimer().start(2, function(timer) {
    FlxTween.tween(txtBro, {y: 275}, 2, {ease:FlxEase.quartOut});
        new FlxTimer().start(1.2, function(timer) {
            talkState = "Talk";
            dialogueUpdate(respectiveDialogue);
        });
    });

}

function skipDialogue() {
    FlxTween.tween(FlxG.sound.music, {volume: 1}, 2, {ease:FlxEase.quartOut});
    txtBro.paused = true;
    txtBro.alpha = 0.7;
    openingPlaying = false;
    new FlxTimer().start(1, function(timer) {
        txtBro.paused = false;
        txtBro.alpha = 1;
        respectiveDialogue = "skippedDialogue";
        dialogProg = 0;
        dialogueUpdate(respectiveDialogue);
        talkState = "Talk";
        new FlxTimer().start(2, function(timer) {
            FlxTween.tween(dark, {alpha: 0}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(txtBro, {y: 1275}, 2, {ease:FlxEase.quartIn});
                new FlxTimer().start(2, function(timer) {
                inDialogue = false;
                talkState = "Idle";
            }); 
        });   
}); 

}

function closeDialogue() {

    talkState = "Idle";
    FlxTween.tween(FlxG.sound.music, {volume: 1}, 2, {ease:FlxEase.quartOut});    
    openingPlaying = false;
    FlxTween.tween(dark, {alpha: 0}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(txtBro, {y: 1275}, 2, {ease:FlxEase.quartIn});
    new FlxTimer().start(2, function(timer) {
            inDialogue = false;
    });   

}

function playVoiceline(sound) {
    voicelines = FlxG.sound.load(Paths.sound('puncher/voicelines/'+sound), 1);
    voicelines.play();
}

function updateIcon(iconToBe) {
    iconBeing = iconToBe;
}

function openingDialogueProgression() {
    talkState = "Idle";
    txtBro.paused = true;
    voicelines.stop();
    txtBro.alpha = 0.7;
    new FlxTimer().start(0.35, function(timer) {
        txtBro.paused = false;
        txtBro.alpha = 1;
        dialogProg += 1;
        openingDialogueUpdate();
        talkState = "Talk";
    });
}

function dialogProgression() {
    talkState = "Idle";
    txtBro.paused = true;
    voicelines.stop();
    txtBro.alpha = 0.7;
    new FlxTimer().start(0.35, function(timer) {
        txtBro.paused = false;
        txtBro.alpha = 1;
        dialogProg += 1;
        dialogueUpdate(respectiveDialogue);
        talkState = "Talk";
    });
}

function resetTextShit() {
    dialogProg = 0;
    updateIcon("base");
    txtBro.resetText("");
    txtBro.start(0.03);
}

function update() {

    if (voicelines.playing == false) {
        talkState = "Idle";
    }

    icon.animation.play(iconBeing+talkState);

    FlxG.mouse.visible = false;

    fist.loadGraphic(Paths.image('shh/PUNCHER/in-game/hands/'+curHand));

    if (dudeman1.scale.x < 1) {
        dudeman1.scale.x += 0.01;
    }
    if (dudeman1.angle < 0) {
        dudeman1.angle += 0.1;
    }
    if (dudeman1.angle < -3) {
        dudeman1.angle = -3;
    }

    if (fist.x < fistHitPosition) {
        fist.x += 25;
    }
    if (fist.x > fistHitPosition) {
        fist.x -= 2;
    }
    if (fist.scale.y < 1) {
        fist.scale.y += 0.01;
    }
    if (dudeman1.angle < -3) {
        dudeman1.angle = -3;
    }

    if (aussieMode == false) {

        if (fist.x > 275) {
            fist.x = 275;
        }
        if (dudeman1.scale.x < 0.95) {
            dudeman1.scale.x = 0.95;
       }

    }

    redditKarma.text = 'Reddit Karma: '+redditKarmaScore;
    dmgCounter.text = 'Karma per Punch: '+basicClickAmount;
    springDmgCounter.text = 'Karma per SpringPunch: '+basicClickAmount;
    clickCounter.text = 'total clicks: '+clickAmount;

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

    icon.y = txtBro.y - 275;
    dialogueCircle.y = txtBro.y - 275;
    enterTEXT.y = txtBro.y + 155;
    shiftTEXT.y = txtBro.y + 155;

    if (FlxG.keys.justPressed.F && inDialogue == false) {
        FlxTween.tween(FlxG.sound.music, {volume: 0.2}, 2, {ease:FlxEase.quartOut});
        resetTextShit();
        respectiveDialogue = "fatBitches";
        openDialogue();
    }

    if (FlxG.keys.justPressed.L && inDialogue == false) {
        curHand = "pickaxe";
    }

	if (FlxG.keys.justPressed.SHIFT && inDialogue == true) {
        skipDialogue();
    }

	if (FlxG.keys.justPressed.CONTROL) {
        aussieMode = true;
    }

	if (controls.ACCEPT && inDialogue == true && openingPlaying == true) {
        openingDialogueProgression();
    }

    if (controls.ACCEPT && inDialogue == true && openingPlaying == false) {
        dialogProgression();
    }

	if (controls.BACK) {
        FlxG.switchState(new ModState("GameSelector"));
	}

}