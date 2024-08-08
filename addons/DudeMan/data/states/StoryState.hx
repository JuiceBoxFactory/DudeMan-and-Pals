import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.util.FlxSave;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.utils.DiscordUtil;
import flixel.FlxSubState;

var Selected = 0;
var camPosition = 0;
var blurShit = new CustomShader("blur");
var canDo = true;
var transparencyShit:FlxTypedGroup<FlxSprite> = [];
var transparencyShit2:FlxTypedGroup<FlxSprite> = [];
var weeknamething:FlxTypedGroup<FlxText> = [];
var taglinething:FlxTypedGroup<FlxText> = [];
var songies:FlxTypedGroup<FlxText> = [];

var weeksList = [

	"VS DUDEMAN",
	"VS FRUITY",
	"VS ZEE",
	"VS SQUINGLE",
	"VS KATHY",
	"VS UMBREON.EXE",
	"VS STICKERY HICKERY",
	"VS MX.SILLY",
	"HALLOWEEN",

];
var weeksTagList = [

	"sing my evil songs NOW",
	"ITS MY FAVORITE SHOW !",
	"zawezome !!",
	"A New Dimension!",
	"Vampire Rock is my Blood",
	"I'm evil im going to kill you",
	"I'm sticking my hickey in your",
	"Lights, Camera, Action!",
	"SPOOKY MONTH!!!",

];
var weeksSongsListDISPLAYNAMES = [
	
	"1. Dude\n2. Overstimulation\n3. /Srs",
	"1. COLORFUL\n2. TISM\n3. SCENE-CULTURE",
	"1. Fang\n2. Zoomies",
	"1. Polygon\n2. Konami",
	"1. Sucker\n2. Bleh",
	"1. Im-So-Evil",
	"1. Sticky-Situation",
	"1. Showstage\n2. Spotlights",
	"1. Treats\n2. Tricks",

];

function create() {

	DiscordUtil.changePresenceAdvanced({
		details: "IN: The StoryMenu",
		state: "This goat in my story menu <3",
		largeImageKey: "icon"
	});

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	for (i in 0...weeksList.length)	{

		weekImages = new FlxSprite(0, 333).loadGraphic(Paths.image('storyMode/weekCons/'+weeksList[i]));
		weekImages.antialiasing = false;
		weekImages.x = (700 * i) + 336;
		transparencyShit.push(weekImages);
		weekImages.updateHitbox();
		add(weekImages);

		weekCover = new FlxSprite(0, 0).loadGraphic(Paths.image('storyMode/weekCons/coverWeeks'));
		weekCover.antialiasing = false;
		weekCover.x = (700 * i) + 320;
		transparencyShit2.push(weekCover);
		weekCover.screenCenter(FlxAxes.Y);
		weekCover.y = weekCover.y + 50;
		weekCover.updateHitbox();
		add(weekCover);

		name = new FlxText(525, 190, 500);
		name.setFormat(Paths.font("COMIC.ttf"), 35, 0xFF0C0014, "right");            
		name.text = weeksList[i];
		name.x = (700 * i) + 430;
		weeknamething.push(name);
		name.antialiasing = false;
		name.scale.set(1, 1);
		add(name);

		tagline = new FlxText(525, 240, 500);
		tagline.setFormat(Paths.font("COMIC.ttf"), 25, 0xFF0C0014, "right");            
		tagline.text = weeksTagList[i];
		tagline.x = (700 * i) + 430;
		taglinething.push(tagline);
		tagline.antialiasing = false;
		tagline.scale.set(1, 1);
		add(tagline);

		songsListACTUAL = new FlxText(525, 190, 500);
		songsListACTUAL.setFormat(Paths.font("COMIC.ttf"), 20, 0xFF0C0014, "left");            
		songsListACTUAL.text = weeksSongsListDISPLAYNAMES[i];
		songsListACTUAL.x = (700 * i) + 345;
		songies.push(songsListACTUAL);
		songsListACTUAL.antialiasing = false;
		songsListACTUAL.scale.set(1, 1);
		add(songsListACTUAL);

	}

	arrows = new FlxSprite(0, 0).loadGraphic(Paths.image('storyMode/arrows'));
	arrows.antialiasing = false;
	arrows.updateHitbox();
	arrows.scrollFactor.set(0, 0);
	add(arrows);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	border.scrollFactor.set(0, 0);
	add(border);
	
	storytitle = new FlxSprite(310, 10).loadGraphic(Paths.image('storyMode/name'));
	storytitle.antialiasing = false;
	storytitle.scale.set(0.8, 0.8);
	storytitle.scrollFactor.set(0, 0);
	storytitle.updateHitbox();
	add(storytitle);

}
	
function update() {

	if (camera.scroll.x > camPosition) {
		camera.scroll.x -= 50;
	}
	else if (camera.scroll.x < camPosition) {
		camera.scroll.x += 50;
	}

	camPosition = 700 * Selected;

	for (i in 0...weeksList.length)	{

		transparencyShit[i].y = 315;
		transparencyShit[Selected].y = 333;

		songies[i].y = 240;
		songies[Selected].y = 190;

		weeknamething[i].y = 230;
		weeknamething[Selected].y = 190;

		taglinething[i].y = 280;
		taglinething[Selected].y = 240;

		for (shitSHIT in [transparencyShit, transparencyShit2, weeknamething, taglinething, songies]) {
			shitSHIT[i].scale.set(0.8, 0.8);
		}

		for (shitSHIT in [transparencyShit, transparencyShit2, weeknamething, taglinething, songies]) {
			shitSHIT[i].alpha = 0.6;
		}

		for (shitSHIT in [transparencyShit, transparencyShit2, weeknamething, taglinething, songies]) {
			shitSHIT[Selected].alpha = 1;
		}

		for (shitSHIT in [transparencyShit, transparencyShit2, weeknamething, taglinething, songies]) {
			shitSHIT[Selected].scale.set(1, 1);
		}

		transparencyShit[Selected].scale.set(1, 1.025);

	}

	if (controls.LEFT_P && canDo == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (controls.RIGHT_P && canDo == true) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}

	var weeksSongsList = [
	
		"dude",
		"welcome-to-my-test-song",
		"fang",
		"welcome-to-my-test-song",
		"sucker",
		"welcome-to-my-test-song",
		"welcome-to-my-test-song",
		"welcome-to-my-test-song",
		"welcome-to-my-test-song",
	
	];

	if (controls.ACCEPT && canDo == true) {
		if (Selected == 0) {
			PlayState.loadWeek( {
				name: "week",
				id: weeksList[Selected],
				sprite: null,
				chars: [null, null, null],
				songs: [for (song in ["dude", "overstimulation", "srs"]) {name: song, hide: false}],
				difficulties: ['hard']
			}, "hard");
		}
		else if (Selected == 2) {
			PlayState.loadWeek( {
				name: "week",
				id: weeksList[Selected],
				sprite: null,
				chars: [null, null, null],
				songs: [for (song in ["fang"]) {name: song, hide: false}],
				difficulties: ['hard']
			}, "hard");
		}
		else if (Selected == 4) {
			PlayState.loadWeek( {
				name: "week",
				id: weeksList[Selected],
				sprite: null,
				chars: [null, null, null],
				songs: [for (song in ["sucker"]) {name: song, hide: false}],
				difficulties: ['hard']
			}, "hard");
		}
		else {
			PlayState.loadWeek( {
				name: "week",
				id: weeksList[Selected],
				sprite: null,
				chars: [null, null, null],
				songs: [for (song in ["welcome-to-my-test-song"]) {name: song, hide: false}],
				difficulties: ['hard']
			}, "hard");
		}
		

		new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());}); 
	}

	if (FlxG.keys.justPressed.G) {
		openSubState(new ModSubState("MenuDialogueSubstate"));
		FlxG.save.data.menuDialougeToPlay = "takeBreaks";
		canDo = false;
		FlxG.camera.addShader(blurShit);
		FlxG.save.data.shortLived = null;
	}

	if (FlxG.save.data.shortLived == true) {
		FlxG.camera.removeShader(blurShit);
		canDo = true;
	}

	if (canDo == true) {
		FlxG.sound.music.volume = 1;
	}
	else {
		FlxG.sound.music.volume = 0.05;
	}

	if (Selected > 8) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 8;
	}
 	
	if (controls.BACK) {
		FlxG.switchState(new MainMenuState());
	}
}