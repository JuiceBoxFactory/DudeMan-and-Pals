import flixel.FlxCamera;

var burgerMoveThing = false;

function create() {

    backdrop = new FlxSprite(0, 0);
    backdrop.antialiasing = false;
    backdrop.frames = Paths.getSparrowAtlas("backdrop/burgerking/whopperBG2");
    backdrop.animation.addByPrefix('boil', 'boil', 6, true);
    backdrop.animation.play('boil');
    backdrop.updateHitbox();
    backdrop.alpha = 0;
    insert(18, backdrop);

    seperator = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/burgerking/seperator'));
    seperator.antialiasing = false;
    seperator.updateHitbox();
    seperator.alpha = 0;
    insert(19, seperator);

	anty2 = new Character(0, 0, "BURGERanty2");
	anty2.flipX = false; 
	anty2.alpha = 0;
	insert(24, anty2);

	dude2 = new Character(0, 0, "BURGERdude2");
	dude2.flipX = false;
    dude2.isPlayer = true;
	dude2.alpha = 0;
	insert(20, dude2);

    dudeping = new Character(0, 0, "BURGERdudeping");
	dudeping.flipX = false;
    dudeping.isPlayer = true;
	dudeping.alpha = 0;
	insert(21, dudeping);

    bars = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/burgerking/barsidc'));
    bars.antialiasing = false;
    bars.updateHitbox();
    bars.alpha = 0;
    insert(25, bars);

    cover = new FlxSprite(0, 900).makeGraphic(1280, 900, 0xFF000000);
    cover.scrollFactor.set(0, 0);
    cover.cameras = [camHUD];
    add(cover);

    rotatingBurger = new FlxSprite(100, 450);
    rotatingBurger.antialiasing = false;
    rotatingBurger.frames = Paths.getSparrowAtlas("backdrop/burgerking/rotatingburger");
    rotatingBurger.animation.addByPrefix('rotate', 'rotate', 12, true);
    rotatingBurger.animation.play('rotate');
    rotatingBurger.updateHitbox();
    rotatingBurger.scale.set(0.7, 0.7);
    rotatingBurger.alpha = 0;
    add(rotatingBurger);

    rotatingBurger2 = new FlxSprite(800, 350);
    rotatingBurger2.antialiasing = false;
    rotatingBurger2.frames = Paths.getSparrowAtlas("backdrop/burgerking/rotatingburger");
    rotatingBurger2.animation.addByPrefix('rotate', 'rotate', 12, true);
    rotatingBurger2.animation.play('rotate');
    rotatingBurger2.updateHitbox();
    rotatingBurger2.scale.set(0.7, 0.7);
    rotatingBurger2.alpha = 0;
    add(rotatingBurger2);

    flyingBurger = new FlxSprite(450, 400);
    flyingBurger.antialiasing = false;
    flyingBurger.frames = Paths.getSparrowAtlas("backdrop/burgerking/flyingburger");
    flyingBurger.animation.addByPrefix('fly', 'fly', 12, true);
    flyingBurger.animation.play('fly');
    flyingBurger.updateHitbox();
    flyingBurger.scale.set(1.6, 1.6);
    flyingBurger.alpha = 0;
    add(flyingBurger);

    whopperCuts = new FlxSprite(0, 0);
    whopperCuts.antialiasing = false;
    whopperCuts.frames = Paths.getSparrowAtlas("backdrop/burgerking/whopperCuts");
    whopperCuts.animation.addByPrefix('0', '0', 12, false);
    whopperCuts.animation.addByPrefix('1', '1', 12, false);
    whopperCuts.animation.addByPrefix('2', '2', 12, false);
    whopperCuts.animation.addByPrefix('3', '3', 12, false);
    whopperCuts.animation.addByPrefix('4', '4', 12, false);
    whopperCuts.animation.addByPrefix('5', '5', 12, false);
    whopperCuts.animation.addByPrefix('6', '6', 12, false);
    whopperCuts.animation.addByPrefix('7', '7', 12, false);
    whopperCuts.animation.addByPrefix('8', '8', 12, false);
    whopperCuts.animation.addByPrefix('9', '9', 12, false);
    whopperCuts.animation.play('0');
    whopperCuts.updateHitbox();
    whopperCuts.alpha = 1;
    whopperCuts.cameras = [camHUD];
    insert(99, whopperCuts);

    ugh = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFFFFFFFF);
    ugh.scrollFactor.set(0, 0);
    ugh.alpha = 0;
    ugh.cameras = [camHUD];
    insert(100, ugh);

    camGame.alpha = 0;

}

function update() {

    if (burgerMoveThing == true) {
        for (burger in [rotatingBurger, rotatingBurger2]) {
            if (burger.x == 100) {
                FlxTween.tween(burger, {x: 800}, 1, {ease: FlxEase.smootherStepInOut});
            }
            if (burger.x == 800) {
                FlxTween.tween(burger, {x: 100}, 1, {ease: FlxEase.smootherStepInOut});
            }
        }
    }

}

function onPlayerHit(event) {
    dude2.playSingAnim(event.direction);
    dudeping.playSingAnim(event.direction);
}               
function onDadHit(event) {
    anty2.playSingAnim(event.direction);
}

function stepHit(curStep:Int) {
    switch (curStep) {
        case 0: 
        whopperCuts.animation.play('1');
        defaultCamZoom = 1.8;

        case 12:
        whopperCuts.animation.play('2');  
        
        case 16:
        whopperCuts.animation.play('3');  

        case 20:
        whopperCuts.animation.play('4');  

        case 24:
        whopperCuts.animation.play('5');  
        camGame.alpha = 1;
    
        case 28:
        whopperCuts.animation.play('6'); 
        FlxTween.tween(whopperCuts, {"scale.x": 1.5, "scale.y": 1.5}, 0.5, {ease: FlxEase.smootherStepInOut});
        FlxTween.tween(ugh, {alpha: 1}, 0.5, {ease: FlxEase.smootherStepInOut});

        case 32:
        whopperCuts.alpha = 0;
        FlxTween.tween(ugh, {alpha: 0}, 1, {ease: FlxEase.smootherStepInOut});    
        
        case 408:
        defaultCamZoom = 2.5;

        case 416:
        defaultCamZoom = 1.8;  
        burgerMoveThing = true;
        rotatingBurger.alpha = 1;
        rotatingBurger2.alpha = 1;
        flyingBurger.alpha = 1;

        case 528:
            for (burger in [rotatingBurger, rotatingBurger2, flyingBurger]) {
                FlxTween.tween(burger, {alpha: 0.4}, 0.5, {ease: FlxEase.smootherStepInOut});  
            }
            defaultCamZoom = 2.5;

        case 540:
            FlxTween.tween(cover, {y: -900}, 1.5, {ease: FlxEase.smootherStepInOut});

        case 546:
            defaultCamZoom = 1.8;
            anty2.alpha = 1;
            dude2.alpha = 1;
            backdrop.alpha = 1;
            bars.alpha = 1;
            seperator.alpha = 1;
            rotatingBurger.alpha = 0;
            rotatingBurger2.alpha = 0;
            flyingBurger.alpha = 0;

        case 800:
            dudeping.alpha = 1;

        case 864:
            whopperCuts.scale.set(1, 1);
            whopperCuts.alpha = 1;
            whopperCuts.animation.play('7');

        case 869:
            whopperCuts.animation.play('7');

        case 872:
            whopperCuts.animation.play('7');

        case 874:
            whopperCuts.animation.play('7');

        case 876:
            whopperCuts.animation.play('7');

        case 878:
            whopperCuts.animation.play('8');


        case 880:
            whopperCuts.alpha = 0;
            dudeping.alpha = 0;
            dude2.alpha = 0;
            anty2.alpha = 0;
            backdrop.alpha = 0;
            bars.alpha = 0;
            seperator.alpha = 0;
            whopperCuts.animation.play('9');

        case 1152:
            FlxTween.tween(whopperCuts, {alpha: 1}, 8, {ease: FlxEase.smootherStepInOut});

        case 1322:
            whopperCuts.scale.set(1.2,1.2);

        case 1327:
            camGame.alpha = 0;
            camHUD.alpha = 0;
        }
}