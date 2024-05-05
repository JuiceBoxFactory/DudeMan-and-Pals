import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;
import flixel.util.FlxSave;

var tipText:Array<String> = [

"when the dude is.. man... yeah man.",
"lowkey, im better than you at this game.",
"9364 WI-16 onalaska, WI",
"Bob V3",
"Peakest mod to Exist.. totally",
"Im gonna put a toothbrush up your ass",
"what the poop",
"Have a tip, pal",
"Give me your money, MeltyKelpy",
"Can you P-Rank my dude, man ?",
"Weclome to dude, man...?",
"Welcome to my Galaxy",
"I hate tadpoles",
"oogali boogaliii ( that was a clown. )",
"did you know that there is secret settings ?? they're.. soooo well hidden... bet u cant find them..... heh heh... yeah.",
"wait.. my shirt... its off !!!",
"Basketball Practice",
"Actual battle i destroyed the toilet btw",
"SUPERGOONER... ACTIVATE",
"and now i really go senile, sometimes going from 'Goodbye Internet' to 'GTLive: FNAF: Security Breach'",
"Yo! Really think so?",
"That isn't very Chuddy Buddy !",
"kill everyone",
];
var tipTextChosen = "null";
var highestNum = 22;

var introOver = false;

function postCreate() {

	CoolUtil.playMenuSong();

	if (FlxG.save.data.firstOnIntroClient == false) {
		skipIntro();
	}

	coolBackdrop = new FlxBackdrop(Paths.image('titleScreen/checkerboardbg'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100;
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	light = new FlxSprite(0, 0).loadGraphic(Paths.image('titleScreen/backgroundLight'));
	light.antialiasing = false;
	light.updateHitbox();
	add(light);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('titleScreen/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	Logo = new FlxSprite(0, 0).loadGraphic(Paths.image('modLogo'));
	Logo.antialiasing = false;
	Logo.updateHitbox();
	Logo.screenCenter();
	Logo.y -= 100;
	Logo.x -= 20;
	add(Logo);

	tipTxt = new FlxText();
	tipTxt.text = "Tip:\n"+tipTextChosen;
	tipTxt.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	tipTxt.color = 0xFFFFFFFF;
	tipTxt.borderColor = 0xFF000000;
	tipTxt.antialiasing = false;
	tipTxt.borderSize = 3;
	tipTxt.screenCenter();
	tipTxt.x += 0;
	tipTxt.y += 75;
	add(tipTxt);

	BottomText = new FlxText();
	BottomText.text = "btw, this is the part where you press";
	BottomText.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	BottomText.color = 0xFFFFFFFF;
	BottomText.borderColor = 0xFF000000;
	BottomText.antialiasing = false;
	BottomText.screenCenter();
	BottomText.borderSize = 3;
	BottomText.x += 0;
	BottomText.y += 290;
	add(BottomText);

	enterTxt = new FlxText();
	enterTxt.text = "ENTER";
	enterTxt.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	enterTxt.color = 0xFFFFFFFF;
	enterTxt.borderColor = 0xFF000000;
	enterTxt.antialiasing = false;
	enterTxt.borderSize = 3;
	enterTxt.screenCenter();
	enterTxt.x += 0;
	enterTxt.y += 325;
	add(enterTxt);

	updateTxt();

	blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	add(blackScreen);

    fakeLogo = new FlxSprite();
	fakeLogo.antialiasing = false;
	fakeLogo.frames = Paths.getSparrowAtlas('titleScreen/titleOpeningLogo');
	fakeLogo.animation.addByPrefix('boil', 'boil', 6);
	fakeLogo.animation.play("boil");
	fakeLogo.screenCenter();
	fakeLogo.updateHitbox();
	fakeLogo.alpha = 0;
	add(fakeLogo);

	devs = new FlxText(800, 725);
	devs.text = "MeltyKelpy\nAussieDoesThings\nkosejumpscare\nOJSTheCoder\nNullFrequency\nGhostyBricks\nCorva_tile\nEcHO\nMissy\nJPR\nChillspace\nR3t1xTheIdiot\nSaayo\nCherriBlossom\nIcepoplol\nAngelTheBoi\nCaz\nSoupSkid\nThat1Gamer";
	devs.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	devs.color = 0xFFFFFFFF;
	devs.borderColor = 0xFF000000;
	devs.antialiasing = false;
	devs.borderSize = 3;
	add(devs);

	introText = new FlxText();
	introText.text = "stupid fnf mod";
	introText.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	introText.color = 0xFFFFFFFF;
	introText.borderColor = 0xFF000000;
	introText.antialiasing = false;
	introText.borderSize = 3;
	introText.screenCenter();
	add(introText);

}

function update() {

	if (FlxG.keys.justPressed.SHIFT) {
		updateTxt();
	}

	if (controls.ACCEPT && introOver == false) {
	new FlxTimer().start(0.1, function(timer) {
		skipIntro();
	});
	}

	if (controls.ACCEPT && introOver == true) {
		FlxG.sound.play(Paths.sound('confirm'));
		new FlxTimer().start(0.6, function(timer) {
			FlxG.switchState(new MainMenuState());
		});
	}

	if (introOver == true) {
		introText.alpha = 0;
		devs.alpha = 0;
		fakeLogo.alpha = 0;
		blackScreen.alpha = 0;
	}

}

function skipIntro() {

	FlxG.camera.flash(FlxColor.WHITE, 4);
	new FlxTimer().start(7, function(tmr:FlxTimer) {
		updateTxt();
	}, 600);
	introOver = true;

}

function updateTxt() {
	tipTextChosen = tipText[FlxG.random.int(0,highestNum)];
	tipTxt.text = "Tip:\n"+tipTextChosen;
	tipTxt.screenCenter();		
	tipTxt.y += 75;
}

override function beatHit(curBeat:Int)	{

		switch (curBeat)
		{
			case 1:		
				introText.text = "stupidest fnf mod you've ever played";
				introText.screenCenter();
			case 4:
				introText.text = "made by...";
				introText.screenCenter();
			case 8:
				introText.text = "like way too many fucking people dude";
				introText.screenCenter();				
				FlxTween.tween(introText, {x: 100}, 0.6, {ease: FlxEase.quartOut});
				new FlxTimer().start(0.6, function(timer) {
					FlxTween.tween(devs, {y: -950}, 1);
				});
			case 12:
				introText.text = "and that mods called-";
				introText.screenCenter();
			case 14:
				FlxTween.tween(introText, {alpha: 0}, 0.2);
				FlxTween.tween(fakeLogo, {alpha: 1}, 0.7);
			case 16:
				FlxG.save.data.firstOnIntroClient = false;
				skipIntro();
		}
	}