function create() {

  if (PlayState.SONG.meta.displayName != "roomed") {
    camHUD.zoom = 0;
    camHUD.alpha = 0;

	openingblack = new FlxSprite(-1000, -1000).loadGraphic(Paths.image('black'));
	openingblack.antialiasing = false;
	openingblack.scale.set(15, 15);
	openingblack.alpha = 1;
	openingblack.updateHitbox();
	insert(20, openingblack);
	}
}

function onCountdown(event) {
    if (event.swagCounter == 0) {
        FlxTween.tween(camHUD, {alpha: 1}, 4, {ease:FlxEase.quartOut});
    }
    if (event.swagCounter == 3) {
	    FlxTween.tween(openingblack, {alpha: 0}, 2, {ease:FlxEase.quartOut});
	}
}