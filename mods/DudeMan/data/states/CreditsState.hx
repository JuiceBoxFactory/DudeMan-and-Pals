import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;

public var sectionselected;
var Selected = 0;
var devname:FlxText;

var links:Array<String> = [
"https://twitter.com/MeltyKelpy",
"https://twitter.com/nullfreq_",
"https://twitter.com/amyd0esstuff",
"https://twitter.com/GhosttaleSans",
"https://twitter.com/kosejumpscare",
"https://twitter.com/SillyCherrrii",
"https://twitter.com/antyd0te",
"https://x.com/_MissyIsSilly_",
"https://twitter.com/R3t1xidiot",
"https://twitter.com/caz_arc",
"https://twitter.com/Saaaaayoo/status/1721544057179033853",
"https://twitter.com/angelthetweetb1"
"https://www.youtube.com/watch?v=2XI9dmhL_1o"];

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

	creditstitle = new FlxSprite(175, 10).loadGraphic(Paths.image('credits/title'));
	creditstitle.antialiasing = false;
	creditstitle.updateHitbox();
	add(creditstitle);

	arrows = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/menuuiarrows'));
	arrows.antialiasing = false;
	arrows.updateHitbox();
	add(arrows);

     devname = new FlxText(650, 250, 500, "DEVNAME", 0);
     devname.setFormat(Paths.font("vcr.ttf"), 45, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     devname.borderColor = 0xFF06000C;
     devname.borderSize = 3;
     add(devname);

     thingsdone = new FlxText(650, 300, 400, "DEVTHINGS", 0);
     thingsdone.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     thingsdone.borderColor = 0xFF06000C;
     thingsdone.borderSize = 3;
     add(thingsdone);

	devs = new FlxSprite(250, 250).loadGraphic(Paths.image('credits/devs/'+Selected));
	devs.scrollFactor.set(0, 0);
	add(devs);

}

function update() {	
	devs.loadGraphic(Paths.image('credits/devs/'+Selected));

	if (controls.LEFT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (controls.RIGHT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}
	if (FlxG.keys.justPressed.ENTER) {
		CoolUtil.openURL(links[Selected]);
	}
	if (Selected == 0) {
		devname.text = 'MeltyKelpy';
		thingsdone.text = 'Artist\nCoder\nCharter\nDirector ig\nVA\n\n"soup, if you dont like these sprites Ill kill myself"';
	}
	if (Selected == 1) {
		devname.text = 'NullFrequency';
		thingsdone.text = 'Musician\nCoder\n\n\n\n\n"Roses are red, violets are blue, Im going to KILL YOU!!!!!"';
	}
	if (Selected == 2) {
		devname.text = 'AussieDoesThings';
		thingsdone.text = 'Musician\nVA\nChromatic Maker\n\n\n\n"thats not a cloud, were in someones balls!"';
	}
	if (Selected == 3) {
		devname.text = 'GhostyBrick';
		thingsdone.text = 'Charter\nMade DudeMan (The Character)\n\n\n\n"if my hurt didnt throat so much"';
	}
	if (Selected == 4) {
		devname.text = 'kosejumpscare';
		thingsdone.text = 'Musician\nVA\n\n\n\n\n"Its unbelievable how much incest anime I know"';
	}
	if (Selected == 5) {
		devname.text = 'CherriBlossom';
		thingsdone.text = 'Artist\nVA\n\n\n\n\n"IS THAT MY commission"';
	}
	if (Selected == 6) {
		devname.text = 'Antydote';
		thingsdone.text = 'VA (of themself)\nBurger King Employee\n\n\n\n\n"HOLY SHIT IS THAT DX FROM GAMEBREAK- Du- OH MY- that should be my qoute"';
	}
	if (Selected == 7) {
		devname.text = 'Missy';
		thingsdone.text = 'Artist\n\n\n\n\n\n"missing: i scaM KIDS  so i can feedmy gambling addictiion"';
	}
	if (Selected == 8) {
		devname.text = 'R3t1xTheIDIOT';
		thingsdone.text = 'Musician\nCoder\n\n\n\n\n"god dammit ghost, the world doesnt need to know about how i fill my holes. kms"';
	}
	if (Selected == 9) {
		devname.text = 'CazTheClown';
		thingsdone.text = 'Artist\n\n\n\n\n\n"Man- just.. oh my fucking god give me a sec, I just murdered a family of 4"';
	}
	if (Selected == 10) {
		devname.text = 'Saayo';
		thingsdone.text = 'Artist\nVA\nChromatic Maker\n\n\n\n"booty thick"';
	}
	if (Selected == 11) {
		devname.text = 'Angeltheboi';
		thingsdone.text = 'Charter\nVA\n\n\n\n\n"I smeared doodoo all over the wall"';
	}
	if (Selected == 12) {
		devname.text = 'That1Gamer';
		thingsdone.text = 'Artist\n\n\n\n\n\n"fuck my heterosexuality"';
	}
	if (Selected > 12) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 12;
	}
	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}