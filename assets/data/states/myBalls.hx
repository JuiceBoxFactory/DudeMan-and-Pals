import funkin.ui.FunkinText;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxAxes;
import funkin.game.PlayState;
import flixel.addons.display.FlxBackdrop;

var pauseCam = new FlxCamera();

var bg:FlxSprite;
var hand:FlxSprite;

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

	bg = new FlxSprite(-600, 0);
	bg.loadGraphic(Paths.image('johnpork/pausedBg'));
	bg.updateHitbox();
	bg.cameras = [pauseCam];
	add(bg);

	char = new FlxSprite(1800, 0).loadGraphic(Paths.image('johnpork/ports/' + PlayState.SONG.meta.displayName));
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
		trace(e);
	}

	optionselected = new FlxSprite(0, 600).loadGraphic(Paths.image('johnpork/'+curSelected));
	add(optionselected);

	FlxTween.tween(bg, {x: 0}, 1, {ease: FlxEase.quartInOut});
	FlxTween.tween(optionselected, {y: 0}, 1.5, {ease: FlxEase.quartInOut});
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
	optionselected.loadGraphic(Paths.image('johnpork/'+curSelected));

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


	if (controls.ACCEPT) {
		var option = menuItems[curSelected];
		if (option == "Resume" || option == "Exit to menu") {
			canDoShit = false;
			for(t in texts) t.visible = false;
			FlxTween.tween(optionselected, {x: -600}, 0.0001, {ease: FlxEase.quartOut});
			FlxTween.tween(char, {x: 200}, 0.0001, {ease: FlxEase.quartOut});
			FlxTween.tween(bg, {x: -600}, 0.0001, {ease: FlxEase.quartOut, onComplete: function() {
				selectOption();
			}});
		} else {
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