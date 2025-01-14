import funkin.options.OptionsMenu;
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.DiscordUtil;

var SelectedButton = 0;

function postCreate() {

	DiscordUtil.changePresenceAdvanced({
		details: "IN: The MainMenu",
		state: "This goat in my main menu <3",
		largeImageKey: "icon"
	});
	
    magenta.destroy();

	FlxG.save.data.weeksSelected = 0;

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

	buttons = new FlxSprite(0, 0).loadGraphic(Paths.image('mainmenu/'+FlxG.save.data.language+'/'+SelectedButton));
	buttons.scrollFactor.set(0, 0);
	add(buttons);

}

function postUpdate() {
    if (FlxG.keys.justPressed.F7) {
        FlxG.switchState(new ModState('ResultsState'));
    }
}

function update() {	
	mans.loadGraphic(Paths.image('mainmenu/dudes/'+SelectedButton));
	buttons.loadGraphic(Paths.image('mainmenu/'+FlxG.save.data.language+'/'+SelectedButton));

	if (controls.BACK) {
	FlxG.sound.play(Paths.sound('cancel'));
	FlxG.switchState(new ModState("DudeTitleScreen"));
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
	if (FlxG.keys.justPressed.D) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("DaxGalleryState"));
   	}
	if (FlxG.keys.justPressed.O) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new OptionsMenu());
   	 	}
	if (SelectedButton == 0 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
   	 	FlxG.switchState(new ModState("StoryState"));
   	 	}
	if (SelectedButton == 1 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("FreeplaySelector"));
   	 	}
	if (SelectedButton == 2 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("DudeOptionsState"));
   	 	}
	if (SelectedButton == 3 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("CreditsState"));
   	 	}
	if (SelectedButton == 4 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("GalleryState"));
   	 	}	
	if (SelectedButton == 5 && controls.ACCEPT) {
		FlxG.sound.play(Paths.sound('confirm'));
		FlxG.switchState(new ModState("DLCMenu"));
		}		
	}