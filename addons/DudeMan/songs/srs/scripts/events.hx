
var introPlaying = true;

function create() {

    explosion = new FlxSprite(590, -300);	
    explosion.antialiasing = false;
    explosion.frames = Paths.getSparrowAtlas('explosion');
    explosion.animation.addByPrefix('explode', 'explode', 24, false);
    explosion.animation.play('explode');
    explosion.updateHitbox();
    explosion.scale.set(0.2, 0.2);
    insert(3, explosion);

    logo = new FlxSprite(835, -500).loadGraphic(Paths.image('songLogos/srs'));
    logo.antialiasing = false;
    logo.scrollFactor.set(1.1, 1.1);
    logo.scale.set(1.2, 1.2);
    logo.alpha = 1;
    logo.updateHitbox();
    add(logo);

    projectorScreen = new FlxSprite(830, 150);	
    projectorScreen.frames = Paths.getSparrowAtlas('visuals/srs/projectorScreen');
    projectorScreen.animation.addByPrefix('default', 'projectorScreen base', 6, false);
    projectorScreen.animation.addByPrefix('anim', 'projectorScreen fall', 24, false);
    projectorScreen.animation.play('default');
    projectorScreen.antialiasing = false;
    projectorScreen.alpha = 0;
    insert(4, projectorScreen);

	blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
    blackScreen.scrollFactor.set(0, 0);
    blackScreen.alpha = 1;
	add(blackScreen);

    presentation = new FlxSprite(830, 150).loadGraphic(Paths.image('visuals/srs/presentation'));
    presentation.antialiasing = false;
    presentation.alpha = 0;
    presentation.updateHitbox();
    add(presentation);

}

function update() {

    if (introPlaying == true) {
        camHUD.alpha = 0;
    }

}

function stepHit(curStep:Int) {

    switch (curStep) {

        case 0:
            FlxG.camera.followLerp = 0;
            camGame.scroll.x = 447;
            camGame.scroll.y = -500;
            FlxTween.tween(blackScreen, {alpha: 0}, 2, {ease:FlxEase.quartIn});

        case 26:
            introPlaying = false;
            FlxTween.tween(camGame.scroll, {y: 50}, 8, {ease:FlxEase.quartInOut});

        case 115:
            FlxTween.tween(camHUD, {alpha: 1}, 2, {ease:FlxEase.quartInOut});
            logo.alpha = 0;

        case 128:
            FlxG.camera.followLerp = 0.04;

        case 380:
            explosion.animation.play('explode');

        case 624:
            FlxTween.tween(projectorScreen, {alpha: 1}, 1, {ease:FlxEase.quartInOut});
            FlxG.camera.followLerp = 0;
            FlxTween.tween(camGame.scroll, {x: 447, y: 0}, 3, {ease:FlxEase.quartInOut});

        case 632:
            projectorScreen.animation.play('anim');

        case 640:
            FlxG.camera.flash(0xFF000000, 2);
            blackScreen.alpha = 0.4;
            presentation.alpha = 0.8;

    }

}