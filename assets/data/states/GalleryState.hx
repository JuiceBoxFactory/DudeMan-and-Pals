import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;
import flixel.util.FlxTimer;

public var sectionselected;
var Selected = 0;
var chars = 0;


function new() { 
    	   DiscordUtil.changePresence("goat, u lookin at art in the gallery", null);
}

function create() {

	chars = FlxG.random.int(0,1);

	FlxG.sound.playMusic(Paths.music('gallery'), 1, true);

	bg = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/bg'));
	bg.antialiasing = false;
	bg.scrollFactor.set(0, 0);
	add(bg);

	paintings = new FlxSprite(75, 50).loadGraphic(Paths.image('gallery/paintings/base'));
	paintings.antialiasing = false;
	paintings.scrollFactor.set(0, 0);
	add(paintings);

	stand = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/stand'));
	stand.antialiasing = false;
	stand.scrollFactor.set(0, 0);
	add(stand);

	walkingchars = new FlxSprite(1400, 410).loadGraphic(Paths.image('gallery/placeholders/'+chars));
	walkingchars.antialiasing = false;
	walkingchars.scale.set(1.2, 1.2);
	walkingchars.scrollFactor.set(0, 0);
	add(walkingchars);

	light = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/light'));
	light.antialiasing = false;
	light.scrollFactor.set(0, 0);
	add(light);

	arrows = new FlxSprite(15, 250).loadGraphic(Paths.image('gallery/arrows'));
	arrows.antialiasing = false;
	arrows.updateHitbox();
	add(arrows);

	txtbg = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/fortxt'));
	txtbg.antialiasing = false;
	txtbg.updateHitbox();
	add(txtbg);

     text = new FlxText(820, 70, 400, "DEVTHINGS", 0);
     text.setFormat(Paths.font("COMIC.ttf"), 29, FlxColor.BLACK, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
     text.borderColor = 0xFF06000C;
     text.borderSize = 0;
     add(text);

	new FlxTimer().start(0.85714285714, function(tmr:FlxTimer) {
		if (walkingchars.y != 450) {
		walkingchars.y = 440;
		}
	}, 600);

}

function update() {	
	walkingchars.loadGraphic(Paths.image('gallery/placeholders/'+chars));

	if (walkingchars.y > 410) {
		walkingchars.y -= 1;	
	}
	if (walkingchars.x > -700) {
		walkingchars.x -= 0.5;
	}
	if (walkingchars.x == -700) {
	     chars = FlxG.random.int(0,1);
		walkingchars.x = 1400;
	}
	if (controls.LEFT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (controls.RIGHT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}
	switch(Selected) {
	case 0:
		paintings.loadGraphic(Paths.image('gallery/paintings/penkaru'));
		text.text = 'I made this image as a joke and they told me to kill myself \n- Mel';
	case 1:
		paintings.loadGraphic(Paths.image('gallery/paintings/cclogo'));
		text.text = 'unused asset from Code of Misconduct, it was originally gonna show up as a transition between the main section and the CertainContext style sprites, but i just ended up not doing it. you can actually still find this in the visuals folder under images/visuals/misconduct !';
	case 2:
		paintings.loadGraphic(Paths.image('gallery/paintings/whythefuck'));
		text.text = 'I dont know why the fuck this shit is in the files bro. well, actually I do technically. raven added it to the files for some reason and I dont know why, it wasnt even that funny man. I swear im going to bite his ears off mark my words.';
	case 3:
		paintings.loadGraphic(Paths.image('gallery/paintings/santa'));
		text.text = 'heh. that moment when you realised santa FUCKED the christmas turkey \n- frumpo';
	case 4:
		paintings.loadGraphic(Paths.image('gallery/paintings/burningdog'));
		text.text = 'HELP MEEEEE IM BURNNNNIINNNGGGGGGG HELPPPPPP MEEEEEEE \n- burning dog';
	case 5:
		paintings.loadGraphic(Paths.image('gallery/paintings/galleryplaceholders'));
		text.text = 'placeholder images we used for the guys who walk across the gallery ! I wanted to start coding, but I also didnt wanna draw yet, so these were the placeholder images we used ! quite silly. I love you four and x bfb <3';
	case 6:
		paintings.loadGraphic(Paths.image('gallery/paintings/titlescreen'));
		text.text = 'The old dudeman title screen from V1, it was originally just the yoshicrafter engine logo ( rest in terror ) covered up by DUDEMAN MOD and it had some scrolling background. nothing much honestly';
	case 7:
		paintings.loadGraphic(Paths.image('gallery/paintings/mainmenu'));
		text.text = 'the old dudeman main menu also from V1, its got a little bf and dudeman ! this was back from when it was just a gift for ghost and only had a freeplay section since there was no story ( oh, I cant believe it was ever like that now. ) idk man theres not alot to say about it';
//	default:
//		
//		
	}
	if (Selected > 7) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 7;
	}
	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}
