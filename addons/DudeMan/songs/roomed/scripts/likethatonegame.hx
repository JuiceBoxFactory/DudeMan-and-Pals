import flixel.addons.display.FlxBackdrop;

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

    black = new FlxSprite().loadGraphic(Paths.image('black'));
	black.antialiasing = false;
	black.updateHitbox();
    black.scale.set(10, 10);
	insert(25, black);

    popUp = new FlxSprite(0, 900).loadGraphic(Paths.image('visuals/roomed/roomedPopUp'));
	popUp.antialiasing = false;
	popUp.updateHitbox();
    popUp.screenCenter(FlxAxes.X);
    popUp.cameras = [camHUD];
	add(popUp);

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

        }

}