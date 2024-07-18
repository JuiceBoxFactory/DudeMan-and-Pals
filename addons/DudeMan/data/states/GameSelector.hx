import flixel.ui.FlxButton;
import flixel.util.FlxSave;

function create() {

    FlxG.save.data.noTransition = false;

    button1 = new FlxButton(850, 102, "Dating Sim", loadDating);
    button1.alpha = 1;
    add(button1);

    button2 = new FlxButton(850, 127, "Puncher", loadPuncher);
    button2.alpha = 1;
    add(button2);
    
    button3 = new FlxButton(850, 152, "Fnaf Fangame", loadFnaf);
    button3.alpha = 1;
    add(button3);

    button4 = new FlxButton(850, 177, "2D Platformer", loadPlatformer);
    button4.alpha = 1;
    add(button4);

    cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    add(cursor);

    radioLoad();
    
}

function loadDating() {
    FlxG.switchState(new ModState("GAMES/datingSimTitle"));
}
function loadPuncher() {
    FlxG.switchState(new ModState("GAMES/clicker"));
}
function loadFnaf() {
    FlxG.switchState(new ModState("GAMES/FNAF/titleScreen"));
}
function loadPlatformer() {
    FlxG.switchState(new ModState("GAMES/FNAF/titleScreen")); //lol
}

function update() {
    
    FlxG.mouse.visible = false;

    cursor.x = FlxG.mouse.x;
    cursor.y = FlxG.mouse.y;

    if (FlxG.keys.justPressed.G) {
        FlxG.save.data.hasPlayedBefore = false;
    }

    if (controls.BACK) {
        FlxG.switchState(new ModState("FreeplaySelector"));
    }

}


function radioLoad() {

	FlxG.save.data.radioChannels = [
		"dudecast (and kathy)",
		"CHANNEL NAME HERE 2",
		"CHANNEL NAME HERE 3",
		"Sounds from the Stars",
		"jumpscareFM",
        "Conspirator Central",
        "CHANNEL NAME HERE 7",
	];

    FlxG.save.data.songNamesArtists = [
		"how it feels to see beauty.\nmaurice gray",
		"3am\nAussieDoesThings",
	];

    FlxG.save.data.radioChannelHostAmount = [
		1, // dudecast
        1, // unnamed 2
        1, // unnamed 3
        1, // SOUNDS FROM THE STARS :DDDDDDDD
        1, // jumpscareFM
        1, // Conspirator Central
        1, // unnnamed 7
	];

}