import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.system.Controls;
import flixel.addons.text.FlxTypeText;
import flixel.ui.FlxButton;
import funkin.backend.utils.DiscordUtil;
import Sys;
import flixel.FlxSubState;

var blurShit = new CustomShader("blur");
var camHUD = new FlxCamera(0, 0, 1280, 720);
var cursorCam = new FlxCamera(0, 0, 1280, 720);

var canDoShitDude = false;
var alongTheDialogue = 0;
var ground = 'thatSchoolThatIHate';
var char1var = 'dudeDating';
var char2var = 'Fruity/base';
var gameLoaded = false;
var character1State = "UNAPPEAR";
var character2State = "UNAPPEAR";
var state = "GAMES/datingSim";
var otherChar = char1var;
var nameBoxState = "";
var notTalkOrShop = true;
var inShop = false;
var inTalk = false;
var curScene = "none";
var exception = false;
var val1 = false;
var val2 = false;
var val3 = false;
var val4 = false;
var val1DoFade = false;
var val2DoFade = false;
var val3DoFade = false;
var val4DoFade = false;
var stopHere = true;
var mother1 = false;
var mother2 = false;
var playerName = null;
var shutTheFuckUp = false;
var isDisabled = [

    null, // killing 0 isDisabled[0], for good reason btw
    false,
    false,
    false,
    false

];
var energy = 1;
var fileSceneName = "";
var day = "Monday";


function create() {

    loadDefaultSaveShit();

    FlxG.cameras.add(camHUD, false);
    camHUD.bgColor = 0x0000000;
    FlxG.cameras.add(cursorCam, false);
    cursorCam.bgColor = 0x0000000;

	window.title = "DudeMan: More Than Pals";

	DiscordUtil.changePresenceAdvanced({
		details: 'Playing "DUDEMAN: MORE THAN PALS"',
		state: "[From DudeMan's Games]",
		largeImageKey: "datingsim"
    });

    FlxG.sound.playMusic(Paths.music('breakfast'), 0, true);
    music = new FlxSound();
    music = FlxG.sound.load(Paths.music('datingSim/datingMySimulator'), 1, true);
    add(music);
    music.play();

	bg = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/DATINGSIM/background/'+ground));
	bg.scrollFactor.set(0, 0);
	add(bg);

    bgOverlay = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    bgOverlay.scrollFactor.set(0, 0);
    bgOverlay.alpha = 0.4;
    add(bgOverlay);

	bgOverflow = new FlxBackdrop(Paths.image('shh/DATINGSIM/dialogueBoxShit/overflow')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	bgOverflow.moves = true;
	bgOverflow.scrollFactor.set(0, 0);
	bgOverflow.velocity.x = 50; // you can adjust the values to make the scrolling faster or lower
	bgOverflow.velocity.y = 50;
	bgOverflow.active = true;
    bgOverflow.alpha = 0.5;
	add(bgOverflow);

    char2 = new FlxSprite(375, 0).loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char2var));
	char2.scrollFactor.set(0, 0);
    char2.alpha = 0;
    char2.y = 300;
    char2.scale.set(0.6, 0.6);
	add(char2);

    char1 = new FlxSprite(375, 0).loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char1var));
	char1.scrollFactor.set(0, 0);
    char1.alpha = 0;
    char1.y = 300;
    char1.scale.set(0.6, 0.6);
	add(char1);

    darkness2 = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    darkness2.scrollFactor.set(0, 0);
    darkness2.alpha = 0;
    darkness2.cameras = [camHUD];
    add(darkness2);

    dialogueTop = new FlxSprite(59, 700).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
	dialogueTop.scrollFactor.set(0, 0);
    dialogueTop.cameras = [camHUD];
	add(dialogueTop);

    name = new FlxText(-3, 720, 400);
    name.text = '';
    name.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    name.color = 0xFF130022;
    name.antialiasing = false;
    name.borderColor = 0xFFFBF1FF;
    name.borderSize = 3;
    name.cameras = [camHUD];
    add(name);

    dialogue = new FlxSprite(0, 512).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/box'));
    dialogue.screenCenter(FlxAxes.X);
	dialogue.scrollFactor.set(0, 0);
    dialogue.cameras = [camHUD];
	add(dialogue);

    txtBro = new FlxTypeText(100, 525, 1000, "", 16, true);
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
    txtBro.cameras = [camHUD];
    txtBro.skipKeys = ["SHIFT"];
    txtBro.sounds = [
        FlxG.sound.load(Paths.sound("datingSim/typeSFX"))
    ];
    add(txtBro);

    key = new FlxSprite(975, 625).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/arrow'));           
    key.antialiasing = false;
    key.scale.set(0.6, 0.6);
    key.cameras = [camHUD];
    add(key);

    dialogueButton1 = new FlxSprite(850, 100).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
    dialogueButton2 = new FlxSprite(850, 200).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
    dialogueButton3 = new FlxSprite(850, 300).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));
    dialogueButton4 = new FlxSprite(850, 400).loadGraphic(Paths.image('shh/DATINGSIM/dialogueBoxShit/boxHeader'));

    for (shucks in [dialogueButton1, dialogueButton2, dialogueButton3, dialogueButton4]) {
        shucks.cameras = [camHUD];
    }

	button1pos = new FlxSprite(850, 100).makeGraphic(277, 87, 0xFFFFFFFF);
    button2pos = new FlxSprite(850, 200).makeGraphic(277, 87, 0xFFFFFFFF);
	button3pos = new FlxSprite(850, 300).makeGraphic(277, 87, 0xFFFFFFFF);
	button4pos = new FlxSprite(850, 400).makeGraphic(277, 87, 0xFFFFFFFF);

    for (shucks in [button1pos, button2pos, button3pos, button4pos]) {
        shucks.updateHitbox();
        shucks.alpha = 0;
        add(shucks);
    }

    button1text = new FlxText(0, 0, 350);
    button1text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button1text.color = 0xFF130022;
    button1text.antialiasing = false;
    button1text.borderColor = 0xFFFBF1FF;
    button1text.borderSize = 3;
    button1text.cameras = [camHUD];

    button2text = new FlxText(0, 0, 350);
    button2text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button2text.color = 0xFF130022;
    button2text.antialiasing = false;
    button2text.borderColor = 0xFFFBF1FF;
    button2text.borderSize = 3;
    button2text.cameras = [camHUD];

    button3text = new FlxText(0, 0, 350);
    button3text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button3text.color = 0xFF130022;
    button3text.antialiasing = false;
    button3text.borderColor = 0xFFFBF1FF;
    button3text.borderSize = 3;
    button3text.cameras = [camHUD];

    button4text = new FlxText(0, 0, 350);
    button4text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button4text.color = 0xFF130022;
    button4text.antialiasing = false;
    button4text.borderColor = 0xFFFBF1FF;
    button4text.borderSize = 3;
    button4text.cameras = [camHUD];

    darkness = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    darkness.scrollFactor.set(0, 0);
    darkness.alpha = 0;
    darkness.cameras = [camHUD];
    add(darkness);

    transitionImageBG = new FlxSprite(-1900, 0);
    transitionImageBG.frames = Paths.getSparrowAtlas('shh/DATINGSIM/transition/switchingScenes');
	transitionImageBG.antialiasing = false;
    transitionImageBG.animation.addByPrefix('boil', 'boil', 6, true);
    transitionImageBG.scrollFactor.set(0, 0);
    transitionImageBG.animation.play('boil');
    transitionImageBG.cameras = [camHUD];
    add(transitionImageBG);

    transitionImage = new FlxSprite(-1950, 0);
    transitionImage.frames = Paths.getSparrowAtlas('shh/DATINGSIM/transition/0');
    transitionImage.animation.addByPrefix('boil', 'boil', 6, true);
    transitionImage.animation.play('boil');
	transitionImage.antialiasing = false;
    transitionImage.scrollFactor.set(0, 0);
    transitionImage.cameras = [camHUD];
    add(transitionImage);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);
    
    loadGame();

    if (gameLoaded == false) {    
        new FlxTimer().start(0.35, function(timer) {
            canDoShitDude = true;
            //dialogueUpdateShit();
            sceneDialogChange("openingLOL", false);
        });
    }

}

function sceneDialogChange(sceneToSwitchTo, doTransition) {

    alongTheDialogue = 0;

    if (doTransition == true) {
        canDoShitDude = false;
        shutTheFuckUp = true;
        // TRANSITION LINE using this for when i need to ctrl+F to find this
        transitionImage.frames = Paths.getSparrowAtlas('shh/DATINGSIM/transition/'+FlxG.random.int(0, 2));
        transitionImage.animation.addByPrefix('boil', 'boil', 6, true);
        transitionImage.animation.play('boil');
        FlxTween.tween(transitionImageBG, {x: -150}, 1.5, {ease: FlxEase.quartOut});
        FlxTween.tween(transitionImage, {x: -150}, 1.5, {ease: FlxEase.quartOut});
        transitionShit("nameBoxDPEAR", "");
        new FlxTimer().start(2.5, function(timer) {
            curScene = sceneToSwitchTo;
            trace("transitioning to: "+curScene);
            transitionShit("screenUnfade", "");
            FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);
            FlxTween.tween(transitionImageBG, {x: 1900}, 1.5, {ease: FlxEase.quartIn});
            FlxTween.tween(transitionImage, {x: 1950}, 1.5, {ease: FlxEase.quartIn});
            transitionShit("nameBoxPEAR", "");
            new FlxTimer().start(0.2, function(timer) {
                canDoShitDude = true;
                sceneSystem(sceneToSwitchTo);
                shutTheFuckUp = false;
            });
            new FlxTimer().start(2.5, function(timer) {
                transitionImageBG.x = -1900;
                transitionImage.x = -1950;
            });
        });
    }

    if (doTransition == false) {
        curScene = sceneToSwitchTo;
        trace("moved to room/scene: "+curScene);
        sceneSystem(sceneToSwitchTo);
    }

}

// THE SHITTY ASS OLD SYSTEM HAS DIED FELLAS. WE'RE ONTO A SCENE SYSTEM NOW!!!!
// you can find it in "OLDDATINGSIMSYTEM.hx in the SCRAPPED folder"

function sceneSystem(scene) {

    stopHere = false;

    for (buttons in [button1text, button2text, button3text, button4text]) {
        buttons.x = 813;
        buttons.scale.set(1, 1);
    }

        button1text.y = 122;
        button2text.y = 222;
        button3text.y = 322;
        button4text.y = 422;

    switch (scene) {

        case "openingLOL":

            fileSceneName = "DUDE SCHOOL Entrance";

            if (alongTheDialogue == 0) {
                transitionShit("nameBoxPEAR", "");
                ground = 'thatSchoolThatIHate';
                char1var = 'dudeDating';
                canDoShitDude = true;
                characterStatus("APPEAR", char1);
                name.text = 'DudeMan';
                txtBro.resetText("Hi there my GOOD FRIEND!");
                txtBro.start(0.03);
                removeButtons();
            }

            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                txtBro.resetText("its me. the dude.. man!");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                txtBro.resetText("welcome to DUDE SCHOOL.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                txtBro.resetText("its awesome and cool and awesome and cool and-");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 4) {
                char2var = 'Fruity/base';
                canDoShitDude = true;
                characterStatus("DEPRIO", char1);
                characterStatus("APPEAR", char2);
                name.text = 'Fruity';
                txtBro.resetText("HI DUDEMAN ! HI THAT ONE GUY !");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 5) {
                canDoShitDude = true;
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                characterStatus("SIDELEFT", char1);
                characterStatus("SIDERIGHT", char2);
                name.text = 'DudeMan';
                txtBro.resetText("FRUITY. YOU ARE RUINING. MY. INTRO!!!!!!");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 6) {
                canDoShitDude = true;
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                name.text = 'Fruity';
                txtBro.resetText("BUT I JUST WANTED TO SAY HI :c");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 7) {
                canDoShitDude = true;
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                name.text = 'DudeMan';
                txtBro.resetText("i DONT care lil bro");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 8) {
                canDoShitDude = true;
                characterStatus("MIDDLE", char1);
                name.text = 'DudeMan';
                txtBro.resetText("AS i was saying.");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 9) {
                canDoShitDude = true;
                characterStatus("MIDDLE", char1);
                name.text = 'DudeMan';
                txtBro.resetText("Welcome to DUDE SCHOOL");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 10) {
                canDoShitDude = true;
                characterStatus("MIDDLE", char1);
                name.text = 'DudeMan';
                txtBro.resetText("somewhere here, you'll find someone to LOVE <3333");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 11) {
                canDoShitDude = true;
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                characterStatus("SIDELEFT", char1);
                characterStatus("MIDDLE", char2);
                name.text = 'Fruity';
                txtBro.resetText("NO THEY WONT !! c:");
                txtBro.start(0.03);
            } 
            
            if (alongTheDialogue == 12) {
                canDoShitDude = true;
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                characterStatus("MIDDLE", char1);
                characterStatus("SIDERIGHT", char2);
                name.text = 'DudeMan';
                txtBro.resetText("FRUITY SHUT UP");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 13) {
                canDoShitDude = true;
                characterStatus("UNAPPEAR", char2);
                name.text = 'DudeMan';
                txtBro.resetText("Now, friend of mine. pal.");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 14) {
                stopHere = true;
                //transitionShit("switchLocation", "openingLOL");
                canDoShitDude = false;
                name.text = 'DudeMan';
                characterStatus("UNAPPEAR", char2);
                txtBro.resetText("Are you ready to take step into my.,,. school of love....?");
                txtBro.start(0.03);
                val3DoFade = false;
                val4DoFade = false;
                buttonText3Be("Yeah, Man !");
                buttonText4Be("No, dude.");
                buttonAdd(3);
                buttonAdd(4);
            }


        case "No, dude.":

            fileSceneName = "DUDE SCHOOL Entrance";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                music.pause();
                name.text = 'DudeMan';
                txtBro.resetText("oh");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 1) {
                stopHere = true;
                FlxG.switchState(new ModState("GAMES/datingSimTitle"));
            }

        case "Yeah, Man !":

            fileSceneName = "DUDE SCHOOL Entrance";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                txtBro.resetText("oh yeah baby. this is happening. its just getting started.");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                txtBro.resetText("okay come with me then bestie");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 2) {
                stopHere = true;
                canDoShitDude = false;
                // transitionShit("switchLocation", "hallway1OPENING");
                sceneDialogChange("hallway1OPENING", true);
            }
        
        case "hallway1OPENING":

            fileSceneName = "School Hallways";
            ground = "hallway1";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxPEAR", "");
                characterStatus("APPEAR", char1);
                name.text = 'DudeMan';
                txtBro.resetText("my school");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                characterStatus("APPEAR", char1);
                name.text = 'DudeMan';
                txtBro.resetText("im realizing that u actually have to meet people to FIND LOVE <3, so im going to let you do that\n\n\nAuf Wiedersehen, Kumpel! Ich hoffe, du kommst zugrunde!");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("DudeMan climbs into a locker and vanishes, its up to you now, I guess!");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 3) {
                FlxG.save.data.tutorialToShow = "datingSimLOVEMETER";
                openSubState(new ModSubState("Functionality/Tutorial"));
                camera.addShader(blurShit);
                camHUD.addShader(blurShit);
                stopHere = true;
                sceneDialogChange("choice1DEFAULT", false);
            }

        case "choice1DEFAULT":

            fileSceneName = "School Hallways";
            ground = "hallway1";

            if (alongTheDialogue == 0) {
                stopHere = true;
                canDoShitDude = false;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                exception = true;
                if (mother1 == true) {
                    val1 = "mother2";
                }
                else if (mother2 == true) {
                    val1 = "mother3";
                }
                else {
                    val1 = "mother1";
                }
                trace(FlxG.save.data.funValue);
                if (FlxG.save.data.funValue > 5 && FlxG.save.data.funValue < 19) {
                    val3 = "brooklynGuy";
                }
                else {
                    val3 = "KathyRoomOPENING";
                }
                val2 = "hallway2OPENING"; 
                val4 = "FruityRoomOPENING";
                val1DoFade = false;
                val2DoFade = true;
                val3DoFade = false;
                val4DoFade = false;
                buttonText1Be("yoiur moms ho use.");
                buttonText2Be("Keep going forwards");
                for (i in 0...FlxG.save.data.mondayInteractionOrder.length)	{

                    var yeah;

                    if (FlxG.save.data.mondayInteractionOrder[i] == "kathy") {
                        buttonText3Be("LOCKED");
                        lockButton(3);
                        yeah = true;
                    }
                    else {
                        if (yeah != true) {
                            buttonText3Be("Class on the Left !");
                        }
                    }

                }
                buttonText4Be("Class on the Right !");
                buttonAdd(1);
                buttonAdd(2);
                buttonAdd(3);
                buttonAdd(4);
                txtBro.resetText("Where would you like to go ?");
                txtBro.start(0.03);
            }

        case "mother1":

            fileSceneName = "School Hallways";
            ground = "hallway1";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("haha you're SO FUCKING FUNNY MAN");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("I HOPE U DIE BRO RRRAAAAH IM THE BURGER DEMON FUCK YOU");
                txtBro.start(0.03);
                mother1 = true;
            }

            if (alongTheDialogue == 2) {
                stopHere = true;
                sceneDialogChange("choice1NOMOTHER", false);
            }
                
                
    
        case "mother2":

            fileSceneName = "School Hallways";
            ground = "hallway1";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                mother1 = false;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("dude are you fucking serious");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("YOU'RE ABUSING A BUG TO ASK TO SEE MY MOM AGAIN ????");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("FUCK YOU");
                txtBro.start(0.03);
                mother2 = true;
            }

            if (alongTheDialogue == 3) {
                stopHere = true;
                sceneDialogChange("choice1NOMOTHER", false);
            }
        
        case "mother3":

            fileSceneName = "School Hallways";
            ground = "hallway1";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("you're a bad person btw");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                txtBro.resetText("i hope you rot");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2 && mother2 == true) {
                stopHere = true;
                saveGame();
                FlxG.switchState(new ModState("GAMES/datingSimTitle"));
            }
            if (alongTheDialogue == 2 && mother2 == false) {
                stopHere = true;
                sceneDialogChange("choice1DEFAULT", false);
            }

        case "choice1NOMOTHER":

            fileSceneName = "School Hallways";
            ground = "hallway1";

            if (alongTheDialogue == 0) {
                canDoShitDude = false;
                alongTheDialogue = 20;
                exception = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                val2 = "hallway2OPENING"; 
                trace(FlxG.save.data.funValue);
                if (FlxG.save.data.funValue > 5 && FlxG.save.data.funValue < 19) {
                    val3 = "brooklynGuy";
                }
                else {
                    val3 = "KathyRoomOPENING";
                }
                val4 = "FruityRoomOPENING";
                val2DoFade = true;
                val3DoFade = false;
                val4DoFade = false;
                buttonText2Be("Keep going forwards");
                buttonText3Be("Class on the Left !");
                buttonText4Be("Class on the Right !");
                buttonAdd(2);
                buttonAdd(3);
                buttonAdd(4);
                stopHere = true;
                txtBro.resetText("Where would you like to go ?");
                txtBro.start(0.03);
            }

        case "brooklynGuy":

            fileSceneName = "Blood Class ( Brooklyn Guy Fun Value Event )";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                transitionShit("screenFade", "");
                name.text = '';
                txtBro.resetText("You enter the classroom,");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                ground = "Class1";
                txtBro.resetText("It smells like,.. jobs?? tf that aint supposed to happen :sob:");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                                    openSubState(new ModSubState("Functionality/DudeNotify"));
                    FlxG.save.data.notificationType1 = "funValue";
                    FlxG.save.data.notificationMessage1 = "You Encountered a Fun Value event!";
                transitionShit("nameBoxPEAR", "");
                transitionShit("screenUnfade", "");
                char1var = 'BrooklynGuy';
                characterStatus("APPEAR", char1);
                name.text = 'Brooklyn Guy';
                txtBro.resetText("Oh boy I sure do LOVE my jobs class");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                transitionShit("nameBoxPEAR", "");
                transitionShit("screenUnfade", "");
                char1var = 'BrooklynGuy';
                characterStatus("APPEAR", char1);
                name.text = 'Brooklyn Guy';
                txtBro.resetText("I love jobs :grin:");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 4) {
                canDoShitDude = true;
                if (playerName != null) {
                    name.text = playerName;
                }
                else {
                    name.text = "you";
                }
                txtBro.resetText("HOLY CRAP LOUIS ITS BROOKLYN T. GUY");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 5) {
                canDoShitDude = true;
                name.text = 'Brooklyn Guy';
                txtBro.resetText("Brooklyn T. Guy");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 6) {
                canDoShitDude = true;
                if (playerName != null) {
                    name.text = playerName;
                }
                else {
                    name.text = "you";
                }
                txtBro.resetText("This fucking ROCKS.");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 7) {
                canDoShitDude = true;
                name.text = 'Brooklyn Guy';
                txtBro.resetText("Well Brooklyn T. Guy. you did it again.");
                txtBro.start(0.03); 
            }
        
            if (alongTheDialogue == 8) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                transitionShit("screenFade", "");
                name.text = '';
                txtBro.resetText("you BLACK OUT lmao\n\nbut ur like awake now so yeah does a kissy face");
                txtBro.start(0.03);
            }
        
            if (alongTheDialogue == 9) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                    sceneDialogChange("KathyRoomOPENING", false);
                });
            }

        case "KathyRoomOPENING":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                transitionShit("screenFade", "");
                name.text = '';
                txtBro.resetText("You enter the classroom,");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                ground = "class1";
                txtBro.resetText("It smells like,.. blood?");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                char1var = 'Kathy/Base';
                canDoShitDude = true;
                transitionShit("nameBoxPEAR", "");
                transitionShit("screenUnfade", "");
                characterStatus("APPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("Oh boy I sure do LOVE my blood class");
                txtBro.start(0.03);
                FlxG.save.data.showbar = "kathy";
                openSubState(new ModSubState("GAMES/DATEFUNC/dateMeter"));
            }
    
            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                char1var = 'Kathy/Tired';
                characterStatus("APPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("...");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 4 && playerName == null) {
                stopHere = true;
                char1var = 'Kathy/Tired';
                characterStatus("APPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("Who're you?");
                txtBro.start(0.03);
                button2text.scale.set(0.85, 1);
                button3text.scale.set(0.85, 0.85);
                button3text.y -= 35;
                buttonText1Be(Sys.environment()["USERNAME"]);
                buttonText2Be("I'm. heh. Bee Flavourtext.");
                buttonText3Be("AAAAAAAAAH IM A MINOORRRR GET AWAY FROM MEEEEE");
                buttonText4Be("Your future partner ;]");
                buttonAdd(1);
                buttonAdd(2);
                buttonAdd(3);
                buttonAdd(4);
            }

            if (alongTheDialogue == 4 && playerName != null) {
                characterStatus("CONCRETEOUT", char2);
            }
    
        case "AAAAAAAAAH IM A MINOORRRR GET AWAY FROM MEEEEE":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                char1var = 'Kathy/minor';
                name.text = 'Kathy';
                txtBro.resetText("AH WHAT WHAT THE FUCK");
                txtBro.start(0.03);
                FlxG.save.data.kathyBar -= 5;
            }

            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                char1var = 'Kathy/minor';
                name.text = 'Kathy';
                txtBro.resetText("WHAT IS WRONG WITH YOU");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                char1var = 'Kathy/minor';
                name.text = 'Kathy';
                txtBro.resetText("LIKE. OKAY ?? I GUESS ???");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 3) {
                stopHere = true;
                char1var = 'Kathy/minor';
                name.text = 'Kathy';
                txtBro.resetText("ARE YOU JUST. NAMED MINOR ??");
                txtBro.start(0.03);
                exception = true;
                val3 = "nameIsMinor";
                val4 = "nameMIGHTbeMinor";
                buttonText3Be("Yes");
                buttonText4Be("Mayhaps");
                buttonAdd(3);
                buttonAdd(4);
            }

        case "nameIsMinor":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                FlxG.save.data.kathyBar += 5;
                canDoShitDude = true;
                char1var = 'Kathy/Base';
                name.text = 'Kathy';
                playerName = "minor";
                txtBro.resetText("oh cool hello minor");
                txtBro.start(0.03);
            }
            if (alongTheDialogue == 1) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                sceneDialogChange("dudemanAppearKathyRoomOPENING", false);
                });
            }

        case "nameMIGHTbeMinor":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                char1var = 'Kathy/minor';
                name.text = 'Kathy';
                playerName = "minor";
                txtBro.resetText("wh-");
                txtBro.start(0.03);
            }
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                char1var = 'Kathy/confused';
                name.text = 'Kathy';
                txtBro.resetText("okay ???");
                txtBro.start(0.03);
            }
            if (alongTheDialogue == 2) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                sceneDialogChange("dudemanAppearKathyRoomOPENING", false);
                });
            }  

        case "Your future partner ;]":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                name.text = "Kathy";
                char1var = "Kathy/Angry";
                txtBro.resetText("thats-");
                txtBro.start(0.03);
                FlxG.save.data.kathyBar -= 10;
            }

            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                name.text = "Kathy";
                txtBro.resetText("thats great. man.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                name.text = "Kathy";
                txtBro.resetText("im gonna just call you..");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                name.text = "Kathy";
                playerName = "asshole";
                txtBro.resetText("asshole !");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 4) {
                stopHere = true;
                exception = true;
                char1var = "Kathy/Tired";
                val3 = "dontCareKATHY1bad";
                val4 = "dontCareKATHY1";
                name.text = "Kathy";
                txtBro.resetText("that good, asshole??");
                txtBro.start(0.03);
                buttonText3Be("yeah, actually");
                buttonText4Be("no");
                buttonAdd(3);
                buttonAdd(4);
            }

        case "dontCareKATHY1":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                name.text = "Kathy";
                char1var = "Kathy/Base";
                txtBro.resetText("y'know, i honestly dont care. fuck you");
                txtBro.start(0.03);
            }
            if (alongTheDialogue == 1) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                sceneDialogChange("dudemanAppearKathyRoomOPENING", false);
                });
            }

        case "dontCareKATHY1bad":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                name.text = "Kathy";
                txtBro.resetText("y'know, i honestly dont care. fuck you");
                txtBro.start(0.03);
                FlxG.save.data.kathyBar -= 10;
            }
            if (alongTheDialogue == 1) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                sceneDialogChange("dudemanAppearKathyRoomOPENING", false);
                });
            }

        case "I'm. heh. Bee Flavourtext.":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                stopHere = true;
                characterStatus("SIDERIGHT", char1);
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                characterStatus("APPEAR", char2);
                characterStatus("CONCRETE", char2);
                char2var = 'PosterizedBeeFlavourText';
            }

            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                char1var = 'Kathy/minor';
                char2var = 'PosterizedBeeFlavourText';
                name.text = 'Posterized Bee FlavourText';
                txtBro.resetText("dude. not cool.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                name.text = 'Posterized Bee FlavourText';
                txtBro.resetText("not FUCKING COOL. man.");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                name.text = 'Posterized Bee FlavourText';
                txtBro.resetText("How would you like it if I impersonated YOU, HUH ??");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 4) {
                canDoShitDude = true;
                name.text = 'Posterized Bee FlavourText';
                txtBro.resetText("WHATS YOUR NAME, HUH??");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 5) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = 'Posterized Bee FlavourText';
                txtBro.resetText("You stammer and stutter, attempting to collect yourself. as you're about to say your name, POSTERIZED BEE FLAVOURTEXT interupts-");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 6) {
                char1var = 'Kathy/Tired';
                canDoShitDude = true;
                transitionShit("nameBoxPEAR", "");
                name.text = 'Posterized Bee FlavourText';
                txtBro.resetText("YOUR NAME IS EVE NOW");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 7) {
                playerName = "eve";
                canDoShitDude = true;
                name.text = playerName;
                txtBro.resetText("what");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 8) {
                canDoShitDude = true;
                name.text = "Kathy";
                characterStatus("SIDELEFT", char2);
                characterStatus("MIDDLE", char1);
                characterStatus("DEPRIO", char2);
                characterStatus("PRIO", char1);
                txtBro.resetText("...just go with it");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 9) {
                canDoShitDude = true;
                name.text = playerName;
                txtBro.resetText("ok");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 10) {
                canDoShitDude = true;
                characterStatus("SIDERIGHT", char1);
                characterStatus("MIDDLE", char2);
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                name.text = 'Posterized Bee FlavourText';
                char2var = 'PosterizedBeeFlavourText';
                txtBro.resetText("FUCK you eve.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 11) {
                canDoShitDude = true;
                name.text = 'Posterized Bee FlavourText';
                char2var = 'PosterizedBeeFlavourText';
                txtBro.resetText("I'm LEAVVINNGG");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 12) {
                stopHere = true;
                characterStatus("CONCRETEOUT", char2);
            }

            if (alongTheDialogue == 13) {
                canDoShitDude = true;
                name.text = "Kathy";
                characterStatus("MIDDLE", char1);
                characterStatus("UNAPPEAR", char2);
                characterStatus("PRIO", char1);
                txtBro.resetText("uhm.. well.... eve! thats a nice.. name. yeah. uhmm");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 14) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                sceneDialogChange("dudemanAppearKathyRoomOPENING", false);
                });
            }

        case Sys.environment()["USERNAME"]:
            
            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                stopHere = true;
                char1var = "Kathy/Base";
                playerName = Sys.environment()["USERNAME"];
                name.text = 'Kathy';
                txtBro.resetText("cool name c:");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 1) {
                stopHere = true;
                new FlxTimer().start(0.25, function(timer) {
                sceneDialogChange("dudemanAppearKathyRoomOPENING", false);
                });
            }
    
        case "dudemanAppearKathyRoomOPENING":
    
            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0 && FlxG.save.data.kathyBar > -1) {
                canDoShitDude = true;
                char1var = 'Kathy/Confused';
                characterStatus("APPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("if i may ask, how did you... get here? are you new or something? i hope that doesnt sound rude but, ive just never seen you in this school before");
                txtBro.start(0.03);
            }
            if (alongTheDialogue == 0 && FlxG.save.data.kathyBar < 5) {
                canDoShitDude = true;
                char1var = 'Kathy/AngryArmsDown';
                characterStatus("APPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("so. why are you even here then? just to be a dick? how the hell did you get here in the first place?? you dont even go to this damn school!");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 1 && FlxG.save.data.kathyBar > -1) {
                char1var = 'Kathy/Angry';
                canDoShitDude = true;
                name.text = playerName;
                txtBro.resetText("the door");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 1 && FlxG.save.data.kathyBar < 5) {
                char1var = 'Kathy/Angry';
                canDoShitDude = true;
                name.text = playerName;
                txtBro.resetText("the door");
                txtBro.start(0.03);
                FlxG.save.data.kathyBar -= 15;
            }
    
            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                char1var = 'Kathy/Angry';
                characterStatus("APPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("wow. you're so funny");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                char1var = 'Kathy/Ew';
                characterStatus("SIDERIGHT", char1);
                characterStatus("FLYIN", char2);
                char2.x = 375;
                characterStatus("DEPRIO", char1);
                char2var = 'dudeDating';
                name.text = 'DudeMan';
                txtBro.resetText("hello friends are you liking my awesome sudduesxchohol");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 4) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                characterStatus("SIDELEFT", char2);
                txtBro.resetText("wait");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 5) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                char1var = 'Kathy/oh';
                txtBro.resetText("Kathy why the FUCK do you look like that");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 6) {
                canDoShitDude = true;
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                name.text = 'Kathy';
                txtBro.resetText("Cuz i can");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 7) {
                canDoShitDude = true;
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                name.text = 'DudeMan';
                txtBro.resetText("KATHY");
                txtBro.start(0.03);
            }
                   
            if (alongTheDialogue == 8) {
                canDoShitDude = true;
                name.text = 'DudeMan';
                txtBro.resetText("YOU'RE NOT SUPPOSED TO LOOK LIKE THAT");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 9) {
                canDoShitDude = true;
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                name.text = 'Kathy';
                txtBro.resetText("Cuz i can");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 10) {
                canDoShitDude = true;
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                name.text = 'DudeMan';
                txtBro.resetText("I HATE YOU");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 11) {
                canDoShitDude = true;
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                name.text = 'Kathy';
                txtBro.resetText("No you dont");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 12) {
                canDoShitDude = true;
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                name.text = 'DudeMan';
                txtBro.resetText("You're right");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 13) {
                characterStatus("FLYOUT", char2);
                name.text = '';
                txtBro.resetText("");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 14) {
                canDoShitDude = true;
                characterStatus("MIDDLE", char1);
                characterStatus("PRIO", char1);
                name.text = 'Kathy';
                txtBro.resetText("Good Riddance I hate that guy");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 15) {
                canDoShitDude = true;
                characterStatus("MIDDLE", char1);
                characterStatus("PRIO", char1);
                name.text = 'Kathy';
                txtBro.resetText("");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 16) {
                canDoShitDude = true;
                name.text = 'Kathy';
                txtBro.resetText("");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 17) {
                canDoShitDude = true;
                char1var = "Kathy/Tired";
                name.text = 'Kathy';
                txtBro.resetText("uhm");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 18 && FlxG.save.data.kathyBar > -1) {
                char1var = "Kathy/Tired";
                name.text = 'Kathy';
                txtBro.resetText("");
                txtBro.start(0.03);
                stopHere = true;
            }

            if (alongTheDialogue == 18 && FlxG.save.data.kathyBar < 0) {
                char1var = "Kathy/Tired";
                name.text = 'Kathy';
                txtBro.resetText("Can you leave me alone now?");
                txtBro.start(0.03);
                exception = true;
                buttonText3Be("yeah, sorry");
                buttonText4Be("no");
                val3 = "apologizeBadRouteKATHY1";
                val4 = "dontApologizeBadRouteKATHY1";
                buttonAdd(3);
                buttonAdd(4);
                stopHere = true;
            }

        case "apologizeBadRouteKATHY1":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                transitionShit("screenFade", "");
                name.text = '';
                FlxG.save.data.kathyBar += 15;
                FlxG.save.data.showbar = null;
                txtBro.resetText("I think you screwed that one up.");
                txtBro.start(0.03);
                findEmptySlot("mondayInteractionOrder", "kathy");
            }
    
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                txtBro.resetText("but, atleast you left when asked, good enough.. I guess? it could've been worse.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                txtBro.resetText("oh well, onto the next person");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 3) {
                sceneDialogChange("choice1DEFAULT", true);
            }

        case "dontApologizeBadRouteKATHY1":

            fileSceneName = "Blood Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                name.text = 'Kathy';
                char1var = 'Kathy/Angry';
                txtBro.resetText("oh my god. you are INSUFFERABLE");
                txtBro.start(0.03);
                FlxG.save.data.kathyBar -= 30;
            }

            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                name.text = 'Kathy';
                char1var = 'Kathy/Angry';
                txtBro.resetText("I'll just leave on my fucking own then.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                FlxG.save.data.showbar = null;
                txtBro.resetText("..wow");
                txtBro.start(0.03);
                findEmptySlot("mondayInteractionOrder", "kathy");
            }
    
            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                txtBro.resetText("you're kind of a dick, that went AWFULLY");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 4) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                txtBro.resetText("one day in and you've made a genuine enemy, you're not good at this flirting thing.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 5) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                txtBro.resetText("well uhm.. I guess lets just move on then.");
                txtBro.start(0.03);
            }

            if (alongTheDialogue == 6) {
                sceneDialogChange("choice1DEFAULT", true);
            }
        

        case "FruityRoomOPENING":

            fileSceneName = "Art Class";

            if (alongTheDialogue == 0) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                transitionShit("screenFade", "");
                name.text = '';
                txtBro.resetText("You enter the classroom,");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 1) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                ground = "class2";
                name.text = '';
                txtBro.resetText("It smells like,.. smellified autism.");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 2) {
                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                name.text = '';
                ground = "Class2";
                txtBro.resetText("didnt know that was even possible");
                txtBro.start(0.03);
            }
            
            if (alongTheDialogue == 3) {
                canDoShitDude = true;
                FlxG.save.data.showbar = "fruity";
                FlxG.save.data.showbarSecondary = "zee";
                transitionShit("nameBoxPEAR", "");
                transitionShit("screenUnfade", "");
                char1var = 'Fruity/Base';
                char2var = 'Zee/Base';
                characterStatus("SIDELEFT", char1);
                characterStatus("SIDERIGHT", char2);
                characterStatus("PRIO", char1);
                characterStatus("DEPRIO", char2);
                name.text = 'Fruity';
                txtBro.resetText("NO ZEE U ARENT DOING IT RIGHT U GOTTA DO THE LIGHTER COLORS FIRST");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 4) {
                canDoShitDude = true;
                transitionShit("nameBoxPEAR", "");
                transitionShit("screenUnfade", "");
                char1var = 'Fruity/Base';
                char2var = 'Zee/Base';
                characterStatus("SIDELEFT", char1);
                characterStatus("SIDERIGHT", char2);
                characterStatus("DEPRIO", char1);
                characterStatus("PRIO", char2);
                name.text = 'Zee';
                txtBro.resetText("THIZ IZ CONFUZING!!! WATERCOLOR IS CONFUZING!!!");
                txtBro.start(0.03);
            }

        case "hallway2OPENING":

            fileSceneName = "School Hallways";

            ground = "hallway2";

            if (alongTheDialogue == 0) {
                transitionShit("nameBoxDPEAR", "");
                canDoShitDude = true;
                characterStatus("UNAPPEAR", char1);
                name.text = '';
                exception = true;
                val2 = "choice1DEFAULT";
                val3 = "JanitorsCloset";
                val4 = "DudeManRoomOPENING";
                val2DoFade = true;
                val3DoFade = true;
                val4DoFade = true;
                buttonText2Be("Nah bro take me back");
                buttonText3Be("Janitor's Closet");
                buttonText4Be("Class on the Right");
                buttonAdd(2);
                buttonAdd(3);
                buttonAdd(4);
                stopHere = true;
                txtBro.resetText("Theres two doors you can go through");
                txtBro.start(0.03);
            }

        default:

            if (alongTheDialogue == 0) {

                fileSceneName = "Error Room";

                canDoShitDude = true;
                transitionShit("nameBoxDPEAR", "");
                characterStatus("UNAPPEAR", char1);
                characterStatus("UNAPPEAR", char1);
                name.text = 'Kathy';
                txtBro.resetText("AAAAAAAAAAAAAAAAAAAA YOUR GAME IS BROKEEENNN IM THE BURGER DEMEMMOOOONNN");
                txtBro.start(0.03);
            }
    
            if (alongTheDialogue == 1) {
                FlxG.resetState();
            }

    }

    char1.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char1var));
    char2.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char2var));
    bg.loadGraphic(Paths.image('shh/DATINGSIM/background/'+ground));

}

function lockButton(type) {

    isDisabled[type] = true;

}
 
function findEmptySlot(variable, toAdd) {

    var found;

    for (i in 0...8) {

        if (variable == "mondayInteractionOrder") {
            if (found != true) {
                if (FlxG.save.data.mondayInteractionOrder[i] == "") {
                    found = true;
                    FlxG.save.data.mondayInteractionOrder[i] = toAdd;
                }
            }
        }

    }

}

function skipDialogue() {

    canDoShitDude = false;
    if (stopHere != true) {

        alongTheDialogue += 1;
        sceneSystem(curScene);
        if (stopHere == false) {
            skipDialogue();
        }

    }

}

function update() {

    if (shutTheFuckUp == true) {
        canDo = false;
        characterStatus("UNAPPEAR", char1);
        characterStatus("UNAPPEAR", char2);
    }

    if (canDoShitDude == true) {
        key.alpha = 1;
    }
    else {
        key.alpha = 0;
    }

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

	if (FlxG.keys.justPressed.S) {
        saveGame();
    }

    if (FlxG.keys.justPressed.SHIFT && canDoShitDude == true) {
        skipDialogue();
    }

	if (FlxG.keys.justPressed.G) {
        FlxG.save.data.datingDialogue = null;
    }

//    if (FlxG.keys.justPressed.H) {
//        openSubstate(new ModSubState("FUNCTIONALITY/DEV-TERMINAL"));
//    }

    if (FlxG.save.data.blehRemoveMyShadersFAGGGOOT == true) {
        camera.removeShader(blurShit);
        camHUD.removeShader(blurShit);
        FlxG.save.data.blehRemoveMyShadersFAGGGOOT = false;
    }

    if (FlxG.save.data.substateOpen == false || FlxG.save.data.substateOpen == null) {

        if (FlxG.keys.justPressed.ENTER && canDoShitDude == true && inShop == false) {
            changeDialogue();
        }
    
        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new ModState("GAMES/datingSimTitle"));
        }
    
        if (dialogueButton1.alpha == 1 && inShop == false && isDisabled[1] == false) {
            if (FlxG.mouse.overlaps(button1pos) && FlxG.mouse.justPressed) {
                if (exception == false) {
                    buttonSpaghetti(1, button1text.text, val1DoFade);
                }
                else {
                    buttonSpaghetti(1, val1, val1DoFade);
                }
    
            }
        }
    
        if (dialogueButton2.alpha == 1 && inShop == false && isDisabled[2] == false) {
            if (FlxG.mouse.overlaps(button2pos) && FlxG.mouse.justPressed) {
                if (exception == false) {
                    buttonSpaghetti(2, button2text.text, val2DoFade);
                }
                else {
                    buttonSpaghetti(2, val2, val2DoFade);
                }
            }
        }
    
        if (dialogueButton3.alpha == 1 && inShop == false && isDisabled[3] == false) {
            if (FlxG.mouse.overlaps(button3pos) && FlxG.mouse.justPressed) {
                if (exception == false) {
                    buttonSpaghetti(3, button3text.text, val3DoFade);
                }
                else {
                    buttonSpaghetti(3, val3, val3DoFade);
                }
            }
        }
    
        if (dialogueButton4.alpha == 1 && inShop == false && isDisabled[4] == false) {
            if (FlxG.mouse.overlaps(button4pos) && FlxG.mouse.justPressed) {
                if (exception == false) {
                    buttonSpaghetti(4, button4text.text, val4DoFade);
                }
                else {
                    buttonSpaghetti(4, val4, val4DoFade);
                }
            }
        }

    }

}

function loadDefaultSaveShit() {
    FlxG.save.data.substateOpen = false;
    FlxG.save.data.kathyBar = 0;
    FlxG.save.data.fruityBar = 0;
    FlxG.save.data.zeeBar = 0;
    FlxG.save.data.showbar = null;
    FlxG.save.data.showbarSecondary = null;
    FlxG.save.data.mondayInteractionOrder = [

        "",
        "",
        ""

    ];
}

function transitionShit(type, sceneToBe) {

    if (type != "switchLocation" && type != "screenFade") {
        nameBoxState = type;
    }

    switch (type) {

        case "screenFade":
            FlxTween.tween(darkness2, {alpha: 1}, 1);

        case "screenUnfade":
            FlxTween.tween(darkness2, {alpha: 0}, 1);

        case "switchLocation":
            FlxTween.tween(darkness, {alpha: 1}, 1);
            new FlxTimer().start(1, function(timer) {
                for (yippee in [dialogue, dialogueTop, name, txtBro, key]) {
                    FlxTween.tween(yippee, {alpha: 0}, 0.5);
                }
                characterStatus("UNAPPEAR", char1);
                characterStatus("UNAPPEAR", char2);
                new FlxTimer().start(0.5, function(timer) {
                    txtBro.resetText("");
                    transitionShit("nameBoxDPEAR", "");
                    txtBro.start(0.03);
                    name.text = "";
                    new FlxTimer().start(0.2, function(timer) {
                        FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);
                        new FlxTimer().start(0.25, function(timer) {
                            sceneDialogChange(sceneToBe, false);
                            FlxTween.tween(darkness, {alpha: 0}, 1);
                        });
                        for (yippee in [dialogue, dialogueTop, name, txtBro, key]) {
                            FlxTween.tween(yippee, {alpha: 1}, 0.5);
                        }
                    });
                });
            });

        case "nameBoxDPEAR":
            FlxTween.tween(dialogueTop, {y: 700}, 0.5, {ease: FlxEase.quartOut});
            FlxTween.tween(name, {y: 720}, 0.5, {ease: FlxEase.quartOut});

        case "nameBoxPEAR":
            FlxTween.tween(dialogueTop, {y: 435}, 0.5, {ease: FlxEase.quartOut});
            FlxTween.tween(name, {y: 450}, 0.5, {ease: FlxEase.quartOut});

    }

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

    for (i in 0...isDisabled.length) {
        isDisabled[i] = false;
    }

    new FlxTimer().start(0.35, function(timer) {
            dialogueButton1.alpha = 0;
            remove(dialogueButton1);
            remove(button1text);
            dialogueButton2.alpha = 0;
            remove(dialogueButton2);
            remove(button2text);
            dialogueButton3.alpha = 0;
            remove(dialogueButton3); 
            remove(button3text); 
            dialogueButton4.alpha = 0;
            remove(dialogueButton4);
            remove(button4text);
    });
}

function buttonAdd(type) {

    switch (type) {

        case 1:
            dialogueButton1.alpha = 1;
            insert(2, dialogueButton1);
            insert(4, button1text);
            if (isDisabled[1] == true) {
                dialogueButton1.color = 0xFF656565;
                button1text.color = 0xFF656565;
                button1text.borderColor = 0xFF656565;
            }
            else {
                dialogueButton1.color = 0xFFFFFFFF;
                button1text.color = 0xFF130022;
                button1text.borderColor = 0xFFFBF1FF;
            }
        case 2:
            dialogueButton2.alpha = 1;
            insert(2, dialogueButton2);
            insert(4, button2text);
            if (isDisabled[2] == true) {
                dialogueButton2.color = 0xFF656565;
                button2text.color = 0xFFCDCDCD;
                button2text.borderColor = 0xFFFBF1FF;
            }
            else {
                dialogueButton2.color = 0xFFFFFFFF;
                button2text.color = 0xFF130022;
                button2text.borderColor = 0xFFFBF1FF;
            }
        case 3:
            dialogueButton3.alpha = 1;
            insert(2, dialogueButton3);  
            insert(4, button3text);
            if (isDisabled[3] == true) {
                dialogueButton3.color = 0xFF656565;
                button3text.color = 0xFF656565;
                button3text.borderColor = 0xFF656565;
            }
            else {
                dialogueButton3.color = 0xFFFFFFFF;
                button3text.color = 0xFF130022;
                button3text.borderColor = 0xFFFBF1FF;
            }
        case 4:
            dialogueButton4.alpha = 1;
            insert(2, dialogueButton4);
            insert(4, button4text);
            if (isDisabled[4] == true) {
                dialogueButton4.color = 0xFF656565;
                button4text.color = 0xFF656565;
                button4text.borderColor = 0xFF656565;
            }
            else {
                dialogueButton4.color = 0xFFFFFFFF;
                button4text.color = 0xFF130022;
                button4text.borderColor = 0xFFFBF1FF;
            }
    }

}

function characterStatus(characters, whichCharacter) {

    if (whichCharacter == char1) {
        otherChar = char2;
        character1State = characters;
    }
    if (whichCharacter == char2) {
        otherChar = char1;
        character2State = characters;
    }

    switch (characters) {

        case "FLYIN":
            remove(whichCharacter);
            insert(members.indexOf(otherChar)+1, whichCharacter);
            whichCharacter.y = -900;
            whichCharacter.alpha = 1;
            whichCharacter.scale.set(1, 1);
            FlxTween.tween(whichCharacter, {y: 75}, 2);

        case "FLYOUT":
            FlxTween.tween(whichCharacter, {y: -900}, 2);
            new FlxTimer().start(2, function(timer) {
                alongTheDialogue += 1;
                sceneSystem(curScene);
            });

        case "APPEAR":
            remove(whichCharacter);
            insert(members.indexOf(otherChar)+1, whichCharacter);
            FlxTween.tween(whichCharacter, {y: 75}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter, {alpha: 1}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter.scale, {x: 1, y: 1}, 0.5, {ease:FlxEase.quartOut});

        case "UNAPPEAR":
            FlxTween.tween(whichCharacter, {y: 300}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter, {alpha: 0}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter.scale, {x: 0.6, y: 0.6}, 0.5, {ease:FlxEase.quartOut});

        case "PRIO":
            remove(whichCharacter);
            insert(members.indexOf(otherChar)+1, whichCharacter);
            FlxTween.tween(whichCharacter, {y: 75}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter, {alpha: 1}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter.scale, {x: 1, y: 1}, 0.5, {ease:FlxEase.quartOut});

        case "DEPRIO":
            FlxTween.tween(whichCharacter, {y: 75}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter, {alpha: 0.8}, 0.5, {ease:FlxEase.quartOut});
            FlxTween.tween(whichCharacter.scale, {x: 0.8, y: 0.8}, 0.5, {ease:FlxEase.quartOut});

        case "SIDELEFT":
            FlxTween.tween(whichCharacter, {x: 150}, 0.5, {ease:FlxEase.quintOut});

        case "SIDERIGHT":
            FlxTween.tween(whichCharacter, {x: 600}, 0.5, {ease:FlxEase.quintOut});

        case "MIDDLE":
            FlxTween.tween(whichCharacter, {x: 375}, 0.5, {ease:FlxEase.quintOut});

        case "CONCRETE":
            whichCharacter.x = -450;
            FlxG.sound.play(Paths.sound('Concrete'), 1);
            FlxTween.tween(whichCharacter, {x: 375}, 4.5);
            new FlxTimer().start(4.5, function(timer) {
                alongTheDialogue += 1;
                sceneSystem(curScene);
            });

        case "CONCRETEOUT":
            FlxG.sound.play(Paths.sound('Concrete'), 1);
            FlxTween.tween(whichCharacter, {x: -450}, 4.5);
            new FlxTimer().start(4.5, function(timer) {
                alongTheDialogue += 1;
                sceneSystem(curScene);
            });


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
        sceneSystem(curScene);
    });
}

function saveGame() {

    openSubState(new ModSubState("DATEFUNC/dateFileMenu"));

    // WHY DID I DO THIS LIKE THIS ????
    /*
    FlxG.save.data.datingDialogueFILE1 = alongTheDialogue;
    FlxG.save.data.datingChar1AssetFILE1 = char1var;
    FlxG.save.data.datingChar2AssetFILE1 = char2var;
    FlxG.save.data.datingChar1XFILE1 = char1.x;
    FlxG.save.data.datingChar2XFILE1 = char2.x;
    FlxG.save.data.nameFILE1 = playerName;
    FlxG.save.data.datingChar1StateFILE1 = character1State;
    FlxG.save.data.datingChar2StateFILE1 = character2State;
    FlxG.save.data.datingSceneFILE1 = curScene;
    FlxG.save.data.boxStateFILE1 = nameBoxState;
    FlxG.save.data.datingBackgroundFILE1 = ground;
    FlxG.save.data.showbarFILE1 = FlxG.save.data.showbar;
    FlxG.save.data.kathyBarFILE1 = FlxG.save.data.kathyBar;
    FlxG.save.data.mondayInteractionOrderFILE1 = FlxG.save.data.mondayInteractionOrder;
    FlxG.save.data.fileSceneNameFILE1 = fileSceneName;
    FlxG.save.data.curDayFILE1 = day;
    FlxG.save.data.energyFILE1 = energy;
    */

    FlxG.save.data.datingDialogue = alongTheDialogue;
    FlxG.save.data.datingChar1Asset = char1var;
    FlxG.save.data.datingChar2Asset = char2var;
    FlxG.save.data.datingChar1X = char1.x;
    FlxG.save.data.datingChar2X = char2.x;
    FlxG.save.data.name = playerName;
    FlxG.save.data.datingChar1State = character1State;
    FlxG.save.data.datingChar2State = character2State;
    FlxG.save.data.datingScene = curScene;
    FlxG.save.data.boxState = nameBoxState;
    FlxG.save.data.datingBackground = ground;
    FlxG.save.data.showbar = FlxG.save.data.showbar;
    FlxG.save.data.kathyBar = FlxG.save.data.kathyBar;
    FlxG.save.data.mondayInteractionOrder = FlxG.save.data.mondayInteractionOrder;
    FlxG.save.data.fileSceneName = fileSceneName;
    FlxG.save.data.curDay = day;
    FlxG.save.data.energy = energy;

}

function loadGame() {

    FlxG.save.data.noTransition = true;

    if (FlxG.save.data.datingDialogue != null) { 

        alongTheDialogue = FlxG.save.data.datingDialogue;
        playerName = FlxG.save.data.name;
        char1var = FlxG.save.data.datingChar1Asset;
        char2var = FlxG.save.data.datingChar2Asset;
        character1State = FlxG.save.data.datingChar1State;
        character2State = FlxG.save.data.datingChar2State;
        curScene = FlxG.save.data.datingScene;
        char1.x = FlxG.save.data.datingChar1X;
        char2.x = FlxG.save.data.datingChar2X;
        nameBoxState = FlxG.save.data.boxState;
        ground = FlxG.save.data.datingBackground;
        FlxG.save.data.showbar = FlxG.save.data.showbar;
        FlxG.save.data.kathyBar = FlxG.save.data.kathyBar;
        fileSceneName = FlxG.save.data.fileSceneName;
        day = FlxG.save.data.curDay;
        energy = FlxG.save.data.energy;

        gameLoaded = true;

        if (FlxG.save.data.showbar != null) {
            new FlxTimer().start(0.35, function(timer) {
                openSubState(new ModSubState("GAMES/DATEFUNC/dateMeter"));
            });
        }

        trace("SAVE FILE 1 LOADED SUCCESSFULLY!");
        trace("current room/scene: "+curScene);

        if (nameBoxState != "nameBoxDPEAR") {
            FlxTween.tween(dialogueTop, {y: 435}, 0.6, {ease: FlxEase.quartOut});
            FlxTween.tween(name, {y: 450}, 0.6, {ease: FlxEase.quartOut});
        }

        if (character1State != "UNAPPEAR") {
            FlxTween.tween(char1, {y: 75}, 0.5, {ease:FlxEase.quartOut});
            if (character1State != "DEPRIO") {
                FlxTween.tween(char1, {alpha: 1}, 0.5, {ease:FlxEase.quartOut});
                FlxTween.tween(char1.scale, {x: 1, y: 1}, 0.5, {ease:FlxEase.quartOut});
            }
        }

        if (character2State != "UNAPPEAR") {
            FlxTween.tween(char2, {y: 75}, 0.5, {ease:FlxEase.quartOut});
            if (character2State != "DEPRIO") {
                FlxTween.tween(char2, {alpha: 1}, 0.5, {ease:FlxEase.quartOut});
                FlxTween.tween(char2.scale, {x: 1, y: 1}, 0.5, {ease:FlxEase.quartOut});
            }
        }

        sceneSystem(curScene);
        characterStatus(character1State, char1);
        characterStatus(character2State, char2);
    }
    else {
        trace("SAVE FILE 1 FAILED TO LOAD, STARTING FROM BEGINNING");
    }

}

function buttonSpaghetti(whichButton, value, fade) {

    switch (whichButton) {

        case 1:
            for (shitToDo in [dialogueButton1, button1text]) {
                shitToDo.scale.x = 0.6;
                FlxTween.tween(shitToDo.scale, {x: 1}, 0.35, {ease:FlxEase.backOut});
            }

        case 2:
            for (shitToDo in [dialogueButton2, button2text]) {
                shitToDo.scale.x = 0.6;
                FlxTween.tween(shitToDo.scale, {x: 1}, 0.35, {ease:FlxEase.backOut});
            }

        case 3:
            for (shitToDo in [dialogueButton3, button3text]) {
                shitToDo.scale.x = 0.6;
                FlxTween.tween(shitToDo.scale, {x: 1}, 0.35, {ease:FlxEase.backOut});
            }

        case 4:
            for (shitToDo in [dialogueButton4, button4text]) {
                shitToDo.scale.x = 0.6;
                FlxTween.tween(shitToDo.scale, {x: 1}, 0.35, {ease:FlxEase.backOut});
            }

    }

    FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);        
    txtBro.paused = false;
    txtBro.alpha = 0.7;

    removeButtons();

    if (fade == false) {
        new FlxTimer().start(0.35, function(timer) {
            sceneDialogChange(value, false);
            txtBro.alpha = 1;
        });
    }
    else {
        new FlxTimer().start(0.35, function(timer) {
            transitionShit("switchLocation", value);
            txtBro.alpha = 1;
        }); 
    }

    exception = false;
    val1DoFade = false;
    val2DoFade = false;
    val3DoFade = false;
    val4DoFade = false;

}

/*
function stupidChecks(buttonPressed, varChange) {

    if (alongTheDialogue == 13) {
        readyForLove = varChange;
    }

    if (alongTheDialogue == 20 || alongTheDialogue == 23 && placeToBe == "hallway1") {

        if (buttonPressed != 1) {
            placeChosenFIRST = true;
        }
        
        if (buttonPressed == 2) {
            placeToBe = "hallway2";
        }
        else if (buttonPressed == 3) {
            var amIBrooklynCore = FlxG.random.int(0, 99);
            if (FlxG.save.data.imFromBrooklyn == true) {
                amIBrooklynCore = 0;
            }
            if (amIBrooklynCore > 0) {
                placeToBe = "class1";
            }
            else {
                placeToBe = "class1BROOKLYN";
            }
        }
        else if (buttonPressed == 4) {
            placeToBe = "class2";
        }
    }

    if (alongTheDialogue == 22 && placeToBe == "hallway2") {
        if (buttonPressed == 2) {
            if (yourMom == true) {
                if (beenHereBefore == true) {
                    beenHereBefore2 = true;
                }
                beenHereBefore = true;
            }
        }
        else if (buttonPressed == 3) {
            placeToBe = "JanitorCloset";
        }
        else if (buttonPressed == 4) {
            placeToBe = "Class3";
        }
    }

    if (alongTheDialogue == 24 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false) {
        if (buttonPressed == 2) {
            inShop = true;
            notTalkOrShop = false;
        }
        else if (buttonPressed == 3) {
            inTalk = true;
            notTalkOrShop = false;
        }
    }
}
*/