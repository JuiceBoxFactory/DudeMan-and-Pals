import funkin.options.OptionsMenu;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import discord_rpc.DiscordRpc;
var SelectedButton = 0;

function create() {
    	DiscordUtil.changePresence("goat, u in the main menu", null);
    	}

function postCreate(){
    magenta.destroy();

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	buttonbg = new FlxSprite(0, 0).loadGraphic(Paths.image('mainmenu/buttonbg'));
	buttonbg.scrollFactor.set(0, 0);
	add(buttonbg);

	mans = new FlxSprite(0, 0).loadGraphic(Paths.image('mainmenu/dudes/'+SelectedButton));
	mans.scrollFactor.set(0, 0);
	add(mans);

}

function update() {	
    	DiscordUtil.changePresence("goat, u in the main menu", null);
	mans.loadGraphic(Paths.image('mainmenu/dudes/'+SelectedButton));

	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	}
	if (controls.UP_P) {
		SelectedButton -= 1;
	}
	if (controls.DOWN_P) {
		SelectedButton += 1;
	}
	if (SelectedButton > 5) {
		SelectedButton = 0;
	}
	if (SelectedButton < 0) {
		SelectedButton = 5;
	}
	if (SelectedButton == 0 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
   	 	FlxG.switchState(new StoryMenuState());
   	 	}
	if (SelectedButton == 1 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("FreeplaySelector"));
   	 	}
	if (SelectedButton == 2 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new OptionsMenu());
   	 	}
	if (SelectedButton == 3 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("CreditsState"));
   	 	}
	if (SelectedButton == 4 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("GalleryState"));
   	 	}		
	}