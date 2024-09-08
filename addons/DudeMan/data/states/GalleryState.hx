import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;
import funkin.backend.utils.DiscordUtil;

public var sectionselected;
var Selected = 0;
var chars = 0;
var paintingsOrder = [
	"titlescreen",
	"mainmenu",
	"natsukiadventure",
	"penkaru",
	"cclogo",
	"why",
	"walkerplaceholders",
	"oni",
	"oldfreeplay",
	"turkeytime",
	"burningdog",
	"dudetuah",
];
var paintToDisplay = null;

function create() {

	DiscordUtil.changePresenceAdvanced({
		details: "IN: The Gallery",
		state: "This goat browsing my gallery",
		largeImageKey: "icon"
	});


	chars = FlxG.random.int(0,1);

	CoolUtil.playMusic(Paths.music('gallery'), 1, true);

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

}

function beatHit() {

	if (curStep % 8 == 0){
		walkingchars.y = 430;
    }

}

function update() {	

	if (FlxG.save.data.angelsDream == true) {
		walkingchars.loadGraphic(Paths.image('gallery/walkers/angel'));
		paintToDisplay = "angel";
	}
	else {
		walkingchars.loadGraphic(Paths.image('gallery/placeholders/'+chars));
	}

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
	switch(paintToDisplay) {
		case "penkaru":
			paintings.loadGraphic(Paths.image('gallery/paintings/penkaru'));
			text.text = 'I made this image as a joke and they told me to kill myself \n- Mel';
		case "cclogo":
			paintings.loadGraphic(Paths.image('gallery/paintings/cclogo'));
			text.text = 'unused asset from Code of Misconduct, it was originally gonna show up as a transition between the main section and the CertainContext style sprites, but i just ended up not doing it. you can actually still find this in the visuals folder under images/visuals/misconduct !';
		case "why":
			paintings.loadGraphic(Paths.image('gallery/paintings/whythefuck'));
			text.text = 'I dont know why the fuck this shit is in the files bro. well, i do technically. raven added it to the files for some reason and I dont know why, it wasnt even that funny man. I swear im going to bite his ears off mark my words.';
		case "christmasturkey":
			paintings.loadGraphic(Paths.image('gallery/paintings/santa'));
			text.text = 'heh. that moment when you realised santa FUCKED the christmas turkey \n- frumpo';
		case "burningdog":
			paintings.loadGraphic(Paths.image('gallery/paintings/burningdog'));
			text.text = 'HELP MEEEEE IM BURNNNNIINNNGGGGGGG HELPPPPPP MEEEEEEE \n- burning dog';
		case "walkerplaceholders":
			paintings.loadGraphic(Paths.image('gallery/paintings/galleryplaceholders'));
			text.text = 'placeholder images we used for the guys who walk across the gallery ! I wanted to start coding, but I also didnt wanna draw yet, so these were the placeholder images we used ! quite silly. I love you four and x bfb <3';
		case "titlescreen":
			paintings.loadGraphic(Paths.image('gallery/paintings/titlescreen'));
			text.text = 'The old dudeman title screen from V1, it was originally just the yoshicrafter engine logo ( rest in terror ) covered up by DUDEMAN MOD and it had some scrolling background. nothing much honestly';
		case "mainmenu":
			paintings.loadGraphic(Paths.image('gallery/paintings/mainmenu'));
			text.text = 'the old dudeman main menu also from V1, its got a little bf and dudeman ! this was back from when it was just a gift for ghost and only had a freeplay section since there was no story ( oh, I cant believe it was ever like that now. ) idk man theres not alot to say about it';
		case "angel":
			paintings.loadGraphic(Paths.image('gallery/paintings/theboi'));
			text.text = 'the boi is coming.';
		case "oni":
			paintings.loadGraphic(Paths.image('gallery/paintings/oni'));
			text.text = 'what the fuck did they do to puzzle';
		case "turkeytime":
			paintings.loadGraphic(Paths.image('gallery/paintings/angellisa'));
			text.text = 'why is my turk. turk. turk. turkey. want to see my turkey? yup. thats the answer. look my turkey. its so. big and yummy. im turkey. call me turkey. - Angel';
		case "natsukiadventure":
			paintings.loadGraphic(Paths.image('gallery/paintings/natsukiadventure2'));
			text.text = "drawing my pal Spells did after seeing kathy's dating simulator outfit, thought it deserved a spot in the gallery because its rly silly";
		case "oldfreeplay":
			paintings.loadGraphic(Paths.image('gallery/paintings/oldfreeplay'));
			text.text = "the original concept image for freeplay selector menu, idk why it looked like that LMAO";
		case "dudetuah":
			paintings.loadGraphic(Paths.image('gallery/paintings/amycross'));
			text.text = '"DUDE TUAH! SPIT ON THAT MAN!"\n\nthis is the line that got aussie put on a cross.\n\nit is right beside the whopper sprites so i can put it here';
	
			//	default:
//		
//		
	}

	if (Selected > paintingsOrder.length - 1) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = paintingsOrder.length - 1;
	}

	paintToDisplay = paintingsOrder[Selected];

	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new MainMenuState());
	}
}
