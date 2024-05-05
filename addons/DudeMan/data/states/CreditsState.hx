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
"https://x.com/_MissyIsSilly_",
"https://twitter.com/R3t1xidiot",
"https://twitter.com/caz_arc",
"https://twitter.com/Saaaaayoo/status/1721544057179033853",
"https://twitter.com/angelthetweetb1"
"https://www.youtube.com/watch?v=2XI9dmhL_1o"
"https://twitter.com/OJStheCoder"
"https://www.youtube.com/@corva_tile/featured",
"https://twitter.com/antyd0te",
"https://docs.google.com/document/d/1zh0LEnsax3X8rIq6Q4idqno3d9Dp8YIEWwRH8b8iQiE/edit",
"https://twitter.com/Frump0",
"https://twitter.com/Strang3_x3",
"https://www.youtube.com/@CrispsCrispulent",
"https://twitter.com/7_Veeh"];

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

     catname = new FlxText(390, 175, 500, "CATNAME", 0);
     catname.setFormat(Paths.font("COMIC.ttf"), 45, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     catname.borderColor = 0xFF06000C;
     catname.borderSize = 3;
     add(catname);

     devname = new FlxText(650, 250, 500, "DEVNAME", 0);
     devname.setFormat(Paths.font("COMIC.ttf"), 45, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     devname.borderColor = 0xFF06000C;
     devname.borderSize = 3;
     add(devname);

     thingsdone = new FlxText(650, 310, 400, "DEVTHINGS", 0);
     thingsdone.setFormat(Paths.font("COMIC.ttf"), 22, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     thingsdone.borderColor = 0xFF06000C;
     thingsdone.borderSize = 3;
     add(thingsdone);

	devs = new FlxSprite(250, 250).loadGraphic(Paths.image('credits/devs/melty'));
	devs.scrollFactor.set(0, 0);
	add(devs);

}

function update() {	
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
	if (Selected < 14) {
	catname.text = 'Devs';	
	}
	if (Selected > 13) {
	catname.text = 'Guests';	
	}
	switch(Selected) {
	case 0:
		devs.loadGraphic(Paths.image('credits/devs/melty'));
		devname.text = 'MeltyKelpy';
		thingsdone.text = 'Artist\nCoder\nCharter\nDirector ig\nVA\n\n"someone called me acoustic. like, just call me a slur PLEASE"';
	case 1:
		devs.loadGraphic(Paths.image('credits/devs/dumbfag'));
		devname.text = 'NullFrequency';
		thingsdone.text = 'Musician\nCoder\n\n\n\n\n"Roses are red, violets are blue, Im going to KILL YOU!!!!!"';
	case 2:
		devs.loadGraphic(Paths.image('credits/devs/aussie'));
		devname.text = 'AussieDoesThings';
		thingsdone.text = 'Musician\nVA\nChromatic Maker\n\n\n\n"thats not a cloud, were in someones balls!"';
	case 3:
		devs.loadGraphic(Paths.image('credits/devs/ghost'));
		devname.text = 'GhostyBrick';
		thingsdone.text = 'Artist\nCharter\nMade DudeMan (The Character)\n\n\n"if my hurt didnt throat so much"';
	case 4:
		devs.loadGraphic(Paths.image('credits/devs/kose'));
		devname.text = 'kosejumpscare';
		thingsdone.text = 'Musician\nVA\n\n\n\n\n"Its unbelievable how much incest anime I know"';
	case 5:
		devs.loadGraphic(Paths.image('credits/devs/cherri'));
		devname.text = 'CherriBlossom';
		thingsdone.text = 'Artist\nVA\n\n\n\n\n"IS THAT MY commission"';
	case 6:
		devs.loadGraphic(Paths.image('credits/devs/missy'));
		devname.text = 'Missy';
		thingsdone.text = 'Artist\n\n\n\n\n\n"i do da funni pixel art :) i would plug my mod here but melty would strangle me in a non-kinky way."';
	case 7:
		devs.loadGraphic(Paths.image('credits/devs/twix'));
		devname.text = 'R3t1xTheIDIOT';
		thingsdone.text = 'Musician\nCoder\n\n\n\n\n"god dammit ghost, the world doesnt need to know about how i fill my holes. kms"';
	case 8:
		devs.loadGraphic(Paths.image('credits/devs/caz'));
		devname.text = 'CazTheClown';
		thingsdone.text = 'Artist\n\n\n\n\n\n"Man- just.. oh my fucking god give me a sec, I just murdered a family of 4"';
	case 9:
		devs.loadGraphic(Paths.image('credits/devs/saayo'));
		devname.text = 'Saayo';
		thingsdone.text = 'Artist\nVA\nChromatic Maker\n\n\n\n"booty thick"';
	case 10:
		devs.loadGraphic(Paths.image('credits/devs/angel'));
		devname.text = 'Angeltheboi';
		thingsdone.text = 'Charter\nVA\n\n\n\n\n"I smeared doodoo all over the wall"';
	case 11:
		devs.loadGraphic(Paths.image('credits/devs/gamer'));
		devname.text = 'That1Gamer';
		thingsdone.text = 'Artist\n\n\n\n\n\n"fuck my heterosexuality"';
	case 12:
		devs.loadGraphic(Paths.image('credits/devs/oj'));
		devname.text = 'OJSTheCoder';
		thingsdone.text = 'Musician\n\n\n\n\n\n"lalalala uhm bbaba..uh.. FUCK"';
	case 13:
		devs.loadGraphic(Paths.image('credits/devs/corva'));
		devname.text = 'Corva_Tile';
		thingsdone.text = 'Coder\nMusician\nVA\nAsset Maker\nCharter(?)\n\n"Dudeman? Like the piggy character"';
	case 14:
		devs.loadGraphic(Paths.image('credits/devs/anty'));
		devname.text = 'Antydote';
		thingsdone.text = 'VA (of themself)\nBurger King Employee\n\n\n\n\n"HOLY SHIT IS THAT DX FROM GAMEBREAK- Du- OH MY- that should be my qoute"';
	case 15:
		devs.loadGraphic(Paths.image('credits/devs/kozmo'));
		devname.text = 'Kozmorama';
		thingsdone.text = 'My dear friend,\nOriginally was gonna code the website\nhowever, that never got to happen\nI hope the stars are nice up there Kozmo.\nheres their qoute, cuz I think they d want me to keep it.\n"im gonna cut open my scrotum and juggle my testicles"';
	case 16:
		devs.loadGraphic(Paths.image('credits/devs/frumpo'));
		devname.text = 'frumpo';
		thingsdone.text = 'Artist I think\n\n\n\n\n\n"Oink :pig2:"';
	case 17:
		devs.loadGraphic(Paths.image('credits/devs/spencer'));
		devname.text = 'StrangeX3';
		thingsdone.text = 'Artist\nVA\n\n\n\n\n"Youre working on the Dude who is like a Man"';
	case 18:
		devs.loadGraphic(Paths.image('credits/devs/crisps'));
		devname.text = 'Crisps';
		thingsdone.text = 'did the fuckin uhhh GameOver Song\n\n\n\n\n\n"Made this for a friend, didnt end up getting used beforehand so its nice to see it being used now :]"';
	case 19:
		devs.loadGraphic(Paths.image('credits/devs/Veeehhhrr'));
		devname.text = 'Veeehhhrr';
		thingsdone.text = 'stole cammove code from them n modified it\n\n\n\n\nNo Qoute Given ( I didnt ask them )';
//	default:
//		devname.text = 'this person doesnt exist';
//		thingsdone.text = 'my penis is so big :3';
	}
	if (Selected > 19) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 19;
	}
	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}