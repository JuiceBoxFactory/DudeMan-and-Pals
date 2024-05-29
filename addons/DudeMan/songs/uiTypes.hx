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

function postCreate() {

	myOpp = dad.getIcon();
	myPpo = boyfriend.getIcon();

	if (PlayState.SONG.meta.noteType == "serious") {
		remove(healthBar);
		remove(healthBarBG);
	}

	if (PlayState.SONG.meta.noteType != "base") {
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

	if (PlayState.SONG.meta.noteType == "normal") {

		if (PlayState.SONG.meta.noteType != "base" && PlayState.SONG.meta.noteType != "serious") {
			myOpp = dad.getIcon();
			myPpo = boyfriend.getIcon();
		
			for (dumbShits in [iconP1, iconP2, healthBarBG, missesTxt, scoreTxt]) {
				remove(dumbShits);
			}
		}	
	
		remove(healthBar);
		insert(2, healthBar);
		healthBar.y = 640;
		
		healthheader = new FlxSprite(0, 580).loadGraphic(Paths.image('game/healthBarPART2'));
		healthheader.antialiasing = false;
		healthheader.cameras = [camHUD];
		healthheader.screenCenter(FlxAxes.X);
		healthheader.updateHitbox();
		insert(3, healthheader);
	
		scoreText = new FlxText();
		scoreText.setFormat(Paths.font("COMIC.ttf"), 15, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreText.cameras = [camHUD];
		scoreText.borderSize = 1.25;
		scoreText.y = 680;
		scoreText.screenCenter(FlxAxes.X);
		scoreText.x -= 200; 
		scoreText.antialiasing = false;
		insert(6, scoreText);
	
		missesText = new FlxText();
		missesText.setFormat(Paths.font("COMIC.ttf"), 15, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		missesText.cameras = [camHUD];
		missesText.borderSize = 1.25;
		missesText.y = 680;
		missesText.screenCenter(FlxAxes.X);
		missesText.x += 75;
		missesText.antialiasing = false;
		insert(7, missesText);
	
		if (downscroll) {
				for (dumbShits in [healthBar, missesText, scoreText, icon1, icon2]) {
					dumbShits.y -= 15;
				}
				icon1.y -= 10;
				icon2.y -= 10;
				missesText.y -= 80;
				scoreText.y -= 80;
		}	
		
		if (PlayState.SONG.meta.name == "roomed") {
			for (healthBS in [missesText, scoreText, icon2, icon1, healthheader, healthBar]) {
				healthBS.alpha = 0;
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
}

function create() {

	if (PlayState.SONG.meta.noteType == null) {
		PlayState.SONG.meta.noteType = "normal";
	}

	timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("COMIC.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF0F0014;
    timeTxt.color = 0xFFFBECFF;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.color = 0xFF0F0014;
    timeBarBG.loadGraphic(Paths.image("TimeBar"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF0F0014,0xFFFBECFF);
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;

    if (PlayState.SONG.meta.noteType != "base") {
        add(timeBarBG);
        add(timeBar);
        add(timeTxt);
    }

    timeBarBG.x = timeBar.x - 4;
    timeBarBG.y = timeBar.y - 4;

    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];

}

function onSongStart() {
    if (timeBar != null) {
        FlxTween.tween(timeBar, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeBarBG != null) {
        FlxTween.tween(timeBarBG, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
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

	if (PlayState.SONG.meta.noteType != "serious" && PlayState.SONG.meta.noteType != "base") {
		myOpp = dad.getIcon();
		icon2.loadGraphic(Paths.image('icons/'+myOpp));
		myPpo = boyfriend.getIcon();
		icon1.loadGraphic(Paths.image('icons/'+myPpo));

		scoreText.text = "Coolness: "+songScore;
		missesText.text = "Bitches Fumbled: "+misses;
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

    if (inst != null && timeBar != null && timeBar.max != inst.length) {
        timeBar.setRange(0, Math.max(1, inst.length));
    }

    if (inst != null && timeTxt != null) {
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
        var minutes = Std.int(timeRemaining / 60);
        timeTxt.text = minutes + ":" + seconds;
    }
}

function beatHit() {

	if (PlayState.SONG.meta.noteType != "serious" && PlayState.SONG.meta.noteType != "base") {
		for (obj in [icon1, icon2]) {
			obj.scale.set(1.1, 1.1);
			FlxTween.tween(obj.scale, {x: 1}, 0.25);
			FlxTween.tween(obj.scale, {y: 1}, 0.25);
		}
	}

}

function postUpdate() {

	if (PlayState.SONG.meta.name == "roomed" && curStep == 1664) {
		scared = true;
	}

	if (PlayState.SONG.meta.name == "roomed" && curStep == 2434) {
		scared = false;
		for (numbers in [0, 1, 2, 3]) {
			playerStrums.members[numbers].y = 50;
		}
	}

	if (PlayState.SONG.meta.noteType == "normal") {
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

}

function onStrumCreation(e) {

	if (PlayState.SONG.meta.noteType == "serious") {
    	e.sprite = "game/notes/Lighthouse";
	}

	if (PlayState.SONG.meta.noteType == "base") {
    	e.sprite = "game/notes/baseGame";
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

function onPlayerHit(e){

	if (FlxG.save.data.notebounce == true && !player.cpu && scared == false) {
		if (PlayState.SONG.meta.noteType != "base" && PlayState.SONG.meta.noteType != "serious") {
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