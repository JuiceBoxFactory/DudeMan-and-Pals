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
var val1 = false;
var val2 = false;
var val3 = false;
var val4 = false;
var nameBoxState = "";
var placeChosenFIRST = false;
var placeToBe = "hallway1";
var notTalkOrShop = true;
var inShop = false;
var inTalk = false;

// actual like progression shit:

var readyForLove = false;
var yourMom = false;
var beenHereBefore = false;
var beenHereBefore2 = false;
var neverTalkedToJanitor = true;


function create() {

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

    button1text = new FlxText(792, 122, 400);
    button1text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button1text.color = 0xFF130022;
    button1text.antialiasing = false;
    button1text.borderColor = 0xFFFBF1FF;
    button1text.borderSize = 3;
    button1text.cameras = [camHUD];

    button2text = new FlxText(792, 222, 400);
    button2text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button2text.color = 0xFF130022;
    button2text.antialiasing = false;
    button2text.borderColor = 0xFFFBF1FF;
    button2text.borderSize = 3;
    button2text.cameras = [camHUD];

    button3text = new FlxText(792, 322, 400);
    button3text.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    button3text.color = 0xFF130022;
    button3text.antialiasing = false;
    button3text.borderColor = 0xFFFBF1FF;
    button3text.borderSize = 3;
    button3text.cameras = [camHUD];

    button4text = new FlxText(792, 422, 400);
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

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);

    loadGame();

    if (gameLoaded == false) {    
        new FlxTimer().start(0.35, function(timer) {
            canDoShitDude = true;
            dialogueUpdateShit();
        });
    }

}

function dialogueUpdateShit() {

    // FINISH UR CODE MELTY
    
        if (alongTheDialogue == 0) {
            transitionShit("nameBoxPEAR", "");
            ground = 'thatSchoolThatIHate';
            char1var = 'dudeDating';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'DudeMan';
            txtBro.resetText("Hi there my GOOD FRIEND!");
            txtBro.start(0.03);
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
    
        if (alongTheDialogue == 13) {
            canDoShitDude = false;
            name.text = 'DudeMan';
            txtBro.resetText("Are you ready to take step into my.,,. school of love....?");
            txtBro.start(0.03);
            val3 = true;
            val4 = false;
            buttonText3Be("Yeah, Man !");
            buttonText4Be("No, dude.");
            buttonAdd(3);
            buttonAdd(4);
        }
    
        if (alongTheDialogue == 14 && readyForLove == false) {
            canDoShitDude = true;
            music.pause();
            name.text = 'DudeMan';
            txtBro.resetText("oh");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 15 && readyForLove == false) {
            FlxG.switchState(new ModState("GAMES/datingSimTitle"));
        }
    
        if (alongTheDialogue == 14 && readyForLove == true) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("oh yeah baby. this is happening. its just getting started.");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 15 && readyForLove == true) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("okay come with me then bestie");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 16) {
            canDoShitDude = false;
            transitionShit("switchLocation", "hallway1");
        }

        if (alongTheDialogue == 17) {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            characterStatus("APPEAR", char1);
            name.text = 'DudeMan';
            txtBro.resetText("my school");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 18) {
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'DudeMan';
            txtBro.resetText("im realizing that u actually have to meet people to FIND LOVE <3, so im going to let you do that\n\n\nAuf Wiedersehen, Kumpel! Ich hoffe, du kommst zugrunde!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 19) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("DudeMan climbs into a locker and vanishes, its up to you now, I guess!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 20) {
            canDoShitDude = false;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            placeToBe = "hallway1";
            val1 = true;
            val2 = true;
            val3 = true;
            val4 = true;
            buttonText1Be("yoiur moms ho use.");
            buttonText2Be("Keep going forwards");
            buttonText3Be("Class on the Left !");
            buttonText4Be("Class on the Right !");
            buttonAdd(1);
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            txtBro.resetText("Where would you like to go ?");
            txtBro.start(0.03);
        }

//      YOUR MOM

        if (alongTheDialogue == 21 && placeToBe == "hallway1" && beenHereBefore == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("haha you're SO FUCKING FUNNY MAN");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway1" && beenHereBefore == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("I HOPE U DIE BRO RRRAAAAH IM THE BURGER DEMON FUCK YOU");
            txtBro.start(0.03);
            yourMom = true;
        }

        if (alongTheDialogue == 21 && placeToBe == "hallway1" && beenHereBefore == true && beenHereBefore2 == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("dude are you fucking serious");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway1" && beenHereBefore == true && beenHereBefore2 == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("YOU'RE ABUSING A BUG TO ASK TO SEE MY MOM AGAIN ????");
            txtBro.start(0.03);
            yourMom = false;
        }
        
        if (alongTheDialogue == 23 && placeToBe == "hallway1" && yourMom == false && beenHereBefore == true) {
            canDoShitDude = true;
            alongTheDialogue = 22;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("FUCK YOU");
            txtBro.start(0.03);
            yourMom = true;
        }

        if (alongTheDialogue == 23 && yourMom == true && placeToBe == "hallway1") {
            canDoShitDude = false;
            alongTheDialogue = 20;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            placeToBe = "hallway1";
            val2 = true;
            val3 = true;
            val4 = true;
            buttonText2Be("Keep going forwards");
            buttonText3Be("Class on the Left !");
            buttonText4Be("Class on the Right !");
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            txtBro.resetText("Where would you like to go ?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 21 && placeToBe == "hallway1" && beenHereBefore2 == true) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("i hope you rot");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway1" && beenHereBefore2 == true) {
            Sys.exit();
        }

//      CLASS2

        if (alongTheDialogue == 21 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            transitionShit("screenFade", "");
            name.text = '';
            txtBro.resetText("You enter the classroom,");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 22 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            txtBro.resetText("It smells like,.. smellified autism.");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 23 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            ground = "Class2";
            txtBro.resetText("didnt know that was even possible");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 24 && placeToBe == "class2") {
            canDoShitDude = true;
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

        if (alongTheDialogue == 25 && placeToBe == "class2") {
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
       
//      CLASS1BROOKLYN

    if (alongTheDialogue == 21 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxDPEAR", "");
        transitionShit("screenFade", "");
        name.text = '';
        txtBro.resetText("You enter the classroom,");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 22 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxDPEAR", "");
        name.text = '';
        ground = "Class1";
        txtBro.resetText("It smells like,.. jobs?? tf that aint supposed to happen :sob:");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 23 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxPEAR", "");
        transitionShit("screenUnfade", "");
        char1var = 'BrooklynGuy';
        characterStatus("APPEAR", char1);
        name.text = 'Brooklyn Guy';
        txtBro.resetText("Oh boy I sure do LOVE my jobs class");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 24 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxPEAR", "");
        transitionShit("screenUnfade", "");
        char1var = 'BrooklynGuy';
        characterStatus("APPEAR", char1);
        name.text = 'Brooklyn Guy';
        txtBro.resetText("I love jobs :grin:");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 25 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'You';
        txtBro.resetText("HOLY CRAP LOUIS ITS BROOKLYN T. GUY");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 26 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'Brooklyn Guy';
        txtBro.resetText("Brooklyn T. Guy");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 27 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'You';
        txtBro.resetText("This fucking ROCKS.");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 28 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'Brooklyn Guy';
        txtBro.resetText("Well Brooklyn T. Guy. you did it again.");
        txtBro.start(0.03); 
    }

    if (alongTheDialogue == 29 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxDPEAR", "");
        transitionShit("screenFade", "");
        name.text = '';
        txtBro.resetText("you BLACK OUT lmao\n\nbut ur like awake now so yeah does a kissy face");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 30 && placeToBe == "class1BROOKLYN") {
        alongTheDialogue = 22;
        placeToBe = "class1";
    }
    

//      CLASS1

        if (alongTheDialogue == 21 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            transitionShit("screenFade", "");
            name.text = '';
            txtBro.resetText("You enter the classroom,");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            ground = "Class1";
            txtBro.resetText("It smells like,.. blood?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 23 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            transitionShit("screenUnfade", "");
            char1var = 'Kathy/Base';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("Oh boy I sure do LOVE my blood class");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 24 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Tired';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("...");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 25 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Tired';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("Who are you?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 26 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            char1var = 'Kathy/Tired';
            characterStatus("APPEAR", char1);
            name.text = '';
            txtBro.resetText("this dialogue doesnt exist you're seeing things");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 27 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            char1var = 'Kathy/Happy';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("oh, [NONEXISTENT NAME], thats a nice name");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 28 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Confused';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("how did you uh... get here?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 29 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Angry';
            characterStatus("APPEAR", char1);
            name.text = 'You';
            txtBro.resetText("The Door");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 30 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Angry';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("wow. you're so funny");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 31 && placeToBe == "class1") {
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

        if (alongTheDialogue == 32 && placeToBe == "class1") {
            canDoShitDude = true;
            name.text = 'DudeMan';
            characterStatus("SIDELEFT", char2);
            txtBro.resetText("wait");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 33 && placeToBe == "class1") {
            canDoShitDude = true;
            name.text = 'DudeMan';
            char1var = 'Kathy/oh';
            txtBro.resetText("Kathy why the FUCK do you look like that");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 34 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Kathy';
            txtBro.resetText("Cuz i can");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 35 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("KATHY");
            txtBro.start(0.03);
        }
               
        if (alongTheDialogue == 36 && placeToBe == "class1") {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("YOU'RE NOT SUPPOSED TO LOOK LIKE THAT");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 37 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Kathy';
            txtBro.resetText("Cuz i can");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 38 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("I HATE YOU");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 39 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Kathy';
            txtBro.resetText("No you dont");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 40 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("You're right");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 41 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("FLYOUT", char2);
            name.text = '';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 42 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            characterStatus("PRIO", char1);
            name.text = 'Kathy';
            txtBro.resetText("Good Riddance I hate that guy");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 43 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            characterStatus("PRIO", char1);
            name.text = 'Kathy';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

//      FORWARDS

        if (alongTheDialogue == 21 && placeToBe == "hallway2") {
            transitionShit("nameBoxDPEAR", "");
            canDoShitDude = false;
            transitionShit("switchLocation", "Hallway2");
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway2") {
            transitionShit("nameBoxDPEAR", "");
            canDoShitDude = true;
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            buttonText2Be("Nah bro take me back");
            buttonText3Be("Janitor's Closet");
            buttonText4Be("Class on the Right");
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            txtBro.resetText("Theres two doors you can go through");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 23 && placeToBe == "hallway2") {
            transitionShit("nameBoxDPEAR", "");
            alongTheDialogue = 19;
            transitionShit("switchLocation", "Hallway1");
        }

//      JANITORS CLOSET

        if (alongTheDialogue == 23 && placeToBe == "JanitorCloset") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            transitionShit("screenFade", "");
            name.text = '';
            txtBro.resetText("You enter the janitors closet,");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 24 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            txtBro.resetText("it smells of,.., windex");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 25 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            ground = 'JanitorCloset';
            txtBro.resetText("Who up washing my windows");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 26 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            canDoShitDude = true;
            transitionShit("screenUnfade", "");
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            txtBro.resetText("You may be the first person in this school to see what the janitors closet looks like, good for you!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 27 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 28 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 29 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("Well there, partner! this is for Janitors only!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 30 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            buttonText3Be("idfk");
            buttonText4Be("I like windex smell");
            buttonAdd(3);
            buttonAdd(4);
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("What're you doin here?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 31 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("thats fair");
            txtBro.start(0.03);
            neverTalkedToJanitor = false;
            alongTheDialogue = 23;
        }

        if (alongTheDialogue == 24 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false) {
            ground = 'JanitorCloset';
            transitionShit("screenUnfade", "");
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = false;
            characterStatus("APPEAR", char1);
            buttonText2Be("Yes!");
            buttonText3Be("Could we just talk?");
            buttonText4Be("No thanks, Man");
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("ya wanna view my wares, partner?");
            txtBro.start(0.03);
        } 

        if (alongTheDialogue == 25 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false && inTalk == true) {
            ground = 'JanitorCloset';
            char1var = 'jimoJanitor';
            canDoShitDude = false;
            characterStatus("APPEAR", char1);
            buttonText1Be("School Secrets?");
            buttonText2Be("Opinions on Ppl?");
            buttonText3Be("Supplier?");
            buttonText4Be("[More Options]");
            buttonAdd(1);
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("oh, alrigh, 'bout what?");
            txtBro.start(0.03);
        } 
        
        if (alongTheDialogue == 25 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false && notTalkOrShop == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("ok");
            txtBro.start(0.03);
        } 

        if (alongTheDialogue == 26 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false && notTalkOrShop == true) {
            transitionShit("nameBoxDPEAR", "");
            canDoShitDude = false;
            placeToBe = "hallway2";
            transitionShit("switchLocation", "Hallway2");
            alongTheDialogue = 21;
        } 


        if (FlxG.save.data.imFromBrooklyn == true) {
            char1var = "BrooklynGuy";
            char2var = "BrooklynGuy";
            name.text = 'Brooklyn Guy';
        }

        char1.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char1var));
        char2.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char2var));
        bg.loadGraphic(Paths.image('shh/DATINGSIM/background/'+ground));
    
    //        gotta remember how my own code works -mel
    //
    //        key.alpha = 0;
    //        buttonText3Be("Yeah, Man !");
    //        buttonText4Be("No, dude.");
    //        buttonAdd(3);
    //        buttonAdd(4);
    
}

function update() {

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

	if (FlxG.keys.justPressed.G) {
        FlxG.save.data.datingDialogueFILE1 = null;
    }

	if (controls.ACCEPT && canDoShitDude == true && inShop == false) {
        changeDialogue();
    }

	if (FlxG.keys.justPressed.H) {
		FlxG.switchState(new ModState("GAMES/datingSimTitle"));
	}

    if (dialogueButton1.alpha == 1 && inShop == false) {
        if (FlxG.mouse.overlaps(button1pos) && FlxG.mouse.justPressed) {
            buttonSpaghetti(1, val1);
        }
    }

    if (dialogueButton2.alpha == 1 && inShop == false) {
        if (FlxG.mouse.overlaps(button2pos) && FlxG.mouse.justPressed) {
            buttonSpaghetti(2, val2);
        }
    }

    if (dialogueButton3.alpha == 1 && inShop == false) {
        if (FlxG.mouse.overlaps(button3pos) && FlxG.mouse.justPressed) {
            buttonSpaghetti(3, val3);
        }
    }

    if (dialogueButton4.alpha == 1 && inShop == false) {
        if (FlxG.mouse.overlaps(button4pos) && FlxG.mouse.justPressed) {
            buttonSpaghetti(4, val4);
        }
    }

}

function transitionShit(type, locationToBe) {

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
                    ground = locationToBe;
                    bg.loadGraphic(Paths.image('shh/DATINGSIM/background/'+ground));
                    FlxTween.tween(darkness, {alpha: 0}, 1);
                    txtBro.resetText("");
                    transitionShit("nameBoxDPEAR", "");
                    txtBro.start(0.03);
                    name.text = "";
                    new FlxTimer().start(1, function(timer) {
                        changeDialogue();
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

    new FlxTimer().start(0.35, function(timer) {
            remove(dialogueButton1);
            remove(button1text);
            remove(dialogueButton2);
            remove(button2text);
            remove(dialogueButton3); 
            remove(button3text); 
            remove(dialogueButton4);
            remove(button4text);
    });
}

function buttonAdd(type) {

    switch (type) {

        case 1:
            insert(2, dialogueButton1);
            insert(4, button1text);
        case 2:
            insert(2, dialogueButton2);
            insert(4, button2text);
        case 3:
            insert(2, dialogueButton3);  
            insert(4, button3text);
        case 4:
            insert(2, dialogueButton4);
            insert(4, button4text);
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

    }

}

function changeDialogue() {
    char1.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char1var));
    char2.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char2var));
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

function saveGame() {

    FlxG.save.data.datingDialogueFILE1 = alongTheDialogue;
    FlxG.save.data.datingChar1AssetFILE1 = char1var;
    FlxG.save.data.datingChar2AssetFILE1 = char2var;
    FlxG.save.data.datingChar1XFILE1 = char1.x;
    FlxG.save.data.datingChar2XFILE1 = char2.x;
    FlxG.save.data.datingChar1StateFILE1 = character1State;
    FlxG.save.data.datingChar2StateFILE1 = character2State;
    FlxG.save.data.datingLocationFILE1 = ground;
    FlxG.save.data.boxStateFILE1 = nameBoxState;
    FlxG.save.data.placeToBeFILE1 = placeToBe;

    FlxG.save.data.readyForLoveFILE1 = readyForLove;

}

function loadGame() {

    FlxG.save.data.noTransition = true;

    if (FlxG.save.data.datingDialogueFILE1 != null) { 
        alongTheDialogue = FlxG.save.data.datingDialogueFILE1;
        char1var = FlxG.save.data.datingChar1AssetFILE1;
        char2var = FlxG.save.data.datingChar2AssetFILE1;
        character1State = FlxG.save.data.datingChar1StateFILE1;
        character2State = FlxG.save.data.datingChar2StateFILE1;
        ground = FlxG.save.data.datingLocationFILE1;
        char1.x = FlxG.save.data.datingChar1XFILE1;
        char2.x = FlxG.save.data.datingChar2XFILE1;
        readyForLove = FlxG.save.data.readyForLoveFILE1;
        nameBoxState = FlxG.save.data.boxStateFILE1;
        placeToBe = FlxG.save.data.placeToBeFILE1;
        gameLoaded = true;

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

        characterStatus(character1State, char1);
        characterStatus(character2State, char2);
        dialogueUpdateShit();
    }

}

function buttonSpaghetti(whichButton, value) {

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

    stupidChecks(whichButton, value);

    removeButtons();
    changeDialogue();

}

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