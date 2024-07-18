import flixel.ui.FlxButton;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;
import funkin.backend.system.Controls;
import openfl.filters.BlurFilter;
import flixel.FlxCamera;

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
var cursorCam = new FlxCamera(0, 0, 1280, 720);

// FUCKING PAGE NAMES
var page0name = "Shop";
var page1name = "Normal Dude";
var dialogProg = 0;

// RADIO
var radioChannelCam = new FlxCamera(0, 0, 240, 230);
var checkedPlaying = false;
var radioState = false;
var inRadioMenu = false;
var notChecked = true;
var channelList:FlxTypedGroup<FlxText> = [];
var channelAudio:FlxSoundGroup<FlxSound> = [];
var selectedChannel = 0;
var alphaToBe = 0;
var showHostsEnabled = true;
var dumbestShitEver:FlxTypedGroup<FlxText> = [];
var songNamesAndArtists = [
    "CURRENTLY PLAYING:\nnull\nnull",
    "CURRENTLY PLAYING:\nnull\nnull",
    "CURRENTLY PLAYING:\nnull\nnull",
    "CURRENTLY PLAYING:\nnull\nnull",
    "CURRENTLY PLAYING:\nnull\nnull",
    "CURRENTLY PLAYING:\nnull\nnull"
];

function create() {

    FlxG.sound.music.stop();

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
            if (FlxG.save.data.debug == false) {
                openingDialogueUpdate();
            }
            if (FlxG.save.data.debug == true) {
                closeDialogue();
            }
        });
    });

    radioCreateFunc();

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.camera = cursorCam;
    add(cursor);

    FlxG.cameras.add(radioChannelCam, false);
    radioChannelCam.bgColor = 0x00000000;
    FlxG.cameras.add(cursorCam, false);
    cursorCam.bgColor = 0x00000000;

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

    radioUpdateFunc();

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




















// RADDDDDIIIIIIOOOOOOOOOOOOOOOOOOOOOO DOWN HERE !

function createStations() {

    for (i in 0...FlxG.save.data.radioChannels.length)	{

        radioChannel = new FlxText(0, 0);
        radioChannel.text = FlxG.save.data.radioChannels[i];
        radioChannel.setFormat(Paths.font("TwCen.ttf"), 30, FlxColor.BLACK, "left");    
        radioChannel.offset.set(1000, 225);      
        radioChannel.y = 225 + (40 * i);
        radioChannel.x = 1000;
        radioChannel.color = 0xFF000000;
        radioChannel.antialiasing = true;
        radioChannel.borderSize = 2;
        radioChannel.alpha = 1;
        radioChannel.cameras = [radioChannelCam];
        channelList.push(radioChannel);
        add(radioChannel);

        radioChannelAudio = new FlxSound();
        radioChannelAudio = FlxG.sound.load(Paths.music('radio/songs/'+FlxG.random.int(0, 1)), 0, true);
        radioChannelAudio.looped = false;
        channelAudio.push(radioChannelAudio);
        radioChannelAudio.volume = 0;
        add(radioChannelAudio);
        radioChannelAudio.play();
        radioChannelAudio.stop();


        // this has gotta be the weirdest thing ive EVER done LMAO

        // antialiasing off means its a talking audio
        // on means its playing a song

        checkType = new FlxText();
        checkType.antialiasing = true;
        dumbestShitEver.push(checkType);
        add(checkType);


    }

}

function radioCreateFunc() {

    darknessRadio = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	darknessRadio.scrollFactor.set(0, 0);
    darknessRadio.alpha = 0;
	add(darknessRadio);

    radioHitBox = new FlxSprite(1090, 604).loadGraphic(Paths.image('shh/RADIO/radioLol'));
	radioHitBox.antialiasing = false;
    add(radioHitBox);

    radio = new FlxSprite(0, 0);
    radio.frames = Paths.getSparrowAtlas('shh/RADIO/dudeRadio');
	radio.antialiasing = false;
    radio.animation.addByPrefix('base', 'base', 15, false);
    radio.animation.addByPrefix('on', 'enable', 15, false);
    radio.scrollFactor.set(0, 0);
    radio.animation.play('base');
    add(radio);

    showHostsText = new FlxText(985, 455);
    showHostsText.text = "SHOW HOSTS?";
    showHostsText.setFormat(Paths.font("TwCen.ttf"), 30, FlxColor.BLACK, "center");          
    showHostsText.color = 0xFF000000;
    showHostsText.antialiasing = true;
    showHostsText.borderSize = 2;
    showHostsText.alpha = 0;
    add(showHostsText);

    songPlayingBG = new FlxSprite(-190, 550).loadGraphic(Paths.image('songOpening'));
	songPlayingBG.antialiasing = false;
    songPlayingBG.scale.set(0.5, 0.6);
    songPlayingBG.alpha = 0;
    add(songPlayingBG);

    songPlayingText = new FlxText(15, 600);
    songPlayingText.text = songNamesAndArtists[selectedChannel];
    songPlayingText.setFormat(Paths.font("TwCen.ttf"), 30, FlxColor.BLACK, "left");          
    songPlayingText.color = 0xFF000000;
    songPlayingText.antialiasing = true;
    songPlayingText.borderSize = 2;
    songPlayingText.alpha = 0;
    add(songPlayingText);

    showHosts = new FlxSprite(985, 485);
    showHosts.frames = Paths.getSparrowAtlas('shh/RADIO/toggleSwitch');
	showHosts.antialiasing = false;
    showHosts.animation.addByPrefix('on', 'on', 12, false);
    showHosts.animation.addByPrefix('off', 'off', 12, false);
    showHosts.scrollFactor.set(0, 0);
    if (FlxG.save.data.hosts == false) {
        showHosts.animation.play('off', true);
    }
    else {
        showHosts.animation.play('on', true);
    }
    showHosts.alpha = 0;
    add(showHosts);

    dudeRadioTM = new FlxText(1035, 170);
    dudeRadioTM.text = "DudeRadioTM";
    dudeRadioTM.setFormat(Paths.font("TwCen.ttf"), 40, FlxColor.BLACK, "center");          
    dudeRadioTM.color = 0xFF000000;
    dudeRadioTM.antialiasing = true;
    dudeRadioTM.borderSize = 2;
    dudeRadioTM.alpha = 0;
    add(dudeRadioTM);

	camPos = new FlxSprite(1000, 225).makeGraphic(240, 230, 0x00000000);
	add(camPos);

    createStations();

    radioChannelCam.x = 1000;
    radioChannelCam.y = 225;
    radioChannelCam.alpha = 0;

    topNbottom = new FlxSprite(-10, -20).loadGraphic(Paths.image('shh/RADIO/topNbottom'));
	topNbottom.scrollFactor.set(0, 0);
    topNbottom.alpha = 1;
    topNbottom.cameras = [radioChannelCam];
	add(topNbottom);
    
}


function radioUpdateFunc() {

    songPlayingText.text = songNamesAndArtists[selectedChannel];

    if (FlxG.save.data.hosts == false) {
        showHostsEnabled = false;
    }

    for (i in 0...FlxG.save.data.radioChannels.length)	{
        
        if (channelAudio[i].playing == false) {
            radioAudioEnd(i, dumbestShitEver[i].antialiasing);

        }

        channelAudio[i].volume = 0;
        channelAudio[selectedChannel].volume = 1;

    }

    if (FlxG.keys.justReleased.G) {
        channelAudio[selectedChannel].stop();
    }

    for (i in 0...FlxG.save.data.radioChannels.length)	{
        if (FlxG.mouse.overlaps(camPos)) {
            if (FlxG.mouse.wheel > 0) {
                channelList[i].y += 20;
            }
            if (FlxG.mouse.wheel < 0) {
                channelList[i].y -= 20;
                trace(channelList[i].y);
            }
        }

        if (channelList[i].y > 225 + (40 * i)) {
            channelList[i].y = 225 + (40 * i);
        }

}

    for (i in 0...FlxG.save.data.radioChannels.length)	{
        if (FlxG.mouse.overlaps(channelList[i]) && inRadioMenu == true) {
            channelList[i].color = 0xFFFFDD60;
        }
        else {
            channelList[i].color = 0xFF000000;
        }
        if (FlxG.mouse.overlaps(channelList[i]) && FlxG.mouse.justReleased && inRadioMenu == true) {
            selectedChannel = i;
            trace(selectedChannel);
            channelList[i].color = 0xFF7400FF;
        }
    }

    channelList[selectedChannel].color = 0xFF7400FF;

    if (darknessRadio.alpha < alphaToBe) {
        darknessRadio.alpha += 0.05;
    }
    if (darknessRadio.alpha > alphaToBe) {
        darknessRadio.alpha -= 0.05;
    }

    for (i in 0...FlxG.save.data.radioChannels.length)	{
        if (FlxG.mouse.overlaps(showHosts) && FlxG.mouse.justReleased && showHostsEnabled == true && inRadioMenu == true) {
            showHosts.animation.play('off', true);
            FlxG.save.data.hosts = false;
            trace("hosts are off");
            new FlxTimer().start(0.01, function(timer) {
                showHostsEnabled = false;
                if (dumbestShitEver[i].antialiasing == false) {
                    channelAudio[i].stop();
                }
            });
        }
    }

    if (FlxG.mouse.overlaps(showHosts) && FlxG.mouse.justReleased && showHostsEnabled == false && inRadioMenu == true) {
        showHosts.animation.play('on', true);
        FlxG.save.data.hosts = null;
        trace("hosts are on");
        new FlxTimer().start(0.01, function(timer) {
            showHostsEnabled = true;
        });
    }

    if (FlxG.mouse.overlaps(radioHitBox) && FlxG.mouse.justReleased && radioState == true && inRadioMenu == false) {
        radio.animation.reverse();
        inDialogue = false;
        alphaToBe = 0;
        new FlxTimer().start(0.01, function(timer) {
            radioState = false;
        });
    }

    if (FlxG.mouse.overlaps(radioHitBox) && FlxG.mouse.justReleased && radioState == false && inRadioMenu == false) {
        radio.animation.play('on');
        inDialogue = true;
        alphaToBe = 0.8;
        new FlxTimer().start(0.01, function(timer) {
            radioState = true;
        });
    }

    if (FlxG.mouse.overlaps(radioHitBox) && FlxG.mouse.justReleased && inRadioMenu == true) {
        changeRadioState("off");
        inDialogue = false;
        new FlxTimer().start(0.01, function(timer) {
            radioState = false;
        });
    }

    if (radio.animation.frameIndex == 12 && notChecked == true) {
        changeRadioState("on");
        notChecked = false;
    }

    if (radio.animation.frameIndex < 12) {
        notChecked = true;
    }

}

function changeRadioState(type) {

    switch (type) {

        case "on":
            for (i in 0...FlxG.save.data.radioChannels.length)	{
                FlxTween.tween(radioChannelCam, {alpha: 1}, 0.25);
            }
            FlxTween.tween(dudeRadioTM, {alpha: 1}, 0.25);
            FlxTween.tween(songPlayingBG, {alpha: 1}, 0.25);
            FlxTween.tween(songPlayingText, {alpha: 1}, 0.25);
            FlxTween.tween(showHosts, {alpha: 1}, 0.25);
            FlxTween.tween(showHostsText, {alpha: 1}, 0.25);
            trace('my fat ass in your face');
            new FlxTimer().start(0.25, function(timer) {
                inRadioMenu = true;
            });

        case "off":
            for (i in 0...FlxG.save.data.radioChannels.length)	{
                FlxTween.tween(radioChannelCam, {alpha: 0}, 0.25);
            }
            FlxTween.tween(dudeRadioTM, {alpha: 0}, 0.25);
            FlxTween.tween(songPlayingBG, {alpha: 0}, 0.25);
            FlxTween.tween(songPlayingText, {alpha: 0}, 0.25);
            FlxTween.tween(showHosts, {alpha: 0}, 0.25);
            FlxTween.tween(showHostsText, {alpha: 0}, 0.25);
            trace('oooo yeah baby kiss me with your hot mouth');
            new FlxTimer().start(0.25, function(timer) {
                radio.animation.reverse();
                inDialogue = false;
                radioState = false;
                alphaToBe = 0;
                inRadioMenu = false;
            });

    }

}

function radioAudioEnd(channel, state) {

    if (FlxG.save.data.hosts == false) {

        state = false;

    }

    trace(state);

        switch(state) {

            case true:

                channelAudio[channel] = FlxG.sound.load(Paths.music('radio/'+FlxG.save.data.radioChannels[channel]+'/'+FlxG.random.int(0, FlxG.save.data.radioChannelHostAmount[channel])), 0.2, true);
                channelAudio[channel].play();
                channelAudio[channel].looped = false;
                channelAudio[channel].volume = 0;
                dumbestShitEver[channel].antialiasing = false;
                songNamesAndArtists[channel] = "CURRENTLY PLAYING:\nnothing at the moment !\nc:";

            case false:

                var songPicker = FlxG.random.int(0, 1);
                channelAudio[channel] = FlxG.sound.load(Paths.music('radio/songs/'+songPicker), 0.2, true);
                channelAudio[channel].play();
                channelAudio[channel].looped = false;
                channelAudio[channel].volume = 0;
                dumbestShitEver[channel].antialiasing = true;
                songNamesAndArtists[channel] = "CURRENTLY PLAYING:\n"+FlxG.save.data.songNamesArtists[songPicker];

        }

}


