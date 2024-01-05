import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

public var sectionselected;
var Selected = 0;
var sectionname:FlxText;

function create() {

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	freeplaytitle = new FlxSprite(175, 10).loadGraphic(Paths.image('freeplay/name'));
	freeplaytitle.antialiasing = false;
	freeplaytitle.updateHitbox();
	add(freeplaytitle);

	freeplaysectionselectarrows = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/selectarrows'));
	freeplaysectionselectarrows.screenCenter();
	freeplaysectionselectarrows.antialiasing = false;
	freeplaysectionselectarrows.updateHitbox();
	add(freeplaysectionselectarrows);

     sectionname = new FlxText(390, 450, 500, "you cant see this wtf", 0);
     sectionname.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     sectionname.borderColor = 0xFF06000C;
     sectionname.borderSize = 3;
     add(sectionname);

	catgeory = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/selection/'+Selected));
	catgeory.screenCenter();
	catgeory.scrollFactor.set(0, 0);
	add(catgeory);

}

function update() {	
	catgeory.loadGraphic(Paths.image('freeplay/selection/'+Selected));

	if (FlxG.keys.justPressed.LEFT) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (FlxG.keys.justPressed.RIGHT) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}
	if (Selected == 0) {
		sectionname.text = 'StoryMode Songs';
	}
	if (Selected == 1) {
		sectionname.text = 'Extras';
	}
	if (Selected == 2) {
		sectionname.text = 'For my Pals';
	}
	if (Selected == 3) {
		sectionname.text = 'Cover/Remixes';
	}
	if (controls.ACCEPT) {
		FlxG.save.data.sectionselected = Selected;
		FlxG.switchState(new FreeplayState());
     }
	if (FlxG.keys.justPressed.SEVEN) {
		FlxG.save.data.sectionselected = 4;
		FlxG.switchState(new FreeplayState());
     }
	if (Selected > 3) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 3;
	}
	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}