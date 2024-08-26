import funkin.menus.ModSwitchMenu;
import flixel.util.FlxTimer;
import flixel.ui.FlxButton;

var curCharacter:Int = 0;
var curCharacterGlitch:Int = 0;
var curLogoGlitch:Int = 0;
var characterTimer:Float = 0;
var logoTimer:Float = 0;
var modSwitchMenu:Bool = false;
var quitScreen = false;

function create(){

    window.title = "Dudeman's Emporium";
    CoolUtil.playMusic(Paths.music('FNAF/DudeManFnafPlaceholder'));
    FlxG.mouse.visible = true;
    curCharacter = FlxG.random.int(0, 3);

    character = new FlxSprite();
    add(character);

    sideShade = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/FNAF/titleScreen/sideShade'));
	sideShade.scrollFactor.set(0, 0);
	add(sideShade);

    statiC = new FlxSprite();
	statiC.frames = Paths.getFrames('shh/FNAF/titleScreen/static');
	statiC.animation.addByPrefix('idle', 'idle');
	statiC.animation.play('idle');
	statiC.setGraphicSize(FlxG.width, FlxG.height);
    statiC.screenCenter();
    add(statiC);

    title = new FlxText(650, 225, 600, "DUDEMAN'S EMPORIUM");
    title.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE, "center"); 
    title.color = 0xFFFFFFFF; 
    title.antialiasing = false;
    title.alpha = 1;
    add(title);

    options = new FlxText(650, 294, 600, "Play my Game\n\nPlay my game (Man Mode)\n\nQuit");
    options.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "center"); 
    options.color = 0xFFFFFFFF; 
    options.antialiasing = false;
    options.alpha = 1;
    add(options);

    selectIndicator = new FlxText(650, 294, 600);
    selectIndicator.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "center"); 
    selectIndicator.color = 0xFFFFFFFF; 
    selectIndicator.antialiasing = false;
    selectIndicator.alpha = 1;
    add(selectIndicator);

    continueButton = new FlxButton(840, 294, "Gay", openShit);
    continueButton.scale.set(3.1,1.5);
    continueButton.updateHitbox();
    continueButton.alpha = 0.000000000001;
    add(continueButton);

    hardButton = new FlxButton(745, 350, "Gay", openShit);
    hardButton.scale.set(5.1,1.5);
    hardButton.updateHitbox();
    hardButton.alpha = 0.000000000001;
    add(hardButton);

    quitButton = new FlxButton(905, 405, "Gay", quitThing);
    quitButton.scale.set(1,1.5);
    quitButton.updateHitbox();
    quitButton.alpha = 0.000000000001;
    add(quitButton);

    bgDark = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	bgDark.scrollFactor.set(0, 0);
    bgDark.alpha = 0;
	add(bgDark);

    newspaper = new FlxSprite(0, 1000).loadGraphic(Paths.image('shh/FNAF/titleScreen/newspaper'));
	newspaper.scrollFactor.set(0, 0);
    newspaper.scale.set(1.75, 1.75);
    newspaper.screenCenter(FlxAxes.X);
	add(newspaper);

    gameQuit = new FlxSprite(0, 1100).loadGraphic(Paths.image('shh/FNAF/titleScreen/quit'));
	gameQuit.scrollFactor.set(0, 0);
    gameQuit.scale.set(0.7, 0.7);
    gameQuit.screenCenter(FlxAxes.X);
	add(gameQuit);

    buttonsQuit = new FlxText(400, 1600, 800, "Okay, I'll keep playing          idc bye loser");
    buttonsQuit.setFormat(Paths.font("vcr.ttf"), 25, FlxColor.WHITE, "left"); 
    buttonsQuit.color = 0xFFFFFFFF; 
    buttonsQuit.antialiasing = false;
    buttonsQuit.screenCenter(FlxAxes.X);
    buttonsQuit.x += 25;
    add(buttonsQuit);

    quitQuitButton = new FlxButton(760, 595, "this one is quit bro", quitQuit);
    quitQuitButton.scale.set(2.5,2);
    quitQuitButton.updateHitbox();
    quitQuitButton.alpha = 0.000000000001;
    add(quitQuitButton);

    quitContinueButton = new FlxButton(255, 595, "Gay", quitClose);
    quitContinueButton.scale.set(4.5,2);
    quitContinueButton.updateHitbox();
    quitContinueButton.alpha = 0.000000000001;
    add(quitContinueButton);

    buttonsIndicator = new FlxText(400, 1600, 800);
    buttonsIndicator.setFormat(Paths.font("vcr.ttf"), 25, FlxColor.WHITE, "left"); 
    buttonsIndicator.color = 0xFFFFFFFF; 
    buttonsIndicator.antialiasing = false;
    buttonsIndicator.screenCenter(FlxAxes.X);
    buttonsIndicator.x += 25;
    add(buttonsIndicator);

    loadingText = new FlxText(10, 650, 600, "wait.. im loading!");
    loadingText.setFormat(Paths.font("Bahnschrift.ttf"), 50, FlxColor.WHITE, "left"); 
    loadingText.color = 0xFFFFFFFF; 
    loadingText.antialiasing = false;
    loadingText.alpha = 0;
    add(loadingText);

    dark = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	dark.scrollFactor.set(0, 0);
    dark.alpha = 0;
	add(dark);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    add(cursor);

}

function openShit() {

    newspaper.angle = 360;
    FlxTween.tween(newspaper, {angle: 5}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(newspaper, {y: 205.5}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(bgDark, {alpha: 1}, 4, {ease:FlxEase.quartIn});
    FlxTween.tween(loadingText, {alpha: 1}, 4, {ease:FlxEase.quartIn});
    new FlxTimer().start(9, function(timer) {
        FlxTween.tween(dark, {alpha: 1}, 2, {ease:FlxEase.quartIn});
            new FlxTimer().start(3, function(timer) {
                FlxG.switchState(new ModState('GAMES/FNAF/PhoneCall'));
            });
    });
}

function quitThing() {

    quitScreen = true;
    gameQuit.angle = 360;
    remove(continueButton);
    remove(hardButton);
    remove(quitButton);
    FlxTween.tween(gameQuit, {angle: 0}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(buttonsQuit, {y: 600}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(gameQuit, {y: -100}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(bgDark, {alpha: 0.7}, 2, {ease:FlxEase.quartIn});

}

function quitClose() {

    FlxTween.tween(gameQuit, {angle: 360}, 2, {ease:FlxEase.quartIn});
    FlxTween.tween(gameQuit, {y: 1100}, 2, {ease:FlxEase.quartIn});
    FlxTween.tween(buttonsQuit, {y: 1600}, 2, {ease:FlxEase.quartIn});
    FlxTween.tween(bgDark, {alpha: 0}, 2, {ease:FlxEase.quartOut});
    new FlxTimer().start(2, function(timer) {  
        quitScreen = false;
        add(continueButton);
        add(hardButton);
        add(quitButton);
    });

}

function quitQuit() {

	FlxG.sound.playMusic(Paths.music('datingSim/datingMySimulator'), 0, true);
    dark.alpha = 1;
    FlxG.sound.play(Paths.sound('fnaf/gunshot'), 0.7);
    FlxG.camera.flash(0xFFFFFFFF, 1);
        new FlxTimer().start(3, function(timer) {  
        FlxG.switchState(new ModState("GameSelector"));    
    });

}

function update(elapsed:Float){

    FlxG.mouse.visible = false;
    buttonsIndicator.y = buttonsQuit.y + 35;

// THANK YOU CORVA kiss emoji

    if (quitContinueButton.overlapsPoint(FlxPoint.get(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
        buttonsIndicator.text = "           ^                               ";
    }
    else if (quitQuitButton.overlapsPoint(FlxPoint.get(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
        buttonsIndicator.text = "                                       ^        ";
    }
    else {
        buttonsIndicator.text = "";
    }

    if (continueButton.overlapsPoint(FlxPoint.get(FlxG.mouse.screenX, FlxG.mouse.screenY), true) && quitScreen == false) {
        selectIndicator.text = ">>              <<\n\n\n\n";
    }
    else if (hardButton.overlapsPoint(FlxPoint.get(FlxG.mouse.screenX, FlxG.mouse.screenY), true) && quitScreen == false) {
        selectIndicator.text = "\n\n>>                          <<\n\n";
    }
    else if (quitButton.overlapsPoint(FlxPoint.get(FlxG.mouse.screenX, FlxG.mouse.screenY), true) && quitScreen == false) {
        selectIndicator.text = "\n\n\n\n>>      <<";
    }
    else {
        selectIndicator.text = "";
    }

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;
//    939 301

    if (controls.BACK) {
        FlxG.switchState(new ModState("GameSelector"));
    }
    characterTimer += 0.1;
    if(curCharacter == 0){
        character.frames = Paths.getFrames('shh/FNAF/titleScreen/dudeman/'+curCharacterGlitch);
    }else if(curCharacter == 1){
        character.frames = Paths.getFrames('shh/FNAF/titleScreen/fruity/'+curCharacterGlitch);
    }else if(curCharacter == 2){
        character.frames = Paths.getFrames('shh/FNAF/titleScreen/zee/'+curCharacterGlitch);
    }else if(curCharacter == 3){
        character.frames = Paths.getFrames('shh/FNAF/titleScreen/kathy/'+curCharacterGlitch);
    }else if(curCharacter == 4){
        character.frames = Paths.getFrames('shh/FNAF/titleScreen/MXsilly/'+curCharacterGlitch);
    }
    if(characterTimer >= 20){
        curCharacterGlitch = FlxG.random.int(0, 3);
        if(curCharacterGlitch >= 1){
            new FlxTimer().start(0.1, function(){curCharacterGlitch = 0;});
        }
        characterTimer = 0;
    }
    character.screenCenter();

    if(!modSwitchMenu){
    }else{
        if(controls.ACCEPT){
            selectItem();
        }else if(controls.BACK){
            closeSubState(new ModSwitchMenu());
            modSwitchMenu = false;
        }
        if(controls.UP_P){
            changeItem(-1);
        }else if(controls.DOWN_P){
            changeItem(1);
        }
    }
}    