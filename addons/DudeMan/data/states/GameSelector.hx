import flixel.ui.FlxButton;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;
import funkin.backend.system.Controls;
import openfl.filters.BlurFilter;
import flixel.FlxCamera;
import funkin.backend.utils.DiscordUtil;
import flixel.util.FlxSave;

var blurShit = new CustomShader("blur");

// put the file path // state name for the game, and put it in the order you want it in the list lol
// it also uses this to check for disc labels, but if you dont have one yet then dw it'll use an unlabelled disc image
// - Mel! sole coder of this mod atp
var gamesOrderBLEH = [

    "FNAFtitle",
    "puncher",
    "fruitysfactory",
    "datingSimTitle"

];

// technically, doing it like this complicates the process of making this just ABIT but it also looks nicer and simplifies
// like one aspect of this process. also I didnt know this was a thing til now so i dont care LMAO i do what i want
// - Mel!
var gameDisplayName = [

    "datingSimTitle" => "DudeMan: More Than Pals",
    "fruitysfactory" => "FRUITY'S FABULOUS FASHION FACTORY FOR FUN FRIENDS !!!",
    "puncher" => "Puzzle's DudeMan Puncher!",
    "FNAFtitle" => "DudeMan's Emporium"

];
var gameDescription = [

    "fruitysfactory" => "I'M SO PRETTY :3 !!!! DO YOU WANNA BE AS PRETTY AS MEEEEEEE ???? THEN COME TO MY FABULOUS FASHION FACTORY FOR FUN FRIENDS !!! AND PLAY DRESS UP WITH MEEE :3\n:3",
    "datingSimTitle" => 'Take a step into '+"DudeMan's "+'"Dude School", '+"because you're about to go on a quest... a quest to.. FIND LOVE <3",
    "puncher" => ">:] Do you hate DudeMan as much as me? I hope so because hes a LYING CHEATING BITCH. Well then come play My Game! where you can beat the SHIT OUT OF THE BASTARD!",
    "FNAFtitle" => "DudeMan if it the FIVE NIGHTS AT FREDDY'S FUUUUCCKK"

];

var discs:FlxSpriteGroup<FlxSprite> = [];

// oh right i have make *SIGH* non-arrays....
// - Mel!
var chosenOrWhatevs = 0;
var canDo = true;
var discSpin = false;
var discSpinSlow = false;

function create() {

    FlxG.save.data.shortLived = null;
    FlxG.save.data.noTransition = false;

    FlxTween.tween(FlxG.sound.music, {volume: 0}, 1.5, {ease:FlxEase.quartOut});

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    add(cursor);

    backdrop = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/background'));
	backdrop.scrollFactor.set(0, 0);
	add(backdrop);

    darknessConsumes = new FlxSprite(0, 0).loadGraphic(Paths.image('shh/ihateblackpeople'));
	darknessConsumes.scrollFactor.set(0, 0);
	add(darknessConsumes);

    boxBack = new FlxSprite(0, 600).loadGraphic(Paths.image('shh/boxBack'));
	boxBack.scrollFactor.set(0, 0);
    boxBack.screenCenter(FlxAxes.X);
    boxBack.scale.set(1.05, 1.05);
	add(boxBack);

    for (i in 0...gamesOrderBLEH.length) {

        if (Assets.exists(Paths.image('shh/DISCS/'+gamesOrderBLEH[i]))) {
            disc = new FlxSprite(0, 600).loadGraphic(Paths.image('shh/DISCS/'+gamesOrderBLEH[i]));
        }
        else {
            disc = new FlxSprite(0, 600).loadGraphic(Paths.image('shh/unlabelledDisc'));
        }
        disc.scrollFactor.set(1, 1);
        disc.screenCenter();
        var jank = disc.x;
        disc.alpha = 0;
        disc.x = jank + (200 * i);
        discs.push(disc);
        add(disc);

    }

    boxFront = new FlxSprite(0, 600).loadGraphic(Paths.image('shh/boxFront'));
	boxFront.scrollFactor.set(0, 0);
    boxFront.scale.set(1.05, 1.05);
    boxFront.screenCenter(FlxAxes.X);
	add(boxFront);

    gameNameText = new FlxText(0, 0, FlxG.width);
    gameNameText.text = "i dunno";
    gameNameText.setFormat(Paths.font("Bahnschrift.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    gameNameText.updateHitbox();
    gameNameText.borderSize = 2;
    gameNameText.antialiasing = false;
    gameNameText.screenCenter();
    gameNameText.scrollFactor.set(0, 0);
    gameNameText.y += 90;
    add(gameNameText);

    gameDescriptionText = new FlxText(0, 0, FlxG.width / 2.5);
    gameDescriptionText.text = "i dunno";
    gameDescriptionText.setFormat(Paths.font("Bahnschrift.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    gameDescriptionText.updateHitbox();
    gameDescriptionText.borderSize = 2;
    gameDescriptionText.antialiasing = false;
    gameDescriptionText.screenCenter();
    gameDescriptionText.scrollFactor.set(0, 0);
    gameDescriptionText.y += 125;
    add(gameDescriptionText);

    for (boxOffset in [boxBack, boxFront]) {
        boxOffset.x += 4.5;

    }

    arrowLEFT = new FlxSprite(0, 0);
    arrowLEFT.frames = Paths.getSparrowAtlas('shh/arrowLEFT');
	arrowLEFT.antialiasing = false;
    arrowLEFT.animation.addByPrefix('left', 'left', 24, false);
    arrowLEFT.scrollFactor.set(0, 0);
    arrowLEFT.animation.play('left');
    arrowLEFT.screenCenter();
    add(arrowLEFT);

    arrowRIGHT = new FlxSprite(0, 0);
    arrowRIGHT.frames = Paths.getSparrowAtlas('shh/arrowRIGHT');
	arrowRIGHT.antialiasing = false;
    arrowRIGHT.animation.addByPrefix('right', 'right', 24, false);
    arrowRIGHT.scrollFactor.set(0, 0);
    arrowRIGHT.animation.play('right');
    arrowRIGHT.screenCenter();
    add(arrowRIGHT);

    radioLoad();
    
    for (i in 0...gamesOrderBLEH.length) {
        var origY = discs[i].y;
        discs[i].y += 1000;
        FlxTween.tween(discs[i], {y: origY}, 2, {ease:FlxEase.quartOut});
    }

    for (ui in [boxBack, boxFront, arrowLEFT, arrowRIGHT, gameNameText, gameDescriptionText]) {
        var origY = ui.y;
        ui.y += 900;
        FlxTween.tween(ui, {y: origY}, 2, {ease:FlxEase.quartOut});
        new FlxTimer().start(2, function(timer) {
            if (FlxG.save.data.gamesFirstTime == true) {
                canDo = true;
            }
        });
    }


}

function loadGame() {

    discSpin = true;

        FlxTween.tween(arrowLEFT, {y: 900}, 2, {ease:FlxEase.quartIn});
        FlxTween.tween(arrowRIGHT, {y: 900}, 2, {ease:FlxEase.quartIn});
        FlxTween.tween(gameNameText, {y: 900}, 2, {ease:FlxEase.quartIn});
        FlxTween.tween(gameDescriptionText, {y: 900}, 2, {ease:FlxEase.quartIn});
    for (i in 0...gamesOrderBLEH.length) {
        if (i != chosenOrWhatevs) {
            FlxTween.tween(discs[i], {y: 900}, 2, {ease:FlxEase.quartIn});
        }
        else {
            FlxTween.tween(discs[i], {y: 550}, 3, {ease:FlxEase.backIn});
        }
    }

    new FlxTimer().start(3, function(timer) {
        discSpinSlow = true;
        discSpin = false;
        FlxG.sound.play(Paths.sound('loadGame'));
        FlxTween.tween(discs[chosenOrWhatevs], {y: 570}, 2, {ease:FlxEase.backIn});
        new FlxTimer().start(2, function(timer) {
            discSpinSlow = false;
            FlxTween.tween(discs[chosenOrWhatevs], {y: 700}, 1);
            new FlxTimer().start(2, function(timer) {
                FlxG.switchState(new ModState('GAMES/'+gamesOrderBLEH[chosenOrWhatevs]));
            });
        });
    });

}

function update(elapsed:Float) {

    if (FlxG.save.data.gamesFirstTime == null) {
        openSubState(new ModSubState("Functionality/MenuDialogueSubstate"));
        FlxG.save.data.menuDialougeToPlay = "ps5Games";
        canDo = false;
        FlxG.camera.addShader(blurShit);   
        FlxG.save.data.gamesFirstTime = false;     
    }

	if (FlxG.save.data.shortLived == true) {
		FlxG.camera.removeShader(blurShit);
		canDo = true;
        FlxG.save.data.shortLived = null;
	}

    var stupidShitKinda = gamesOrderBLEH[chosenOrWhatevs];

    gameNameText.text = gameDisplayName[stupidShitKinda];
    gameDescriptionText.text = gameDescription[stupidShitKinda];

    if (discSpin == true) {
        discs[chosenOrWhatevs].angle += 5;
    }
    if (discSpinSlow == true) {
        discs[chosenOrWhatevs].angle += 0.05;
    }

    var desiredCamPos = 0;

    desiredCamPos = chosenOrWhatevs * 200;

    if (FlxG.camera.scroll.x < desiredCamPos) {
        FlxG.camera.scroll.x += 25;
    }

    if (FlxG.camera.scroll.x > desiredCamPos) {
        FlxG.camera.scroll.x -= 25;
    }

    if (controls.RIGHT_P && canDo == true) {
        FlxG.sound.play(Paths.sound('menu/scroll'), 0.5);
        chosenOrWhatevs += 1;
        arrowRIGHT.animation.play('right');
    }
    if (controls.LEFT_P && canDo == true) {
        FlxG.sound.play(Paths.sound('menu/scroll'), 0.5);
        chosenOrWhatevs -= 1;
        arrowLEFT.animation.play('left');
    } 

    if (controls.ACCEPT && canDo == true) {
        canDo = false;
        FlxG.sound.play(Paths.sound('confirm'));
        loadGame();
    }

    for (i in 0...gamesOrderBLEH.length) {

    // this code JANKY AS SHIT holy hell
    // atleast it work doe
    // -Mel!

        discs[i].alpha = 1;
        discs[i].scale.set(1, 1);

        if (i < chosenOrWhatevs) {

            var instillingAnorexiaInMiddleSchoolers = i + 1;

            if (instillingAnorexiaInMiddleSchoolers < chosenOrWhatevs) {
                discs[i].alpha = 0;
            }
            if (instillingAnorexiaInMiddleSchoolers == chosenOrWhatevs) {
                discs[i].alpha = 0.6;
            }

            discs[i].scale.set(0.8, 0.8);
        }
        if (i > chosenOrWhatevs) {

            var instillingAnorexiaInMiddleSchoolers = i - 1;

            if (instillingAnorexiaInMiddleSchoolers > chosenOrWhatevs) {
                discs[i].alpha = 0;
            }
            if (instillingAnorexiaInMiddleSchoolers == chosenOrWhatevs) {
                discs[i].alpha = 0.6;
            }

            discs[i].scale.set(0.8, 0.8);

        }

    }

    if (chosenOrWhatevs > gamesOrderBLEH.length - 1) {
        chosenOrWhatevs = 0;
    }
    if (chosenOrWhatevs < 0) {
        chosenOrWhatevs = gamesOrderBLEH.length - 1;
    }

    FlxG.mouse.visible = false;

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

    if (FlxG.keys.justPressed.G) {
        FlxG.save.data.hasPlayedBefore = false;
        FlxG.save.data.gamesFirstTime = null;
    }

    if (controls.BACK) {
        FlxG.switchState(new ModState("FreeplaySelector"));
    }

}


function radioLoad() {

	FlxG.save.data.radioChannels = [
		"dudecast (and kathy)",
		"CHANNEL NAME HERE 2",
		"CHANNEL NAME HERE 3",
		"Sounds from the Stars",
		"jumpscareFM",
        "Conspirator Central",
        "CHANNEL NAME HERE 7",
	];

    FlxG.save.data.songNamesArtists = [
		"how it feels to see beauty.\nmaurice gray",
		"3am\nAussieDoesThings",
	];

    FlxG.save.data.radioChannelHostAmount = [
		1, // dudecast
        1, // unnamed 2
        1, // unnamed 3
        1, // SOUNDS FROM THE STARS :DDDDDDDD
        1, // jumpscareFM
        1, // Conspirator Central
        1, // unnnamed 7
	];

}