import flixel.addons.display.FlxBackdrop;

var ninetyShake = false;
var ninetyDefaultX = 0;
var ninetyDefaultY = 0;
var endMessageSection = false;

function create() {

    closet = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/roomed/Closet'));
	closet.antialiasing = false;
	closet.updateHitbox();
	insert(15, closet);

    closetBG = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/cabBG'));
	closetBG.antialiasing = false;
    closetBG.alpha = 0;
	closetBG.updateHitbox();
	insert(10, closetBG);

    closetCover = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/locker'));
	closetCover.antialiasing = false;
    closetCover.alpha = 0;
	closetCover.updateHitbox();
	insert(15, closetCover);

    guitar = new FlxSprite(0, 1000).loadGraphic(Paths.image('visuals/roomed/itar'));
	guitar.antialiasing = false;
	guitar.updateHitbox();
    guitar.scrollFactor.set(-1.5, -1.5);
    guitar.screenCenter(FlxAxes.X);
	insert(16, guitar);

    normalCloset = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/roomed/normalCloset'));
	normalCloset.antialiasing = false;
	normalCloset.updateHitbox();
	insert(4, normalCloset);

    back2 = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/roomed/background2'));
	back2.antialiasing = false;
	back2.updateHitbox();
    back2.alpha = 0;
	insert(6, back2);

    fog = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/roomed/foggy'));
	fog.antialiasing = false;
	fog.updateHitbox();
    fog.alpha = 0;
	insert(15, fog);

    scroll = new FlxBackdrop(Paths.image('backdrop/roomed/scroll'));
	scroll.antialiasing = false;
	scroll.updateHitbox();
    scroll.moves = true;
	scroll.velocity.x = 10;
    scroll.active = true;
    scroll.alpha = 0;
	insert(16, scroll);

    endScene = new FlxSprite(0, 0);	
    endScene.frames = Paths.getSparrowAtlas('visuals/roomed/endScene');
    endScene.animation.addByPrefix('1', '1', 6);
    endScene.animation.addByPrefix('2', '2', 6);
    endScene.animation.addByPrefix('3', '3', 6);
    endScene.animation.addByPrefix('4', '4', 6);
    endScene.animation.addByPrefix('5', '5', 6);
    endScene.animation.play('1');
    endScene.antialiasing = false;
    endScene.alpha = 0;
    add(endScene);

    black = new FlxSprite().loadGraphic(Paths.image('black'));
	black.antialiasing = false;
	black.updateHitbox();
    black.scale.set(10, 10);
	insert(25, black);

    welcomeImage = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/welcomeBack'));
	welcomeImage.antialiasing = false;
	welcomeImage.updateHitbox();
    welcomeImage.scale.set(1.2, 1.2);
    welcomeImage.scrollFactor.set(0, 0);
    welcomeImage.screenCenter();
    welcomeImage.alpha = 0;
	insert(27, welcomeImage);

    red = new FlxSprite();
    red.makeGraphic(1920, 1080, FlxColor.RED);
    red.alpha = 0;
    red.scale.set(6, 6);
    red.screenCenter();
    insert(28, red);

    popUp = new FlxSprite(0, 900).loadGraphic(Paths.image('visuals/roomed/roomedPopUp'));
	popUp.antialiasing = false;
	popUp.updateHitbox();
    popUp.screenCenter(FlxAxes.X);
    popUp.cameras = [camHUD];
	insert(999, popUp);

    ANINETY = new FlxSprite(0, 0);	
    ANINETY.frames = Paths.getSparrowAtlas('visuals/roomed/A-90');
    ANINETY.animation.addByPrefix('default', 'base', 6, false);
    ANINETY.animation.addByPrefix('thejumps', 'jumpscare', 24, false);
    ANINETY.animation.play('default');
    ANINETY.antialiasing = false;
    ANINETY.alpha = 0;
    ANINETY.scale.set(0.6, 0.6);
    ANINETY.scrollFactor.set(0, 0);
    ANINETY.screenCenter();
    insert(31, ANINETY);

    stopSign = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/roomed/hand'));
	stopSign.antialiasing = false;
	stopSign.updateHitbox();
    stopSign.scale.set(0.3, 0.3);
    stopSign.scrollFactor.set(0, 0);
    stopSign.screenCenter();
    stopSign.alpha = 0;
	insert(30, stopSign);

}

function update() {

    if (ninetyShake == true) {
        ANINETY.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
        ANINETY.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);
    }

}

function beatHit() {

    if (endMessageSection == true) {
        FlxG.camera.zoom = defaultCamZoom;
    }

}

function stepHit(curStep:Int) {

    switch (curStep) {

        case 0:
            FlxTween.tween(popUp, {y: 100}, 2, {ease: FlxEase.quartOut});

        case 90:
            FlxTween.tween(black, {alpha: 0}, 4);
            FlxTween.tween(popUp, {y: 900}, 2, {ease: FlxEase.quartIn});

        case 384:
            black.alpha = 1;
            popUp.alpha = 0;

        case 496:
            FlxTween.tween(black, {alpha: 0}, 2);

        case 1568:
            FlxTween.tween(dad, {alpha: 0}, 4);

        case 1658:
            dad.alpha = 1;

        case 1664:
            FlxG.camera.flash(0xFFFFFFFF, 1);   
            scroll.alpha = 1;
            back2.alpha = 1;
            fog.alpha = 1;
            closet.alpha = 0;

        case 2432:
            FlxG.camera.flash(0xFFFFFFFF, 1);   
            scroll.alpha = 0;
            back2.alpha = 0;
            fog.alpha = 0;
            closet.alpha = 1;

        case 2440:
            FlxTween.tween(boyfriend, {x: -600}, 3);

        case 2482:
            normalCloset.alpha = 0;

        case 3040:
            FlxTween.tween(black, {alpha: 1}, 3);

        case 3120:
            boyfriend.alpha = 0;
            closet.alpha = 0;
            closetBG.alpha = 1;
            closetCover.alpha = 1;
            FlxTween.tween(black, {alpha: 0}, 3);

        case 3888:
            FlxTween.tween(guitar, {y: 400}, 2, {ease: FlxEase.quartOut});

        case 4210:
            FlxTween.tween(guitar, {y: 1000}, 2, {ease: FlxEase.quartIn});
            FlxTween.tween(camHUD, {alpha: 0}, 2, {ease: FlxEase.quartIn});

        case 4256:
            FlxG.camera.followLerp = 0;
            FlxTween.tween(dad, {y: 1000}, 2, {ease: FlxEase.quartIn});

        case 4288:
            FlxTween.tween(camGame.scroll, {y: 100}, 1.5, {ease:FlxEase.quartOut});
            camGame.scroll.x += -100;
            FlxG.camera.flash(0xFFFFFFFF, 1);
            endScene.alpha = 1; 

        case 4320:
            FlxG.camera.zoom += 0.5;
            endScene.animation.play('2');

        case 4331:
            var fuckingKillMe = camGame.scroll.x + 100;
            FlxTween.tween(camGame.scroll, {x: fuckingKillMe}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(camGame.scroll, {y: 0}, 2, {ease:FlxEase.quartOut});

        case 4352:
            FlxG.camera.zoom += 0.5;
            defaultCamZoom += 0.5;
            endScene.animation.play('3');

        case 4368:
            FlxG.camera.zoom += 0.5;
            defaultCamZoom += 0.5;
            endScene.animation.play('4');

        case 4384:
            FlxG.camera.zoom -= 1;
            defaultCamZoom -= 1;
            var killMe2 = camGame.scroll.y + -100;
            camGame.scroll.y += -90;
            FlxTween.tween(camGame.scroll, {y: killMe2}, 1.2, {ease:FlxEase.quartOut});
            endScene.animation.play('5');

        case 4400:
            var killMe3 = camGame.scroll.y + 150;
            FlxTween.tween(endScene.scale, {x: 0.9, y: 0.9}, 2, {ease:FlxEase.quartOut});
            FlxTween.tween(camGame.scroll, {y: killMe3}, 2, {ease:FlxEase.quartOut});

        case 4414:
            ninetyDefaultX = stopSign.x;
            ninetyDefaultY = stopSign.y;
            stopSign.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
            stopSign.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);
            stopSign.alpha = 1;
            FlxTween.tween(black, {alpha: 1}, 0.2, {ease:FlxEase.quartOut});
            FlxTween.tween(stopSign.scale, {x: 0.4, y: 0.4}, 1, {ease:FlxEase.quintOut});

        case 4415:
            stopSign.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
            stopSign.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);

        case 4416:
            stopSign.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
            stopSign.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);

        case 4417:
            stopSign.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
            stopSign.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);

        case 4418:
            stopSign.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
            stopSign.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);

        case 4419:
            stopSign.x = ninetyDefaultX + FlxG.random.int(-1.5, 1.5);
            stopSign.y = ninetyDefaultY + FlxG.random.int(-1.5, 1.5);

        case 4420:
            stopSign.x = ninetyDefaultX;
            stopSign.y = ninetyDefaultY;

        case 4424:
            ninetyDefaultX = ANINETY.x;
            ninetyDefaultY = ANINETY.y;
            FlxTween.tween(ANINETY, {alpha: 1}, 1.2, {ease:FlxEase.quartOut});
            stopSign.alpha = 0;

        case 4425:
            stopSign.alpha = 1;

        case 4426:
            stopSign.alpha = 0;
            
        case 4427:
            stopSign.alpha = 1;
            
        case 4428:
            stopSign.alpha = 0;
 
        case 4429:
            stopSign.alpha = 1;
 
        case 4430:
            stopSign.alpha = 0;

        case 4431:
            ninetyShake = true;
            red.alpha = 1;
            ANINETY.animation.play('thejumps');

        case 4433:
            red.alpha = 0;
    
        case 4434:
            red.alpha = 1;

        case 4435:
            red.alpha = 0;

        case 4436:
            red.alpha = 1;

        case 4437:
            red.alpha = 0;
    
        case 4438:
            red.alpha = 1;

        case 4439:
            red.alpha = 0;
        
        case 4440:
            red.alpha = 1;

        case 4441:
            red.alpha = 0;
            
        case 4442:
            red.alpha = 1;

        case 4443:
            red.alpha = 0;
            
        case 4444:
            welcomeImage.alpha = 1;
            red.alpha = 1;
            FlxTween.tween(red, {alpha: 0}, 3, {ease:FlxEase.quartOut});
            ANINETY.alpha = 0;
            defaultCamZoom = 1;
            FlxTween.tween(welcomeImage.scale, {x: 1, y: 1}, 2, {ease:FlxEase.quartIn});
            endMessageSection = true;

        case 4454:
            FlxTween.tween(welcomeImage.scale, {x: 0.8, y: 0.8}, 6, {ease:FlxEase.quartIn});

        case 4504:
            welcomeImage.alpha = 0;

        }

}