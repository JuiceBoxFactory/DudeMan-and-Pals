import funkin.ui.FunkinText;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxAxes;
import funkin.game.PlayState;
import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import funkin.game.PlayState;

var pauseCam = new FlxCamera();

var bg:FlxSprite;

var texts:Array<FlxText> = [];

function create(event) {
	// cancel default pause menu!!
	event.cancel();

	cameras = [];

	FlxG.cameras.add(pauseCam, false);
	pauseCam.bgColor = 0x4419002B;

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	coolBackdrop.alpha = 0.3;
	add(coolBackdrop);

	bg = new FlxSprite(0, 1000);
	bg.loadGraphic(Paths.image('johnpork/pausedBg'));
	bg.updateHitbox();
	bg.cameras = [pauseCam];
	add(bg);

	char = new FlxSprite(1800, 0).loadGraphic(Paths.image('johnpork/ports/' + PlayState.SONG.meta.name));
	add(char);

	var i = 2;
	for(e in menuItems) {
		text = new FlxText(0, (22 * 6) + (i * 9 * 6), 0, e, 8, false);
/// 		text = new FlxSprite().loadGraphic(Paths.image('pausejohnpork/' + e + '-base'));
		confText(text);
		add(text);
		texts.push(text);
		text.alpha = 0;
		i++;
	}

	pausedText = new FlxText(-115, 1025, 800);
	pausedText.setFormat(Paths.font("COMIC.ttf"), 75, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	pausedText.cameras = [pauseCam];
	pausedText.color = 0xFFF6E5FF;
	pausedText.borderColor = 0xFF0C0014;
	pausedText.borderSize = 6;
	pausedText.antialiasing = false;
	add(pausedText);

	imResume = new FlxText(-115, 1145, 800);
	imResume.setFormat(Paths.font("COMIC.ttf"), 45, FlxColor.WHITE, "center");            
	imResume.cameras = [pauseCam];
	imResume.color = 0xFFF6E5FF;
	imResume.antialiasing = false;
	add(imResume);

	imRestart = new FlxText(-115, 1230, 800);
	imRestart.setFormat(Paths.font("COMIC.ttf"), 45, FlxColor.WHITE, "center");            
	imRestart.cameras = [pauseCam];
	imRestart.color = 0xFFF6E5FF;
	imRestart.antialiasing = false;
	add(imRestart);

	imControls = new FlxText(-115, 1315, 800);
	imControls.setFormat(Paths.font("COMIC.ttf"), 45, FlxColor.WHITE, "center");            
	imControls.cameras = [pauseCam];
	imControls.color = 0xFFF6E5FF;
	imControls.antialiasing = false;
	add(imControls);

	imOptions = new FlxText(-115, 1400, 800);
	imOptions.setFormat(Paths.font("COMIC.ttf"), 45, FlxColor.WHITE, "center");            
	imOptions.cameras = [pauseCam];
	imOptions.color = 0xFFF6E5FF;
	imOptions.antialiasing = false;
	add(imOptions);

	backDoor = new FlxSprite(0, 990).loadGraphic(Paths.image('johnpork/backdrop'));
	backDoor.cameras = [pauseCam];
	add(backDoor);

	if (FlxG.save.data.language == "english") {
		pausedText.text = "Paused";
		imResume.text = "Resume";
		imRestart.text = "Restart";
		imControls.text = "Controls";
		imOptions.text = "Options";
	}
	if (FlxG.save.data.language == "spanish") {
		pausedText.text = "Pausar";
		imResume.text = "Reasumier";
		imRestart.text = "Reniciar";
		imControls.text = "Controles";
		imOptions.text = "Opciones";
	}
	
	for (dumbShit in [bg, imResume, imRestart, imControls, imOptions, backDoor, pausedText]) {
		FlxTween.tween(dumbShit, {y: dumbShit.y - 1000}, 1, {ease: FlxEase.quartInOut});
	}
	FlxTween.tween(char, {x: 550}, 2, {ease: FlxEase.quartInOut});

	cameras = [pauseCam];

}

function confText(text) {
	text.scale.set(1, 1);
	text.updateHitbox();
	text.screenCenter(FlxAxes.X);
}

function destroy() {
	FlxG.cameras.remove(pauseCam);
}

var canDoShit = true;
var time:Float = 0;
function update(elapsed) {

	pauseCam.alpha = lerp(pauseCam.alpha, 1, 0.25);
	time += elapsed;
	
	var curText = texts[curSelected];

	if (!canDoShit) return;
	var oldSec = curSelected;
	if (controls.DOWN_P)
		changeSelection(1, false);
	if (controls.UP_P)
		changeSelection(-1);

	if (oldSec != curSelected) {
	}

	if (curSelected == 0) {
		imResume.color = 0xFFC56BFD;
		imResume.underline = true;
	}
	else {
		imResume.color = 0xFFF6E5FF;
		imResume.underline = false;
	}

	if (curSelected == 1) {
		imRestart.color = 0xFFC56BFD;
		imRestart.underline = true;
	}
	else {
		imRestart.color = 0xFFF6E5FF;
		imRestart.underline = false;
	}
	
	if (curSelected == 2) {
		imControls.color = 0xFFC56BFD;
		imControls.underline = true;
	}
	else {
		imControls.color = 0xFFF6E5FF;
		imControls.underline = false;
	}

	if (curSelected == 3) {
		imOptions.color = 0xFFC56BFD;
		imOptions.underline = true;
	}
	else {
		imOptions.color = 0xFFF6E5FF;
		imOptions.underline = false;
	}

	if (curSelected == 4) {
		backDoor.color = 0xFFC56BFD;
	}
	else {
		backDoor.color = 0xFFFFFFFF;
	}

	if (controls.ACCEPT) {
		var option = menuItems[curSelected];
		if (option == "Resume" || option == "Exit to menu") {
			canDoShit = false;
			for(t in texts) t.visible = false;
			FlxTween.tween(char, {x: 200}, 0.0001, {ease: FlxEase.quartOut});
			FlxTween.tween(bg, {x: -600}, 0.0001, {ease: FlxEase.quartOut, onComplete: function() {
				selectOption();
			}});
		} 
		
		else if (option == "Change Options") {
			FlxG.save.data.wasJustInPause = true;
			FlxG.switchState(new ModState("DudeOptionsState"));
			}
		
		else {
			selectOption();
		}
	}
}

function changeSelection(change) {
	curSelected += change;

	if (curSelected < 0)
		curSelected = menuItems.length - 1;
	if (curSelected >= menuItems.length)
		curSelected = 0;
}