import funkin.utils.CoolUtil;
import flixel.util.FlxSpriteUtil;

import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

var timeBarBG:FlxSprite;
var timeBar:FlxBar;
var timeTxt:FlxText;
var hudTxt:FlxText;
var hudTxtTween:FlxTween;
var accTxt:FlxText;
var missessTxt:FlxText;

var ratingFC:String = "FC";
var ratingStuff:Array<Dynamic> = [
    ['You Suck!', 0.2], //From 0% to 19%
    ['Shit', 0.4], //From 20% to 39%
    ['Bad', 0.5], //From 40% to 49%
    ['Bruh', 0.6], //From 50% to 59%
    ['Meh', 0.69], //From 60% to 68%
    ['Nice', 0.7], //69%
    ['Good', 0.8], //From 70% to 79%
    ['Great', 0.9], //From 80% to 89%
    ['Sick!', 1], //From 90% to 99%
    ['Perfect!!', 1] //The value on this one isn't used actually, since Perfect is always "1"
];


var lapsfx:FlxSound;
var isLap2:Bool = false;
var lap2:FlxSprite;
var available:FlxSprite;

var tv:FlxSprite = null;
var timer:Int = 0;

var barFill:FlxSprite = null;
var funnyHud:FlxText = null;
var noteStuff1;
var noteStuff2;

var noteNum:Int = 0;

function getRating(accuracy:Float):String {
    if (accuracy < 0) {
        return "?";
    }
    for (rating in ratingStuff) {
        if (accuracy < rating[1]) {
            return rating[0];
        }
    }
    return ratingStuff[ratingStuff.length - 1][0];
}

function getRatingFC(accuracy:Float, misses:Int):String {
    // this sucks but idk how to make it better lol
    if (misses == 0) {
        if (accuracy == 1.0) ratingFC = "SFC";
        else if (accuracy >= 0.99) ratingFC = "GFC";
        else ratingFC = "FC";
    }
    if (misses > 0) {
        if (misses < 10) ratingFC = "SDCB";
        else if (misses >= 10) ratingFC = "Clear";
    }
}

function create() {
    timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("Pepperoni-Regular.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF000000;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);

	pizza = new FlxSprite(35, 525).loadGraphic(Paths.image("pizza"));
	pizza.antialiasing = false;
	pizza.scale.x = pizza.scale.y = 1.25;
	pizza.camera = camHUD;
	add(pizza);

	rankD = new FlxSprite(300, 525).loadGraphic(Paths.image("ranks/D"));
	rankD.antialiasing = false;
	rankD.scale.x = rankD.scale.y = 1.25;
	rankD.camera = camHUD;
	add(rankD);

	rankC = new FlxSprite(300, 525).loadGraphic(Paths.image("ranks/C"));
	rankC.antialiasing = false;
	rankC.scale.x = rankC.scale.y = 1.25;
	rankC.camera = camHUD;
	add(rankC);

	rankB = new FlxSprite(300, 525).loadGraphic(Paths.image("ranks/B"));
	rankB.antialiasing = false;
	rankB.scale.x = rankB.scale.y = 1.25;
	rankB.camera = camHUD;
	add(rankB);

	rankA = new FlxSprite(300, 525).loadGraphic(Paths.image("ranks/A"));
	rankA.antialiasing = false;
	rankA.scale.x = rankA.scale.y = 1.25;
	rankA.camera = camHUD;
	add(rankA);

	rankS = new FlxSprite(300, 525).loadGraphic(Paths.image("ranks/S"));
	rankS.antialiasing = false;
	rankS.scale.x = rankS.scale.y = 1.25;
	rankS.camera = camHUD;
	add(rankS);

	rankP = new FlxSprite(300, 525).loadGraphic(Paths.image("ranks/P"));
	rankP.antialiasing = false;
	rankP.scale.x = rankP.scale.y = 1.25;
	rankP.camera = camHUD;
	add(rankP);

    hudTxt = new FlxText(0, 685, FlxG.width, "0");
    hudTxt.setFormat(Paths.font("Pepperoni-Regular.ttf"), 50, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hudTxt.borderSize = 1.25;
    hudTxt.antialiasing = false;
    hudTxt.screenCenter(FlxAxes.X);

    accTxt = new FlxText(-308, 500, FlxG.width, "0");
    accTxt.setFormat(Paths.font("Pepperoni-Regular.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    accTxt.borderSize = 1.25;
    accTxt.antialiasing = false;
    accTxt.camera = camHUD;

    missessTxt = new FlxText(0, 575, FlxG.width, "0");
    missessTxt.setFormat(Paths.font("Pepperoni-Regular.ttf"), 50, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    missessTxt.borderSize = 1.25;
    missessTxt.antialiasing = false;
    missessTxt.camera = camHUD;

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x + 50;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4) - 12.5;
    timeBarBG.scale.x = timeBarBG.scale.y *= 1.25;
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.loadGraphic(Paths.image("bar"));

    var timeBarFill = new FlxSprite(timeTxt.x + 50, timeTxt.y + (timeTxt.height / 4) - 10);
    timeBarFill.scale.x = timeBarBG.scale.y = 1.21;
    timeBarFill.alpha = 0;
    timeBarFill.scrollFactor.set();
    timeBarFill.loadGraphic(Paths.image("barfill"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0x00000000,0xFFFFFFFF);
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    timeBar.scale.x = timeBar.scale.y *= 1.25;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;

    add(timeBarFill);
    add(timeBar);
    add(timeBarBG);
    add(timeTxt);
    add(hudTxt);
    add(accTxt);
    add(missessTxt);
    hudTxt.x -= 500;
    hudTxt.y -= 125;

    timeBarBG.x = timeBar.x;
    timeBarBG.y = timeBar.y;

    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeBarFill.cameras = [camHUD];
    timeTxt.cameras = [camHUD];
    hudTxt.cameras = [camHUD];

	trace(inst.endTime);
	endTime = inst.endTime - (inst.endTime/80);
	realEndTime = inst.endTime;

	lapsfx = FlxG.sound.play(Paths.sound("Lap2"), 1);
	lapsfx.volume = 0;

	available = new FlxSprite(360, 500).loadGraphic(Paths.image("available"));
	available.antialiasing = false;
	available.scale.x = available.scale.y = 1.5;
	available.alpha = 0;
	available.camera = camHUD;
	add(available);

	tvBG = new FlxSprite(1000, 475).loadGraphic(Paths.image("tvBG"));
	tvBG.antialiasing = false;
	tvBG.scale.x = tvBG.scale.y = 1;
	tvBG.camera = camHUD;
	add(tvBG);

	tv = new FlxSprite(1000, 475);
	tv.frames = Paths.getSparrowAtlas("tv");
	tv.animation.addByPrefix('idle', 'idle0', 24, true);
	tv.animation.addByPrefix('idleanim', 'idleanim', 24, false);
	tv.animation.addByPrefix('combo', 'combo', 24, true);
	tv.animation.addByPrefix('panic', 'panic', 24, true);
	tv.animation.play('idle');
	tv.antialiasing = false;
	tv.scale.x = tv.scale.y = 1;
	tv.camera = camHUD;
	add(tv);

	lap2 = new FlxSprite(500, 1000).loadGraphic(Paths.image("LAP2"));
	lap2.scale.x = lap2.scale.y = 4;
	lap2.camera = camHUD;
	add(lap2);

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

var savedEvents = [];

function postCreate() {
	for (i in 0...2) {
    		cpuStrums.members[i].x = 110 + i * 105;
	}
	for (i in 2...4) {
    		cpuStrums.members[i].x = 740 + i * 105;
	}

	noteStuff1 = strumLines.members[0].notes.members;
	noteStuff2 = strumLines.members[1].notes.members;

	for (i in 0...4)
    		playerStrums.members[i].x = 425 + i * 105;

	for (strum in strumLines) {
		if (strum.cpu) {
			for (note in strum.notes) {
				note.alpha = 0.5;
    			}
		}
	}

	trace(playerStrums.members[0].y);
	savedEvents = events.copy();
    	for (i in [missesTxt, accuracyTxt, scoreTxt]) {
        	i.visible = false;
    	}
}

function beatHit(curBeat) {
	if (curBeat < 2) {
		for (strum in strumLines) {
			if (strum.cpu) {
				for (note in strum.notes) {
					note.alpha = 0.5;
    				}
			}
		}
	}
}

function update() {
	for (i in 0...4) {
		cpuStrums.members[i].alpha = 0.5;
		playerStrums.members[i].alpha = 1;
	}

        hudTxt.text = songScore;
        missessTxt.text = "Misses:" + misses;

    if (inst != null && timeBar != null && timeBar.max != inst.length) {
        timeBar.setRange(0, Math.max(1, inst.length));
    }

    if (inst != null && timeTxt != null) {
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string((timeRemaining / inst.pitch) % 60), 2);
        var minutes = Std.int((timeRemaining / inst.pitch) / 60);
        timeTxt.text = minutes + ":" + FlxMath.roundDecimal(seconds, 1);
    }

	timer += 1;
	available.x = FlxG.random.float(357, 363);
	available.y = FlxG.random.float(497, 503);
	if (inst.time > endTime - 2000 && isLap2 != true && FlxG.keys.pressed.SPACE) {
		trace("LAP 2!");
		dolap2();
	}
	if (inst.time > endTime - 2000 && isLap2 != true) {
		trace("LAP 2 IS AVAILABLE! PRESS [SPACE] TO USE IT!");
		available.alpha = 1;
	}
	if (inst.time < endTime - 2000 && isLap2 != true) {
		available.alpha = 0;
	}
	if (lap2.y < 1000) {
		lap2.y += 5;
	}
	if (lap2.y > 1000) {
		lap2.y = 1000;
	}
	if (isLap2 != true) {
		if (timer % 1000 == 0 && tv.animation.curAnim.name == "idle") {
			tv.animation.play('idleanim');
		}
		if (tv.animation.finished && !isLap2) {
			if (noteNum < 30)
				tv.animation.play('idle');

			if (noteNum > 30)
				tv.animation.play("combo", false);
		}
	}
	if (isLap2 == true && tv.animation.curAnim.name != "panic" ) {
		tv.animation.play("panic", true);
	}

	if (isLap2) {
		camHUD.x = FlxG.random.float(-3, 3);
		camHUD.y = FlxG.random.float(-3, 3);
		camGame.x = FlxG.random.float(-6, 6);
		camGame.y = FlxG.random.float(-6, 6);
		for (i in 0...4) {
    			playerStrums.members[i].x = FlxG.random.float(420, 430) + i * 105;
    			playerStrums.members[i].y = FlxG.random.float(35, 45);
		}
	}
	if (noteNum > 0) {
		noteNum -= 0.01;
	}
	if (noteNum < 0) {
		noteNum = 0;
	}

	var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
	accTxt.text = acc;

	if (acc < 71) {
		rankD.visible = true;
		rankC.visible = false;
		rankB.visible = false;
		rankA.visible = false;
		rankS.visible = false;
		rankP.visible = false;
	} 
	if (acc > 69 && acc < 81) {
		rankD.visible = false;
		rankC.visible = true;
		rankB.visible = false;
		rankA.visible = false;
		rankS.visible = false;
		rankP.visible = false;
	}
	if (acc > 79 && acc < 91) {
		rankD.visible = false;
		rankC.visible = false;
		rankB.visible = true;
		rankA.visible = false;
		rankS.visible = false;
		rankP.visible = false;
	}
	if (acc > 89 && acc < 96) {
		rankD.visible = false;
		rankC.visible = false;
		rankB.visible = false;
		rankA.visible = true;
		rankS.visible = false;
		rankP.visible = false;
	}
	if (acc > 94 && acc < 101) {
		rankD.visible = false;
		rankC.visible = false;
		rankB.visible = false;
		rankA.visible = false;
		rankS.visible = true;
		rankP.visible = false;
	}
	if (acc > 94 && isLap2 && misses == 0) {
		rankD.visible = false;
		rankC.visible = false;
		rankB.visible = false;
		rankA.visible = false;
		rankS.visible = false;
		rankP.visible = true;
	}
}

function onPlayerHit(note:Note) {
	noteNum += 1;
}


function dolap2() {
	FlxG.sound.music.time = 0;
	resyncVocals();
	for (s in strumLines) s.generate(s.data, null);
	events = savedEvents.copy();
	inst.pitch = 1.2;
	vocals.pitch = 1.2;
	lapsfx = FlxG.sound.play(Paths.sound("Lap2"), 1);
	lapsfx.volume = 1;
	lap2.y = -300;
	available.alpha = 0;
	for (i in 0...4)
    		playerStrums.members[i].scrollSpeed = 3;
	isLap2 = true;

}