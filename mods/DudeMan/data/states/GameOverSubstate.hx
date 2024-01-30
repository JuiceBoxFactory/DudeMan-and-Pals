var deathCam = new FlxCamera();

function create() {

	cameras = [];

	FlxG.cameras.add(deathCam, false);

	deathQoutes = new FlxSprite(0, 0);
	deathQoutes.scrollFactor.set(0, 0);
	deathQoutes.loadGraphic(Paths.image('deathScreens/'+PlayState.SONG.meta.displayName));
	deathQoutes.cameras = [deathCam];
	add(deathQoutes);
}

function update() {

	character.alpha = 0;

}
