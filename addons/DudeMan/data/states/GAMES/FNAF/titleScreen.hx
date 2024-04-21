import funkin.menus.ModSwitchMenu;
import flixel.util.FlxTimer;
import flixel.ui.FlxButton;

var curCharacter:Int = 0;
var curCharacterGlitch:Int = 0;
var curLogoGlitch:Int = 0;
var characterTimer:Float = 0;
var logoTimer:Float = 0;
var modSwitchMenu:Bool = false;

function create(){
    window.title = "A Night with Dudeman and Pals";
    CoolUtil.playMusic(Paths.music('FNAF/DudeManFnafPlaceholder'));
    FlxG.mouse.visible = true;
    curCharacter = FlxG.random.int(0, 3);

    character = new FlxSprite();
    add(character);

    statiC = new FlxSprite();
	statiC.frames = Paths.getFrames('shh/FNAF/titleScreen/static');
	statiC.animation.addByPrefix('idle', 'idle');
	statiC.animation.play('idle');
	statiC.setGraphicSize(FlxG.width, FlxG.height);
    statiC.screenCenter();
    add(statiC);

    logo = new FlxSprite();
    add(logo);

    continuE = new FlxSprite();
	continuE.frames = Paths.getFrames('shh/FNAF/titleScreen/continue');
	continuE.updateHitbox();
    continuE.x = 875;
    continuE.y = 294;
    add(continuE);

    continueButton = new FlxButton(875, 294, "Gay", openShit);
    continueButton.scale.set(2,1);
    continueButton.updateHitbox();
    continueButton.alpha = 0.000000000001;
    add(continueButton);

    bgDark = new FlxSprite(0, 0).loadGraphic(Paths.image('black'));
	bgDark.scrollFactor.set(0, 0);
    bgDark.alpha = 0;
	add(bgDark);

    newspaper = new FlxSprite(0, 1000).loadGraphic(Paths.image('shh/FNAF/titleScreen/newspaper'));
	newspaper.scrollFactor.set(0, 0);
    newspaper.scale.set(1.75, 1.75);
    newspaper.screenCenter(FlxAxes.X);
	add(newspaper);

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

}

function openShit() {

    newspaper.angle = 360;
    FlxTween.tween(newspaper, {angle: 0}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(newspaper, {y: 205.5}, 2, {ease:FlxEase.quartOut});
    FlxTween.tween(bgDark, {alpha: 1}, 4, {ease:FlxEase.quartIn});
    FlxTween.tween(loadingText, {alpha: 1}, 4, {ease:FlxEase.quartIn});
    new FlxTimer().start(9, function(timer) {
        FlxTween.tween(dark, {alpha: 1}, 2, {ease:FlxEase.quartIn});
            new FlxTimer().start(3, function(timer) {
                FlxG.switchState(new ModState('GAMES/FNAF/nightShift'));
            });
    });
}

function update(elapsed:Float){
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
    if(characterTimer >= 5){
        curCharacterGlitch = FlxG.random.int(0, 3);
        if(curCharacterGlitch >= 1){
            new FlxTimer().start(0.1, function(){curCharacterGlitch = 0;});
        }
        characterTimer = 0;
    }
	character.setGraphicSize(FlxG.width, 1000);
    character.screenCenter();

    logoTimer += 0.1;
    if(curLogoGlitch == 0){
        logo.x = 310;
        logo.y = 650;
    }else if(curLogoGlitch == 1){
        logo.x = 110;
        logo.y = 655;
    }else if(curLogoGlitch == 2){
        logo.x = -91;
        logo.y = 660;
    }
    if(logoTimer >= 10){
        curLogoGlitch = FlxG.random.int(0, 2);
        if(curLogoGlitch >= 1){
            new FlxTimer().start(0.1, function(){curLogoGlitch = 0;});
        }
        logoTimer = 0;
    }
    logo.frames = Paths.getFrames('shh/FNAF/titleScreen/logo/'+curLogoGlitch);
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