import funkin.menus.ModSwitchMenu;
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
} 