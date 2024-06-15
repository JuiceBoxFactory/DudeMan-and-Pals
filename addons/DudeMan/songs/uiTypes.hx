import flixel.text.FlxTextBorderStyle;
import sys.io.FileSystem;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.ui.FlxBar;
import flixel.FlxG;

var scared = false;
var myPpo = "";
var myOpp = "";
var startingStep = PlayState.SONG.meta.appearStep;
var curScore = 0;
var scoreToAdd = 0;
var addLerp = 0;
var lastComboAccuracy = 0;
var lastComboNoteAmount = 0;
var animationPlaying = false;
var noteRatingJustHit = "";
var finalTimeCalculated = false;
var finalTimeMinutes = 0;
var finalTimeSeconds = 0;
var comboSection = 0;
var songStarted = false;
var squishingTimeBar = false;

function postCreate() {

	myOpp = dad.getIcon();
	myPpo = boyfriend.getIcon();

	if (PlayState.SONG.meta.noteType == "serious") {
		remove(healthBar);
		remove(healthBarBG);
	}

	if (PlayState.SONG.meta.noteType != "base") {
		if (PlayState.SONG.meta.noteType != "BandW") {
			icon1 = new FlxSprite(605, 585).loadGraphic(Paths.image('icons/'+myPpo));
			icon1.antialiasing = false;
			icon1.flipX = true;
			icon1.cameras = [camHUD];
			icon1.updateHitbox();
			insert(4, icon1);

			icon2 = new FlxSprite(525, 585).loadGraphic(Paths.image('icons/'+myOpp));
			icon2.antialiasing = false;
			icon2.cameras = [camHUD];
			icon2.updateHitbox();
			insert(5, icon2);

			if (PlayState.SONG.meta.noteType == "serious") {
				insert(3, healthBar);
				insert(2, healthBarBG);
			}
		}
	}

	if (PlayState.SONG.meta.noteType == "normal") {

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
		tagLine.setFormat(Paths.font("COMIC.ttf"), 30, 0xFF010002, "center");
		tagLine.cameras = [camHUD];
		tagLine.antialiasing = false;
		insert(42, tagLine);
	
		singerNames = new FlxText(0, 0);
		singerNames.text = PlayState.SONG.meta.singerNames;
		singerNames.setFormat(Paths.font("COMIC.ttf"), 27, 0xFF010002, "center");
		singerNames.cameras = [camHUD];
		singerNames.antialiasing = false;
		insert(43, singerNames);
	
		actoresses = new FlxText(0, 0, 625);
		actoresses.text = PlayState.SONG.meta.actoresses2;
		actoresses.setFormat(Paths.font("COMIC.ttf"), 22, 0xFF010002, "center");
		actoresses.cameras = [camHUD];
		actoresses.antialiasing = false;
		insert(44, actoresses);

	}	

	if (PlayState.SONG.meta.noteType == "base") {
    	for (healthSex2 in [accuracyTxt, scoreTxt, missesTxt]) {
    	    healthSex2.alpha = 0;
    	}

    	healthBGBetter = new FlxSprite(0, 650).loadGraphic(Paths.image('dudeMyBalls'));
    	healthBGBetter.antialiasing = false;
    	healthBGBetter.cameras = [camHUD];
    	healthBGBetter.screenCenter(FlxAxes.X);
    	healthBGBetter.updateHitbox();
    	insert(15, healthBGBetter);

    	goFuckUrself = new FlxText(0, 700, 999, "wtf why do u see this");
    	goFuckUrself.setFormat(Paths.font("vcr.ttf"), 17, FlxColor.WHITE, "center");
    	goFuckUrself.cameras = [camHUD];
    	goFuckUrself.screenCenter(FlxAxes.X);
    	goFuckUrself.antialiasing = false;
    	insert(20, goFuckUrself);

    	for (healthSex in [healthBar, healthBarBG]) {
    	    healthSex.setGraphicSize(Std.int(healthBarBG.width * 1.38));
    	    healthSex.setGraphicSize(Std.int(healthBarBG.height * 5));
    	    healthSex.scale.set(1.41, 0.4);
    	    healthSex.y -= 7;
    	}

    	healthBarBG.alpha = 0;
		
	}

	if (PlayState.SONG.meta.noteType != "base") {
		remove(accuracyTxt);
		missesTxt.y += 10;
		scoreTxt.y += 10;
	}

	if (PlayState.SONG.meta.noteType != "base" && PlayState.SONG.meta.noteType != "serious") {

		myOpp = dad.getIcon();
		myPpo = boyfriend.getIcon();
	
		for (dumbShits in [iconP1, iconP2, healthBarBG, missesTxt, scoreTxt]) {
			remove(dumbShits);
		}
	}

	if (PlayState.SONG.meta.noteType == "normal") {	
	
		dudeRating = new FlxSprite(-300, -175);	
		dudeRating.antialiasing = false;
		dudeRating.cameras = [camHUD];
		dudeRating.frames = Paths.getSparrowAtlas('game/dudeRating');
		dudeRating.animation.addByPrefix('noneBro', 'imLegit', 12, false);
		dudeRating.animation.addByPrefix('erm', 'erm', 12, false);
		dudeRating.animation.addByPrefix('bad', 'bad', 12, false);
		dudeRating.animation.addByPrefix('good', 'good', 12, false);
		dudeRating.animation.addByPrefix('sick', 'sick', 12, false);
		dudeRating.animation.play('noneBro');
		dudeRating.updateHitbox();
		dudeRating.scale.set(1.5, 1.5);
		insert(1, dudeRating);

		remove(healthBar);
		insert(2, healthBar);
		healthBar.y = 640;

		healthheader = new FlxSprite(0, 590).loadGraphic(Paths.image('game/healthBarThing'));
		healthheader.antialiasing = false;
		healthheader.scale.set(1.9, 1.9);
		healthheader.cameras = [camHUD];
		healthheader.updateHitbox();
		healthheader.screenCenter(FlxAxes.X);
		insert(3, healthheader);

		accText = new FlxText();
		accText.setFormat(Paths.font("COMIC.ttf"), 15, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		accText.cameras = [camHUD];
		accText.borderSize = 1.25;
		accText.y = 680;
		accText.screenCenter(FlxAxes.X);
		accText.x -= 200; 
		accText.antialiasing = false;
		insert(4, accText);

		scoreText = new FlxText();
		scoreText.cameras = [camHUD];
		scoreText.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreText.borderSize = 2.25;
		scoreText.y = 65;
		scoreText.updateHitbox();
		scoreText.screenCenter(FlxAxes.X);
		scoreText.x -= 72;
		scoreText.antialiasing = false;
		insert(5, scoreText);

		scoreToAddText = new FlxText(610, 165);
		scoreToAddText.cameras = [camHUD];
		scoreToAddText.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreToAddText.borderSize = 1.25;
		scoreToAddText.antialiasing = false;
		insert(6, scoreToAddText);
	
		missesText = new FlxText();
		missesText.setFormat(Paths.font("COMIC.ttf"), 15, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		missesText.cameras = [camHUD];
		missesText.borderSize = 1.25;
		missesText.y = 680;
		missesText.screenCenter(FlxAxes.X);
		missesText.x += 75;
		missesText.antialiasing = false;
		insert(7, missesText);
	
		scoreAddedIn = new FlxTimer();
		scoreAddedIn.time = 2;
		scoreAddedIn.active = false;
		add(scoreAddedIn);

		healthBar.scale.set(0.998, 1.4);
		healthBar.y = 630;

		if (downscroll) {
			for (dumbShits in [healthBar, missesText, accText, icon1, icon2]) {
				dumbShits.y -= 15;
			}
			icon1.y -= 10;
			icon2.y -= 10;
			missesText.y -= 80;
			accText.y -= 80;
			remove(dudeRating);
			insert(60, dudeRating);
			dudeRating.y += 350;
			dudeRating.x += 0;

		}	
		
		if (PlayState.SONG.meta.name == "roomed") {
			for (healthBS in [missesText, accText, icon2, icon1, healthheader, healthBar]) {
				healthBS.alpha = 0;

				remove(dudeRating);
				insert(20, dudeRating);
			}
		}

	}

	if (PlayState.SONG.meta.noteType != "base") {	
		for (i in 0...4) {
			player.members[i].scale.set(2.2, 2.2);
			cpu.members[i].scale.set(2.2, 2.2);
			player.members[i].antialiasing = false;
			cpu.members[i].antialiasing = false;
		}
	}

	if (PlayState.SONG.meta.noteType == "BandW") {

		remove(healthBar);

		scoreText = new FlxText(30, 555);
		scoreText.cameras = [camHUD];
		scoreText.setFormat(Paths.font("Bahnschrift.ttf"), 35, FlxColor.WHITE, "center");
		scoreText.updateHitbox();
		scoreText.antialiasing = false;
		insert(6, scoreText);

		scoreToAddText = new FlxText(-140, 645, 500);
		scoreToAddText.cameras = [camHUD];
		scoreToAddText.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center");
		scoreToAddText.antialiasing = false;
		insert(8, scoreToAddText);

		back = new FlxSprite();
		back.makeGraphic(6000, 6000, FlxColor.WHITE);
		back.scrollFactor.set(0, 0);
		insert(1, back);

		bars = new FlxSprite(0, 0).loadGraphic(Paths.image('game/BWbars'));
    	bars.antialiasing = false;
    	bars.cameras = [camHUD];
    	bars.screenCenter(FlxAxes.X);
    	bars.updateHitbox();
    	insert(5, bars);

		scoreAddedIn = new FlxTimer();
		scoreAddedIn.time = 2;
		scoreAddedIn.active = false;
		add(scoreAddedIn);

		if (!FlxG.save.data.middlescroll) {
			for (i in playerStrums.members) {
				FlxTween.tween(i, {x: i.x - 323}, 0.001, {ease: FlxEase.smootherStepInOut});
			}       	
			for (i in cpuStrums.members) {
				FlxTween.tween(i, {x: i.x -923}, 0.001, {ease: FlxEase.smootherStepInOut}); 
			}	
		}

	}

}

function create() {

	if (PlayState.SONG.meta.noteType == null) {
		PlayState.SONG.meta.noteType = "normal";
	}

	trace("Current ui type is: "+PlayState.SONG.meta.noteType);

	if (PlayState.SONG.meta.noteType != "normal") {

		if (PlayState.SONG.meta.noteType != "BandW") {
			timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
			timeTxt.setFormat(Paths.font("COMIC.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			timeTxt.scrollFactor.set();
			timeTxt.alpha = 0;
			timeTxt.borderColor = 0xFF0F0014;
			timeTxt.color = 0xFFFBECFF;
			timeTxt.borderSize = 2;
			timeTxt.cameras = [camHUD];
			timeTxt.screenCenter(FlxAxes.X);
		}
		else {
			timeTxt = new FlxText(870, 32, 400, "X:XX // X:XX", 32);
			timeTxt.setFormat(Paths.font("Bahnschrift.ttf"), 32, FlxColor.WHITE, "right");
			timeTxt.scrollFactor.set();
			timeTxt.alpha = 0;
			timeTxt.color = 0xFFFFFFFF;
			timeTxt.cameras = [camHUD];
			timeTxt.borderSize = 2;
		}

    	timeBarBG = new FlxSprite();
    	timeBarBG.x = timeTxt.x;
    	timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    	timeBarBG.alpha = 0;
    	timeBarBG.scrollFactor.set();
    	timeBarBG.color = 0xFF0F0014;
    	timeBarBG.loadGraphic(Paths.image("TimeBar"));

    	timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    	timeBar.scrollFactor.set();
		if (PlayState.SONG.meta.noteType != "BandW") {
    		timeBar.createFilledBar(0xFF0F0014,dad.iconColor);
		}
		else {
			timeBar.x = 875;
			timeBar.y = 20;
			timeBar.scale.set(1, 1.5);
    		timeBar.createFilledBar(0xFFFFFFFF,0xFF000000);
		}
    	timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    	timeBar.alpha = 0;
    	timeBar.value = Conductor.songPosition / Conductor.songDuration;

        add(timeBarBG);
    	add(timeBar);
		add(timeTxt);

    	timeBarBG.x = timeBar.x - 4;
    	timeBarBG.y = timeBar.y - 4;

    	timeBar.cameras = [camHUD];
    	timeBarBG.cameras = [camHUD];
    	timeTxt.cameras = [camHUD];
	}

	if (PlayState.SONG.meta.noteType == "normal") {

		bar = new FlxSprite(540, 25).loadGraphic(Paths.image("game/timeBar/br"));
		bar.cameras = [camHUD];
		bar.scale.set(3, 1);
		add(bar);
		
		timeTxt = new FlxText(0, 13, 100, "X:XX", 32);
		timeTxt.setFormat(Paths.font("COMIC.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timeTxt.scrollFactor.set();
		timeTxt.alpha = 0;
		timeTxt.borderColor = 0xFF0F0014;
		timeTxt.color = 0xFFFFFFFF;
		timeTxt.borderSize = 2;
		timeTxt.cameras = [camHUD];
		timeTxt.screenCenter(FlxAxes.X);
		add(timeTxt);

		whoGettingBestHead = new FlxSprite(335, 15).loadGraphic(Paths.image("game/timeBar/bestHead"));
		whoGettingBestHead.cameras = [camHUD];
		add(whoGettingBestHead);

		bottom = new FlxSprite(915, 15).loadGraphic(Paths.image("game/timeBar/myMouthDoYouLikeIt"));
		bottom.cameras = [camHUD];
		add(bottom);

	}

}

function onSongStart() {

	songStarted = true;

	if (PlayState.SONG.meta.noteType != "normal") {	
    	if (timeBar != null) {
    	    FlxTween.tween(timeBar, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    	}
    	if (timeBarBG != null) {
    	    FlxTween.tween(timeBarBG, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    	}
	}

    if (timeTxt != null) {
    FlxTween.tween(timeTxt, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
}

function update(elapsed:Float) {

	if (PlayState.SONG.meta.name == "lighthouse") {
		if (curStep < 128) {
			icon1.alpha = 0;
		}
		else {
			icon1.alpha = 1;
		}
	}

	if (PlayState.SONG.meta.noteType == "BandW") {

		if (curScore < addLerp) {
			curScore += 200;
		}
		if (curScore > addLerp) {
			curScore = addLerp;
		}

		if (scoreToAdd > 0) {
			scoreToAddText.alpha = 1;
    	    scoreToAddText.text = "+"+scoreToAdd+"\n"+noteRatingJustHit;
    	}
		else {
			scoreToAddText.text = "+"+scoreToAdd+"\n"+noteRatingJustHit;
			scoreToAddText.alpha = 0;
		}

		if (scoreToAddText.scale.x > 1 && scoreToAddText.scale.y > 1) {
			scoreToAddText.scale.x -= 0.025;
			scoreToAddText.scale.y -= 0.025;
		}

	}

	if (PlayState.SONG.meta.noteType == "normal" || PlayState.SONG.meta.noteType == "BandW") {

		if (FlxG.save.data.language == 'english') {
			if (FlxG.save.data.dudeRating == true) {
				scoreText.text = ":Coolness:\n"+curScore;
			}
			else {
				scoreText.text = ":Coolness:\n"+songScore;
			}
		}

		if (FlxG.save.data.language == 'spanish') {
			if (FlxG.save.data.dudeRating == true) {
				scoreText.text = ":Frescura:\n"+curScore;
			}
			else {
				scoreText.text = ":Frescura:\n"+songScore;
			}
		}

	}

	if (PlayState.SONG.meta.noteType == "normal") {
		
		myOpp = dad.getIcon();
		icon2.loadGraphic(Paths.image('icons/'+myOpp));
		myPpo = boyfriend.getIcon();
		icon1.loadGraphic(Paths.image('icons/'+myPpo));

		if (FlxG.save.data.language == 'english') {

			accText.text = "Accuracy: "+CoolUtil.quantize(accuracy * 100, 100)+"%";
			missesText.text = "Bitches Fumbled: "+misses;

			if (accuracy == -1) {
    	    	accText.text = "Accuracy: idfk man";
    		}
		}

		if (FlxG.save.data.language == 'spanish') {

			accText.text = "Exactitud: "+CoolUtil.quantize(accuracy * 100, 100)+"%";
			missesText.text = "Perras Perdidas: "+misses;

			if (accuracy == -1) {
    	    	accText.text = "Exactitud: No sé hombre";
    		}
		}

		if (curScore < addLerp) {
			curScore += 200;
		}
		if (curScore > addLerp) {
			curScore = addLerp;
		}

		if (scoreToAdd > 0) {
			scoreToAddText.alpha = 1;
    	    scoreToAddText.text = "+"+scoreToAdd+"\n"+noteRatingJustHit;
    	}
		else {
			scoreToAddText.text = "+"+scoreToAdd+"\n"+noteRatingJustHit;
			scoreToAddText.alpha = 0;
		}

		scoreToAddText.screenCenter(FlxAxes.X);

		if (FlxG.save.data.dudeRating == true) {
			remove(comboGroup);
		}

		if (scoreToAddText.scale.x > 1 && scoreToAddText.scale.y > 1) {
			scoreToAddText.scale.x -= 0.025;
			scoreToAddText.scale.y -= 0.025;
		}

		if (FlxG.save.data.middlescroll == true) {
			scoreToAddText.x = 875;
			scoreToAddText.y = 75;
			scoreText.x = 250;
			if (FlxG.save.data.downscroll == true) {
				healthBar.y = 639.5;
			}
		}

	}

	if (PlayState.SONG.meta.noteType == "BandW") {
		remove(comboGroup);
	}

	if (PlayState.SONG.meta.noteType == "normal") {

		for (textY in [tagLine, singerNames, actoresses]) {
			textY.y = openBox.y;
		}
		singerNames.y += 40;
		actoresses.y += 70;
	
		for (textX in [tagLine, singerNames, actoresses]) {
			textX.screenCenter(FlxAxes.X);
		}

	}
	
	if (PlayState.SONG.meta.noteType == "base") {

		if (accuracy == -1) {
    	    accuracy = 0;
    	}

    	goFuckUrself.text = "Score: "+songScore+" | Misses: "+misses+" | accuracy:"+CoolUtil.quantize(accuracy * 100, 100)+"%";
    	goFuckUrself.screenCenter(FlxAxes.X);

	}

	
	if (PlayState.SONG.meta.noteType == "BandW") {
		timeBarBG.alpha = 0;
	}

    if (inst != null && timeTxt != null) {
		if (PlayState.SONG.meta.noteType != "normal") {	

			if (inst != null && timeBar != null && timeBar.max != inst.length) {
				timeBar.setRange(0, Math.max(1, inst.length));
			}

			if (PlayState.SONG.meta.noteType != "BandW") {
				var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
				var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
				var minutes = Std.int(timeRemaining / 60);
				timeTxt.text = minutes + ":" + seconds;
			}
			else {
				var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
				var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
				var minutes = Std.int(timeRemaining / 60);
				if (finalTimeCalculated == false && songStarted == true) {
					finalTimeSeconds = seconds;
					finalTimeMinutes = minutes;
					finalTimeCalculated = true;
				}
				timeTxt.text = minutes + ":" + seconds + " // " + finalTimeMinutes + ":" + finalTimeSeconds;
			}
		}
		else {
			var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
			var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
			var minutes = Std.int(timeRemaining / 60);
			if (finalTimeCalculated == false && songStarted == true) {
				FlxTween.tween(whoGettingBestHead, {x: 620}, timeRemaining);
				FlxTween.tween(bottom, {x: 633}, timeRemaining);
				FlxTween.tween(bar.scale, {x: 0.1}, timeRemaining);
				finalTimeCalculated = true;
			}
			timeTxt.text = minutes + ":" + seconds;
		}
	}
}

function beatHit() {

	if (PlayState.SONG.meta.noteType != "serious" && PlayState.SONG.meta.noteType != "base" && PlayState.SONG.meta.noteType != "BandW") {
		for (obj in [icon1, icon2]) {
			obj.scale.set(1.1, 1.1);
			FlxTween.tween(obj.scale, {x: 1}, 0.25);
			FlxTween.tween(obj.scale, {y: 1}, 0.25);
		}
	}

}

function postUpdate() {

	if (PlayState.SONG.meta.noteType == "normal") {

		if (whoGettingBestHead.overlaps(timeTxt) && squishingTimeBar == false) {
			squishingTimeBar = true;
			var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
			FlxTween.tween(timeTxt.scale, {x: 0.1}, timeRemaining);
		}
	
		if (animationPlaying == true) {
			if (dudeRating.animation.frameIndex == 32 || dudeRating.animation.frameIndex == 62 || dudeRating.animation.frameIndex == 91 || dudeRating.animation.frameIndex == 132) {
				animationPlaying = false;
			}
		}
	
		if (PlayState.SONG.meta.name == "roomed" && curStep == 1664) {
			scared = true;
		}
	
		if (PlayState.SONG.meta.name == "roomed" && curStep == 2434) {
			scared = false;
			for (numbers in [0, 1, 2, 3]) {
				playerStrums.members[numbers].y = 50;
			}
		}

		myOpp = dad.getIcon();
		myPpo = boyfriend.getIcon();
	}

	if (PlayState.SONG.meta.noteType == "serious") {
		icon1.x = iconP1.x;
		icon1.y = iconP1.y;
		icon2.x = iconP2.x;
		icon2.y = iconP2.y;

		myOpp = dad.getIcon();
		myPpo = boyfriend.getIcon();

		if (health < 0.5) {
			icon1.loadGraphic(Paths.image('icons/'+myPpo+'-losing'));
			icon2.loadGraphic(Paths.image('icons/'+myOpp));
			icon1.x = iconP1.x + FlxG.random.int(-1.5, 1.5);
			icon1.y = iconP1.y + FlxG.random.int(-1.5, 1.5);
		}
		else if (health > 1.5 && myOpp != 'shesnotthere') {
			icon1.loadGraphic(Paths.image('icons/'+myPpo));
			icon2.loadGraphic(Paths.image('icons/'+myOpp+'-losing'));
		}
		else {
			icon1.loadGraphic(Paths.image('icons/'+myPpo));
			icon2.loadGraphic(Paths.image('icons/'+myOpp));
		}
	}

}

function onNoteCreation(e) {

	if (PlayState.SONG.meta.noteType == "serious") {
    	e.noteSprite = "game/notes/Lighthouse";
	}

	if (PlayState.SONG.meta.noteType == "base") {
    	e.noteSprite = "game/notes/baseGame";
	}
	if (PlayState.SONG.meta.noteType == "BandW") {
    	e.noteSprite = "game/notes/BANDW";
	}

}

function onStrumCreation(e) {

	if (PlayState.SONG.meta.noteType == "serious") {
    	e.sprite = "game/notes/Lighthouse";
	}

	if (PlayState.SONG.meta.noteType == "base") {
    	e.sprite = "game/notes/baseGame";
	}

	if (PlayState.SONG.meta.noteType == "BandW") {
    	e.sprite = "game/notes/BANDW";
	}

}

function onPostNoteCreation(event) {

	if (PlayState.SONG.meta.noteType != "base") {	
		var note = event.note;
		
		if (FlxG.save.data.downscroll == true) {
			if (note.isSustainNote) {
				note.frameOffset.y -= note.frameHeight - 70;		
			}
		}
		else {
			if (note.isSustainNote) {
				note.frameOffset.y -= note.frameHeight / 3;		
			}
		}

		event.note.scale.set(2.2, 2.2);

		event.note.antialiasing = false;
	
	}

}

function onNoteHit(event) {
	if (event.showSplash) {
	  event.showSplash = false;
	  splashHandler.__grp = splashHandler.getSplashGroup(event.note.splash);
	  var splash = splashHandler.__grp.showOnStrum(event.note.__strum);
  	}
}

function onPlayerMiss() {

	if (PlayState.SONG.meta.noteType == "normal" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "BandW" && FlxG.save.data.dudeRating == true) {
		lastComboNoteAmount += 1;
		
		scoreToAdd -= 10;

		scoreAddedIn.cancel();
		scoreAddedIn.start(1, function(timer) {
			addLerp = addLerp + scoreToAdd;
			scoreToAdd = 0;
			if (animationPlaying == false) {	
				if (PlayState.SONG.meta.noteType == "normal") {
					comboRating();
				}
			}
		});
	}
	
}

function comboRating() {
	
	animationPlaying = true;

	var bad = lastComboNoteAmount / 1.5;
	var good = lastComboNoteAmount / 1.2;
	var amazing = lastComboNoteAmount;

	comboSection += 1;

	trace("\nstupid FUCKING section "+comboSection+" stats\nlastComboNoteAmount: "+lastComboNoteAmount+"\nlastComboAccuracy: "+lastComboAccuracy+"\nbad: "+bad+"\ngood: "+good+"\nsick: "+amazing);

	if (lastComboAccuracy == amazing) {
		dudeRating.animation.play('sick');
	}
	else if (lastComboAccuracy >= good) {
		dudeRating.animation.play('good');
	}
	else if (lastComboAccuracy >= bad) {
		dudeRating.animation.play('bad');
	}
	else if (lastComboAccuracy <= bad) {
		dudeRating.animation.play('erm');
	}

	lastComboAccuracy = 0;
	lastComboNoteAmount = 0;

}

function onPlayerHit(e){

	if (PlayState.SONG.meta.noteType == "normal" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "BandW" && FlxG.save.data.dudeRating == true) {

		noteRating = e.accuracy;
		scoreToAddText.scale.set(1.15, 1.15);

		if (e.accuracy > 0.75) {
			scoreToAdd += 350;
			lastComboAccuracy += 1;
			lastComboNoteAmount += 1;
			if (FlxG.save.data.language == "english") {
				noteRatingJustHit = "Sick!";
			}
			if (FlxG.save.data.language == "spanish") {
				noteRatingJustHit = "Enfermos!";
			}
		}
		else if (e.accuracy > 0.45) {
			scoreToAdd += 200;
			lastComboAccuracy += 0.75;
			lastComboNoteAmount += 1;
			if (FlxG.save.data.language == "english") {
				noteRatingJustHit = "Good";
			}
			if (FlxG.save.data.language == "spanish") {
				noteRatingJustHit = "Bien";
			}
		}
		else if (e.accuracy > 0.25) {
			scoreToAdd += 100;
			lastComboAccuracy += 0.45;
			lastComboNoteAmount += 1;
			if (FlxG.save.data.language == "english") {
				noteRatingJustHit = "Bad";
			}
			if (FlxG.save.data.language == "spanish") {
				noteRatingJustHit = "Malo";
			}
		}
		else if (e.accuracy > 0) {
			scoreToAdd += 50;
			lastComboAccuracy += 0.1;
			lastComboNoteAmount += 1;
			noteRatingJustHit = "Errmmm";
		}

		scoreAddedIn.cancel();
		scoreAddedIn.start(1, function(timer) {
			addLerp = addLerp + scoreToAdd;
			scoreToAdd = 0;
			if (animationPlaying == false) {	
				if (PlayState.SONG.meta.noteType == "normal") {
					comboRating();
				}
			}
		});
	}

	if (FlxG.save.data.notebounce == true && !player.cpu && scared == false) {
		if (PlayState.SONG.meta.noteType != "base" && PlayState.SONG.meta.noteType != "serious"&& PlayState.SONG.meta.noteType != "BandW") {
   			if (e.isSustainNote) return;
			   	if (downscroll) {
					playerStrums.members[e.direction].y -= 7;
				}
				if (!downscroll) {
					playerStrums.members[e.direction].y -= 15;
				}
        		FlxTween.tween(playerStrums.members[e.direction], {y: 50}, 0.35, {ease: FlxEase.quartIn});
		}
	}
}
function onDadHit(e){
	if (FlxG.save.data.notebounce == true && !player.cpu) {
		if (PlayState.SONG.meta.noteType != "base" && PlayState.SONG.meta.noteType != "serious") {
    		if (e.isSustainNote) return;
				if (downscroll) {
       	 			cpuStrums.members[e.direction].y -= 7;
				}
				if (!downscroll) {
					cpuStrums.members[e.direction].y -= 15;
				}
    		    FlxTween.tween(cpuStrums.members[e.direction], {y: 50}, 0.35, {ease: FlxEase.quartIn});
		}
	}
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

function stepHit(curStep:Int) { 
    	
	if (PlayState.SONG.meta.noteType == "normal") {	
		switch (curStep) {
    	    case startingStep:
        	    anim("appear");
        	    new FlxTimer().start(3, function(timer) {
            	    anim("disappear");
            	});
    	}
	}
}