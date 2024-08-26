import flixel.text.FlxTextBorderStyle;
import sys.io.FileSystem;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.ui.FlxBar;
import flixel.FlxG;
import flixel.math.FlxRect;

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
var logoY = 0;
var leftColor:Int = dad != null && dad.iconColor != null && Options.colorHealthBar ? dad.iconColor : (opponentMode ? 0xFF66FF33 : 0xFFFF0000);
var rightColor:Int = boyfriend != null && boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : (opponentMode ? 0xFFFF0000 : 0xFF66FF33); // switch the colors
var timeRemaining;
var scaredBoth = false;

function postCreate() {

	stupidCodenameEngineBullshit = new FlxSprite(-9000, 585).loadGraphic(Paths.image('icons/face'));
	stupidCodenameEngineBullshit.antialiasing = false;
	stupidCodenameEngineBullshit.flipX = true;
	stupidCodenameEngineBullshit.updateHitbox();
	stupidCodenameEngineBullshit.alpha = 1;
	add(stupidCodenameEngineBullshit);

	stupidCodenameEngineBullshit2 = new FlxSprite(0, -9000).loadGraphic(Paths.image('achievements/stickers/3'));
	stupidCodenameEngineBullshit2.antialiasing = false;
	stupidCodenameEngineBullshit2.flipX = true;
	stupidCodenameEngineBullshit2.updateHitbox();
	stupidCodenameEngineBullshit2.alpha = 0;
	stupidCodenameEngineBullshit2.scale.set(0, 1);
	add(stupidCodenameEngineBullshit2);

	myOpp = dad.getIcon();
	myPpo = boyfriend.getIcon();

	if (PlayState.SONG.meta.noteType == "serious") {
		remove(healthBarBG);

		healthBar.alpha = 0;

		remove(scoreTxt);
		remove(missesTxt);

		healthy1 = new FlxSprite(0, 618).loadGraphic(Paths.image('game/barShitFML'));	
		healthy1.antialiasing = false;
		healthy1.updateHitbox();
		healthy1.scale.set(1.9, 1.9);
		healthy1.screenCenter(FlxAxes.X);
		healthy1.cameras = [camHUD];
		healthy1.color = leftColor;
		insert(1, healthy1);

		healthy2 = new FlxSprite(0, 618).loadGraphic(Paths.image('game/barShitFML'));	
		healthy2.antialiasing = false;
		healthy2.updateHitbox();
		healthy2.scale.set(1.9, 1.9);
		healthy2.screenCenter(FlxAxes.X);
		healthy2.cameras = [camHUD];
		healthy2.color = rightColor;
		insert(2, healthy2);

		healthheader = new FlxSprite(0, 590).loadGraphic(Paths.image('game/healthBarThingSERIOUS'));
		healthheader.antialiasing = false;
		healthheader.scale.set(1.9, 1.9);
		healthheader.cameras = [camHUD];
		healthheader.updateHitbox();
		healthheader.screenCenter(FlxAxes.X);
		insert(3, healthheader);

		accText = new FlxText();
		accText.setFormat(Paths.font("Dubai-Medium.ttf"), 15, 0xFFFFFFFF, "left", FlxTextBorderStyle.OUTLINE, 0xFF000000);
		accText.cameras = [camHUD];
		accText.borderSize = 1.25;
		accText.y = 680;
		accText.screenCenter(FlxAxes.X);
		accText.x -= 200; 
		accText.antialiasing = false;
		insert(6, accText);

		scoreText = new FlxText();
		scoreText.cameras = [camHUD];
		scoreText.setFormat(Paths.font("Dubai-Medium.ttf"), 35, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
		scoreText.borderSize = 2.25;
		scoreText.y = 60;
		scoreText.updateHitbox();
		scoreText.screenCenter(FlxAxes.X);
		scoreText.x -= 55;
		scoreText.antialiasing = false;
		insert(7, scoreText);

		scoreToAddText = new FlxText(605, 165);
		scoreToAddText.cameras = [camHUD];
		scoreToAddText.setFormat(Paths.font("Dubai-Medium.ttf"), 20, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
		scoreToAddText.borderSize = 1.25;
		scoreToAddText.antialiasing = false;
		insert(8, scoreToAddText);
	
		missesText = new FlxText();
		missesText.setFormat(Paths.font("Dubai-Medium.ttf"), 15, 0xFFFFFFFF, "right", FlxTextBorderStyle.OUTLINE, 0xFF000000);
		missesText.cameras = [camHUD];
		missesText.borderSize = 1.25;
		missesText.y = 680;
		missesText.screenCenter(FlxAxes.X);
		missesText.x += 140;
		missesText.antialiasing = false;
		insert(9, missesText);
	
		scoreAddedIn = new FlxTimer();
		scoreAddedIn.time = 2;
		scoreAddedIn.active = false;
		add(scoreAddedIn);

		if (downscroll) {
			for (dumbShits in [healthBar, missesText, accText, icon1, icon2]) {
				dumbShits.y -= 15;
			}
			icon1.y -= 10;
			icon2.y -= 10;
			missesText.y -= 80;
			accText.y -= 80;

		}
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

			iconP1.alpha = 0;
			iconP2.alpha = 0;
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
		logo.screenCenter();
		insert(40, logo);

		logoY = logo.y;

		logo.y = -1200;
	
		openBox = new FlxSprite(325, 1200).loadGraphic(Paths.image('songOpening'));
		openBox.antialiasing = false;
		openBox.scrollFactor.set(1, 1);
		openBox.scale.set(0.8, 0.7);
		openBox.alpha = 1;
		openBox.cameras = [camHUD];
		openBox.updateHitbox();
		insert(41, openBox);
	
		if (PlayState.SONG.meta.name == "srs") {
			logo.alpha = 0;
		}

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
	
		for (dumbShits in [iconP1, iconP2, healthBarBG, missesTxt, scoreTxt]) {
			remove(dumbShits);
		}

	}

	if (PlayState.SONG.meta.noteType == "fruity") {	
	
		border = new FlxSprite(0, 0);	
		border.antialiasing = false;
		border.cameras = [camHUD];
		border.frames = Paths.getSparrowAtlas('game/fruity/fruityBorder');
		border.animation.addByPrefix('anim', 'sobored', 6, true);
		border.animation.play('anim');
		border.updateHitbox();
		insert(1, border);

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
		insert(2, dudeRating);

		healthBar.alpha = 0;

		healthy1 = new FlxSprite(0, 618).loadGraphic(Paths.image('game/barShitFML'));	
		healthy1.antialiasing = false;
		healthy1.updateHitbox();
		healthy1.scale.set(1.9, 1.9);
		healthy1.screenCenter(FlxAxes.X);
		healthy1.cameras = [camHUD];
		healthy1.color = leftColor;
		insert(3, healthy1);

		healthy2 = new FlxSprite(0, 618).loadGraphic(Paths.image('game/barShitFML'));	
		healthy2.antialiasing = false;
		healthy2.updateHitbox();
		healthy2.scale.set(1.9, 1.9);
		healthy2.screenCenter(FlxAxes.X);
		healthy2.cameras = [camHUD];
		healthy2.color = rightColor;
		insert(4, healthy2);

		healthheader = new FlxSprite(0, 590).loadGraphic(Paths.image('game/fruity/healthBarThing'));
		healthheader.antialiasing = false;
		healthheader.scale.set(1.9, 1.9);
		healthheader.cameras = [camHUD];
		healthheader.updateHitbox();
		healthheader.screenCenter(FlxAxes.X);
		insert(5, healthheader);

		accText = new FlxText();
		accText.setFormat(Paths.font("COMIC.ttf"), 15, 0xFFFFFFFF, "left", FlxTextBorderStyle.OUTLINE, 0xFF4C0000);
		accText.cameras = [camHUD];
		accText.borderSize = 1.25;
		accText.y = 680;
		accText.screenCenter(FlxAxes.X);
		accText.x -= 200; 
		accText.antialiasing = false;
		insert(6, accText);

		scoreText = new FlxText();
		scoreText.cameras = [camHUD];
		scoreText.setFormat(Paths.font("COMIC.ttf"), 35, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF4C0000);
		scoreText.borderSize = 2.25;
		scoreText.y = 65;
		scoreText.updateHitbox();
		scoreText.screenCenter(FlxAxes.X);
		scoreText.x -= 72;
		scoreText.antialiasing = false;
		insert(7, scoreText);

		scoreToAddText = new FlxText(610, 165);
		scoreToAddText.cameras = [camHUD];
		scoreToAddText.setFormat(Paths.font("COMIC.ttf"), 20, 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF4C0000);
		scoreToAddText.borderSize = 1.25;
		scoreToAddText.antialiasing = false;
		insert(8, scoreToAddText);
	
		missesText = new FlxText();
		missesText.setFormat(Paths.font("COMIC.ttf"), 15, 0xFFFFFFFF, "right", FlxTextBorderStyle.OUTLINE, 0xFF4C0000);
		missesText.cameras = [camHUD];
		missesText.borderSize = 1.25;
		missesText.y = 680;
		missesText.screenCenter(FlxAxes.X);
		missesText.x += 75;
		missesText.antialiasing = false;
		insert(9, missesText);
	
		scoreAddedIn = new FlxTimer();
		scoreAddedIn.time = 2;
		scoreAddedIn.active = false;
		add(scoreAddedIn);

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

		healthBar.alpha = 0;

		healthy1 = new FlxSprite(0, 618).loadGraphic(Paths.image('game/barShitFML'));	
		healthy1.antialiasing = false;
		healthy1.updateHitbox();
		healthy1.scale.set(1.9, 1.9);
		healthy1.screenCenter(FlxAxes.X);
		healthy1.cameras = [camHUD];
		healthy1.color = leftColor;
		insert(1, healthy1);

		healthy2 = new FlxSprite(0, 618).loadGraphic(Paths.image('game/barShitFML'));	
		healthy2.antialiasing = false;
		healthy2.updateHitbox();
		healthy2.scale.set(1.9, 1.9);
		healthy2.screenCenter(FlxAxes.X);
		healthy2.cameras = [camHUD];
		healthy2.color = rightColor;
		insert(2, healthy2);

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

		healthBar.alpha = 0;

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
		if (PlayState.SONG.meta.noteType != "fruity") {

		if (PlayState.SONG.meta.noteType != "BandW") {
			timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
			timeTxt.setFormat(Paths.font("Dubai-Medium.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			timeTxt.scrollFactor.set();
			timeTxt.alpha = 0;
			timeTxt.borderColor = 0xFF000000;
			timeTxt.color = 0xFFFFFFFF;
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

	if (PlayState.SONG.meta.noteType == "fruity") {

		bar = new FlxSprite(540, 45).loadGraphic(Paths.image("game/timeBar/fruity/br"));
		bar.cameras = [camHUD];
		bar.scale.set(3, 1);
		add(bar);
		
		timeTxt = new FlxText(395, 33, 100, "X:XX", 32);
		timeTxt.setFormat(Paths.font("COMIC.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timeTxt.scrollFactor.set();
		timeTxt.alpha = 1;
		timeTxt.borderColor = 0xFF4C0000;
		timeTxt.color = 0xFFFFFFFF;
		timeTxt.borderSize = 2;
		timeTxt.cameras = [camHUD];
		add(timeTxt);

		fruityFag = new FlxSprite(325, -20);
		fruityFag.antialiasing = false;
		fruityFag.cameras = [camHUD];
		fruityFag.frames = Paths.getSparrowAtlas("game/timeBar/fruity/timeBar");
		fruityFag.animation.addByPrefix('faggot', 'stupidFaggot', 12, true);
		fruityFag.animation.play('faggot');
		fruityFag.updateHitbox();
		add(fruityFag);

	}

}

function onSongStart() {

	songStarted = true;

	if (PlayState.SONG.meta.noteType != "normal" && PlayState.SONG.meta.noteType != "fruity" && PlayState.SONG.meta.noteType != "serious") {	
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

	if (PlayState.SONG.meta.noteType == "normal" || PlayState.SONG.meta.noteType == "BandW"  || PlayState.SONG.meta.noteType == "serious" || PlayState.SONG.meta.noteType == "fruity") {

		if (FlxG.save.data.language == 'english') {
			if (PlayState.SONG.meta.noteType == "serious") {
				if (FlxG.save.data.dudeRating == true) {
					scoreText.text = ":SCORE:\n"+curScore;
				}
				else {
					scoreText.text = ":SCORE:\n"+songScore;
				}
			}
			else {
				if (FlxG.save.data.dudeRating == true) {
					scoreText.text = ":Coolness:\n"+curScore;
				}
				else {
					scoreText.text = ":Coolness:\n"+songScore;
				}
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

	if (PlayState.SONG.meta.noteType == "normal" || PlayState.SONG.meta.noteType == "fruity" || PlayState.SONG.meta.noteType == "serious") {
		
		var sillyGooseling = (220 - ((health * 100) + (health * 10)));
		if (sillyGooseling < 0) {
			sillyGooseling = 0;
		}
		var playerClip = new FlxRect(sillyGooseling, 0, healthy2.frameWidth, healthy2.frameHeight);
		healthy2.clipRect = playerClip;

		myOpp = dad.getIcon();
		if (Assets.exists(Paths.image('icons/'+myOpp))) {
			icon2.loadGraphic(Paths.image('icons/'+myOpp));
		}
		else {
			icon2.loadGraphic(Paths.image('icons/face'));
		}
		if (Assets.exists(Paths.image('icons/'+myPpo))) {
			icon1.loadGraphic(Paths.image('icons/'+myPpo));
		}
		else {
			icon1.loadGraphic(Paths.image('icons/face'));
		}

		if (FlxG.save.data.language == 'english') {

			accText.text = "Accuracy: "+CoolUtil.quantize(accuracy * 100, 100)+"%";
			if (PlayState.SONG.meta.noteType != "serious") {
			missesText.text = "Bitches Fumbled: "+misses;
			}
			else {
			missesText.text = "Misses: "+misses;
			}

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
		if (PlayState.SONG.meta.noteType != "normal" && PlayState.SONG.meta.noteType != "fruity") {

			if (inst != null && timeBar != null && timeBar.max != inst.length) {
				timeBar.setRange(0, Math.max(1, inst.length));
			}

			if (PlayState.SONG.meta.noteType != "BandW") {
				timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
				var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
				var minutes = Std.int(timeRemaining / 60);
				timeTxt.text = minutes + ":" + seconds;
			}
			else {
				timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
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
			timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
			var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
			var minutes = Std.int(timeRemaining / 60);
			if (finalTimeCalculated == false && songStarted == true) {
				if (PlayState.SONG.meta.noteType == "normal") {
					FlxTween.tween(whoGettingBestHead, {x: 620}, timeRemaining);
					FlxTween.tween(bottom, {x: 633}, timeRemaining);
					FlxTween.tween(bar.scale, {x: 0.1}, timeRemaining);
				}
				if (PlayState.SONG.meta.noteType == "fruity") {
					FlxTween.tween(fruityFag, {x: 910}, timeRemaining);
					FlxTween.tween(timeTxt, {x: 980}, timeRemaining);
					FlxTween.tween(stupidCodenameEngineBullshit2.scale, {x: 196}, timeRemaining);
				}
				finalTimeCalculated = true;
			}
			timeTxt.text = minutes + ":" + seconds;
		}
	}

	if (PlayState.SONG.meta.noteType == "fruity") {
		var stupidShitVar = stupidCodenameEngineBullshit2.scale.x;
		var timeClip = new FlxRect(stupidShitVar, 0, bar.frameWidth, bar.frameHeight);
		bar.clipRect = timeClip;
	}

	healthBar.alpha = 0;
	iconP1.alpha = 0;
	iconP2.alpha = 0;

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

	if (PlayState.SONG.meta.noteType == "fruity") {
	
		if (animationPlaying == true) {
			if (dudeRating.animation.frameIndex == 32 || dudeRating.animation.frameIndex == 62 || dudeRating.animation.frameIndex == 91 || dudeRating.animation.frameIndex == 132) {
				animationPlaying = false;
			}
		}

		myOpp = dad.getIcon();
		myPpo = boyfriend.getIcon();
		
	}

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

	if (FlxG.save.data.scared == true) {
		scared = true;
	}
	else if (FlxG.save.data.scared == "trueBoth") {
		scaredBoth = true;
		scared = true;
	}
	else {
		scared = false;
		scaredBoth = false;
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
			if (PlayState.SONG.meta.name == "lighthouse") {
				icon1.x = iconP1.x + FlxG.random.int(-1.5, 1.5);
				icon1.y = iconP1.y + FlxG.random.int(-1.5, 1.5);
			}
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

	cpuStrums.notes.forEach(function(notes) notes.alpha = stupidCodenameEngineBullshit.alpha);

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

	if (PlayState.SONG.meta.noteType == "serious" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "fruity" && FlxG.save.data.dudeRating == true ||  PlayState.SONG.meta.noteType == "normal" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "BandW" && FlxG.save.data.dudeRating == true) {
		lastComboNoteAmount += 1;
		
		scoreToAdd -= 10;

		scoreAddedIn.cancel();
		scoreAddedIn.start(1, function(timer) {
			addLerp = addLerp + scoreToAdd;
			scoreToAdd = 0;
			if (animationPlaying == false) {	
				if (PlayState.SONG.meta.noteType == "normal" || PlayState.SONG.meta.noteType == "fruity") {
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

	if (PlayState.SONG.meta.noteType == "serious" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "normal" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "BandW" && FlxG.save.data.dudeRating == true || PlayState.SONG.meta.noteType == "fruity" && FlxG.save.data.dudeRating == true) {

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
				if (PlayState.SONG.meta.noteType == "normal" || PlayState.SONG.meta.noteType == "fruity") {
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
	if (FlxG.save.data.notebounce == true && !player.cpu && scaredBoth == false) {
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
            FlxTween.tween(logo, {y: logoY}, 2, {ease:FlxEase.quartOut});	
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


	if (PlayState.SONG.meta.name == "orangejuice") {

		var quickie = 1;

		switch (curStep) {
			
			case 496:
//				for (hudShit in [cpuStrums.members[0], cpuStrums.members[1], cpuStrums.members[2], cpuStrums.members[3], timeTxt, bar, whoGettingBestHead, bottom, icon1, icon2, healthBar, healthBarBG, healthBarThing, healthBGBetter, healthSex, healthSex2, scoreText, missesText, scoreToAddText]) {
					FlxTween.tween(cpuStrums.members[0], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(cpuStrums.members[1], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(cpuStrums.members[2], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(cpuStrums.members[3], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(camHUD, {alpha: 1}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(stupidCodenameEngineBullshit, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(timeTxt, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(bar, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(bottom, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(whoGettingBestHead, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(scoreText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(missesText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(healthheader, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(icon1, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(icon2, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(accText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
					FlxTween.tween(healthy1, {alpha: 0}, quickie, {ease: FlxEase.quartInOut});
					FlxTween.tween(healthy2, {alpha: 0}, quickie, {ease: FlxEase.quartInOut});
					FlxTween.tween(scoreToAddText, {y: -700}, quickie, {ease: FlxEase.quartOut});
//				}

		}
	}

	if (PlayState.SONG.meta.name == "die") {

		var quickie = 1;

		if (curStep < 760) {
			var quickie = 0.005;
		}

		switch (curStep) {
			
			case 0:
				FlxTween.tween(timeTxt, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bar, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bottom, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(whoGettingBestHead, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(scoreText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(missesText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(healthheader, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(icon1, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(icon2, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(accText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(healthy1, {alpha: 0}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy2, {alpha: 0}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreToAddText, {y: -700}, quickie, {ease: FlxEase.quartOut});

			case 262:
				FlxTween.tween(timeTxt, {alpha: 1}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bar, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(bottom, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(whoGettingBestHead, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(missesText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthheader, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(icon1, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(icon2, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(accText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy1, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy2, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreToAddText, {y: 165}, quickie, {ease: FlxEase.quartInOut});	
				
			case 760:
				FlxTween.tween(camHUD, {alpha: 1}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(stupidCodenameEngineBullshit, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(timeTxt, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bar, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bottom, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(whoGettingBestHead, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(scoreText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(missesText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(healthheader, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(icon1, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(icon2, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(accText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(healthy1, {alpha: 0}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy2, {alpha: 0}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreToAddText, {y: -700}, quickie, {ease: FlxEase.quartOut});

			case 1272:
				FlxTween.tween(stupidCodenameEngineBullshit, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(timeTxt, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(bar, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(bottom, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(whoGettingBestHead, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(missesText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthheader, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(icon1, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(icon2, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(accText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy1, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy2, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreToAddText, {y: 165}, quickie, {ease: FlxEase.quartInOut});	

		}
	}

	if (PlayState.SONG.meta.name == "colorful") {

		var quickie = 0.5;

		if (curStep < 128) {
			var quickie = 0.005;
		}

		switch (curStep) {
			
			case 0:
				for (gayfags in [bar, timeTxt, fruityFag, scoreText, missesText, healthheader, icon1, icon2, accText, healthy1, healthy2]) {
					gayfags.alpha = 0;
				}
				scoreToAddText.y = -700;
			case 4: 
				timeTxt.alpha = 0;
			case 128:
				FlxTween.tween(timeTxt, {alpha: 1}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bar, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(fruityFag, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(missesText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthheader, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(icon1, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(icon2, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(accText, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy1, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy2, {alpha: 1}, quickie, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreToAddText, {y: 165}, quickie, {ease: FlxEase.quartInOut});	

			case 832:
				var quickie = 6;
				FlxTween.tween(cpuStrums.members[0], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(cpuStrums.members[1], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(cpuStrums.members[2], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(cpuStrums.members[3], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(camHUD, {alpha: 1}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(stupidCodenameEngineBullshit, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(timeTxt, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(bar, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(fruityFag, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(scoreText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(missesText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(healthheader, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(icon1, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(icon2, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(accText, {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(healthy1, {alpha: 0}, 4, {ease: FlxEase.quartInOut});
				FlxTween.tween(healthy2, {alpha: 0}, 4, {ease: FlxEase.quartInOut});
				FlxTween.tween(scoreToAddText, {y: -700}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(dudeRating, {alpha: 0}, quickie, {ease: FlxEase.quartOut});

			case 896:
				var quickie = 4;
				FlxTween.tween(playerStrums.members[0], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(playerStrums.members[1], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(playerStrums.members[2], {alpha: 0}, quickie, {ease: FlxEase.quartOut});
				FlxTween.tween(playerStrums.members[3], {alpha: 0}, quickie, {ease: FlxEase.quartOut});

		}
	}


}