import flixel.addons.display.FlxBackdrop;

function create() {

    closet = new FlxSprite(0, 0).loadGraphic(Paths.image('backdrop/roomed/Closet'));
	closet.antialiasing = false;
	closet.updateHitbox();
	insert(15, closet);

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
            FlxTween.tween(black, {alpha: 0}, 3);

        }

}