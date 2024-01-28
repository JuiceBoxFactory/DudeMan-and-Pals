function create() {


	if (FlxG.save.data.horse) {
		horse = new FlxSprite(0, 0).loadGraphic(Paths.image('secretsettings/itsbeensolong'));
		horse.scrollFactor.set(0, 0);
		horse.scale.set(0.9, 0.9);
		horse.cameras = [camHUD];
		add(horse);
	}
}