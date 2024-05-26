var yes = false;

function postCreate() {

    black = new FlxSprite().loadGraphic(Paths.image('black'));
	black.antialiasing = false;
	black.updateHitbox();
    black.scale.set(10, 10);
    black.alpha = 0;
	insert(900, black);

}

function update() {

    if (yes == true) {
        defaultCamZoom = camGame.zoom;
    }

}

function stepHit(curStep:Int) {

    switch (curStep) {
        case 16:
            FlxG.camera.flash(0xFFFFFFFF, 1); 
            defaultCamZoom = 1.3;
        case 266:
            defaultCamZoom = 1.7;
        case 272:
            defaultCamZoom = 1.3;
            FlxG.camera.flash(0xFFFFFFFF, 1); 
        case 392:
            defaultCamZoom = 1.7;
        case 400:
            defaultCamZoom = 1.3;
            FlxG.camera.flash(0xFFFFFFFF, 1); 
        case 650:
            defaultCamZoom = 1.7;
        case 656:
            defaultCamZoom = 1.3;
        case 780:
            FlxTween.tween(camHUD, {alpha: 0}, 4, {ease: FlxEase.quartOut});
            FlxTween.tween(camGame, {angle: 25, zoom: 0.8}, 20, {ease: FlxEase.quartOut});
            yes = true;
        case 860:
            FlxTween.tween(black, {alpha: 1}, 4, {ease: FlxEase.quartOut});
    }

}