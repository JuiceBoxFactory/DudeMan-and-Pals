import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import flixel.text.FlxTextBorderStyle;

var startingStep = PlayState.SONG.meta.appearStep;

function postCreate() {

	logo = new FlxSprite(345, -1200).loadGraphic(Paths.image('songLogos/'+PlayState.SONG.meta.name));
	logo.antialiasing = false;
	logo.scrollFactor.set(1, 1);
	logo.scale.set(1.2, 1.2);
	logo.alpha = 1;
	logo.cameras = [camHUD];
	logo.updateHitbox();
	insert(40, logo);

	openBox = new FlxSprite(325, 1200).loadGraphic(Paths.image('songOpening'));
	openBox.antialiasing = false;
	openBox.scrollFactor.set(1, 1);
    openBox.scale.set(0.8, 0.7);
	openBox.alpha = 1;
	openBox.cameras = [camHUD];
	openBox.updateHitbox();
	insert(41, openBox);

    tagLine = new FlxText(520, 0);
    tagLine.text = '"'+PlayState.SONG.meta.tagline+'"';
    tagLine.setFormat(Paths.font("COMIC.ttf"), 30, 0xFF190028, "center");
    tagLine.cameras = [camHUD];
    tagLine.antialiasing = false;
    insert(42, tagLine);

    singerNames = new FlxText(0, 0);
    singerNames.text = PlayState.SONG.meta.singerNames;
    singerNames.setFormat(Paths.font("COMIC.ttf"), 27, 0xFF190028, "center");
    singerNames.cameras = [camHUD];
    singerNames.antialiasing = false;
    insert(43, singerNames);

    actoresses = new FlxText(0, 0, 625);
    actoresses.text = PlayState.SONG.meta.actoresses2;
    actoresses.setFormat(Paths.font("COMIC.ttf"), 22, 0xFF190028, "center");
    actoresses.cameras = [camHUD];
    actoresses.antialiasing = false;
    insert(44, actoresses);

}

function anim(type) {
    switch (type) {

        case "appear":
            FlxTween.tween(logo, {y: 110}, 2, {ease:FlxEase.quartOut});	
            FlxTween.tween(openBox, {y: 570}, 2, {ease:FlxEase.quartOut});

        case "disappear":
            FlxTween.tween(logo, {y: -1200}, 2, {ease:FlxEase.quartIn});
            FlxTween.tween(openBox, {y: 1200}, 2, {ease:FlxEase.quartIn});
            new FlxTimer().start(3, function(timer) {
                logo.alpha = 0;
                openBox.alpha = 0;
            });	

    }

}

function update() {
    for (textY in [tagLine, singerNames, actoresses]) {
        textY.y = openBox.y;
    }
    singerNames.y += 40;
    actoresses.y += 70;

    for (textX in [tagLine, singerNames, actoresses]) {
        textX.screenCenter(FlxAxes.X);
    }
}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case startingStep:
            anim("appear");
            new FlxTimer().start(2.5, function(timer) {
                anim("disappear");
            });
    }
}