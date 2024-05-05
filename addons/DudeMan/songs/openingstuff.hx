function create() {
  if (PlayState.SONG.meta.name != "roomed") {
    camHUD.zoom = 0;
    camHUD.alpha = 0;

	openingblack = new FlxSprite(-1000, -1000).loadGraphic(Paths.image('black'));
	openingblack.antialiasing = false;
	openingblack.scale.set(15, 15);
	openingblack.alpha = 1;
	openingblack.updateHitbox();
	insert(35, openingblack);
	}
}

function onCountdown(event) {
    if (event.swagCounter == 0) {
        FlxTween.tween(camHUD, {alpha: 1}, 1.5);
	    FlxTween.tween(openingblack, {alpha: 0}, 1.5);
	}
}