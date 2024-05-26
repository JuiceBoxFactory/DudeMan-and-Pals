import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.util.FlxSave;
import flixel.text.FlxTextBorderStyle;

var Selected = 0;
var camPosition = 0;

function create() {

	uiCamera = new FlxCamera(0, 0, 1280, 720);
	uiCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(uiCamera, false);

	borderCamera = new FlxCamera(0, 0, 1280, 720);
	borderCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(borderCamera, false);

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	border.cameras = [borderCamera];
	add(border);

	arrows = new FlxSprite(0, 0).loadGraphic(Paths.image('storyMode/arrows'));
	arrows.antialiasing = false;
	arrows.updateHitbox();
	arrows.cameras = [borderCamera];
	add(arrows);
	
	weekDude = new FlxSprite(325, 110).loadGraphic(Paths.image('storyMode/weekCons/dudeWeek'));
	weekDude.antialiasing = false;
	weekDude.scale.x = 1;
	weekDude.scale.y = 1;
	weekDude.screenCenter(FlxAxes.X);
	weekDude.scrollFactor.set(1, 1);
	weekDude.alpha = 0;
	weekDude.updateHitbox();
	weekDude.cameras = [uiCamera];
	add(weekDude);

	weekDax = new FlxSprite(weekDude.x * 3, 110).loadGraphic(Paths.image('storyMode/weekCons/daxWeek'));
	weekDax.antialiasing = false;
	weekDax.scale.x = 1;
	weekDax.scale.y = 1;
	weekDax.scrollFactor.set(1, 1);
	weekDax.alpha = 0;
	weekDax.updateHitbox();
	weekDax.cameras = [uiCamera];
	add(weekDax);
	
	storytitle = new FlxSprite(310, 10).loadGraphic(Paths.image('storyMode/name'));
	storytitle.antialiasing = false;
	storytitle.scale.set(0.8, 0.8);
	storytitle.updateHitbox();
	add(storytitle);
	
	for (obj in [weekDax]) {
			obj.scale.set(0.8, 0.8);
	}

	bottomText = new FlxText();
	bottomText.setFormat(Paths.font("COMIC.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	bottomText.y = 650;
	bottomText.cameras = [borderCamera];
	bottomText.color = 0xFFFFFFFF;
	bottomText.borderColor = 0xFF000000;
	bottomText.antialiasing = false;
	bottomText.borderSize = 3;
	add(bottomText);
}
	
function update() {
	
	bottomText.screenCenter(FlxAxes.X);

	if (uiCamera.scroll.x > camPosition) {
		uiCamera.scroll.x -= 25;
	}
	else if (uiCamera.scroll.x < camPosition) {
		uiCamera.scroll.x += 25;
	}

	for (obj in [weekDude, weekDax]) {
		obj.alpha = 0.6;

		if (obj.scale.x > 1 && obj.scale.y > 1) {
			obj.scale.set(1, 1);
		}

		if (obj.scale.x < 0.8 && obj.scale.y < 0.8) {
			obj.scale.set(0.8, 0.8);
		}
	}
	
	if (controls.LEFT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (controls.RIGHT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}
	if (Selected == 0) {
		weekDude.alpha = 1;
		if (weekDude.scale.x != 1 && weekDude.scale.y != 1) {
			weekDude.scale.x += 0.05;
			weekDude.scale.y += 0.05;
		}
		camPosition = 0;

		bottomText.text = "tis a main week, dude";
	}
	else {
		if (weekDude.scale.x != 0.8 && weekDude.scale.y != 0.8) {
			weekDude.scale.x -= 0.05;
			weekDude.scale.y -= 0.05;
		}
	}
	if (Selected == 1) {
		weekDax.alpha = 1;
		if (weekDax.scale.x != 1 && weekDax.scale.y != 1) {
			weekDax.scale.x += 0.05;
			weekDax.scale.y += 0.05;
		}
		camPosition = 650;

		bottomText.text = "tis an extra week, dude";
	}
	else {
		if (weekDax.scale.x != 0.8 && weekDax.scale.y != 0.8) {
			weekDax.scale.x -= 0.025;
			weekDax.scale.y -= 0.025;
		}
	}
	if (Selected == 0 && controls.ACCEPT) {
			PlayState.loadWeek( {
                name: "DudeMan Week",
                id: "weekDude",
                sprite: null,
                chars: [null, null, null],
                songs: [for (song in ["dude"]) {name: song, hide: false}],
                difficulties: ['hard']
            }, "hard");

			new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());}); 
	}
	if (Selected == 1 && controls.ACCEPT) {
		PlayState.loadWeek( {
			name: "Dax Shaped Duel",
			id: "weekDax",
			sprite: null,
			chars: [null, null, null],
			songs: [for (song in ["skyblue", "misconduct", "esex", "sizssoers", "lighthouse", "roomed"]) {name: song, hide: false}],
			difficulties: ['hard']
		}, "hard");

		new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());}); 
}
	if (Selected > 1) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 1;
	}
 	
	if (controls.BACK) {
		FlxG.switchState(new MainMenuState());
	}
}