import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;

static var initialized:Bool = false;

function new() {
    window.title = 'DudeMan and... PALS???';
    window.setIcon(Image.fromBytes(Assets.getBytes('assets/data/modIcon.png')));
	// the mod icon doesnt work ?? - melty
	// yes it does - corva
	// oh you're right actually it does wtf - melty
}

function update(elapsed) {

	FlxG.mouse.visible = false;

	// DEFAULT SAVE DATA.. if u wanna fck wit it !!! - Melty
	if (FlxG.save.data.defaultSaveData == null) {
		FlxG.save.data.selectorButtonsUnlocked = 3; // max is 5, however you can only unlock up to 4.... >:] ( its just a scrapped thing, doesnt do anything )
		FlxG.save.data.dudemailsUnlocked = 0; // max is [number will be put here later], however you only unlock up to [number will be put here later], so fuck around to your hearts content, dataminer ! 
		FlxG.save.data.language = null; // what do u think it does man
		FlxG.save.data.defaultSaveData = false;
	}
	// dudeman condems this behaviour - dudeman
	// I DIDNT WRITE THAT - the real dudeman
	// yes I did - dudeman

	// DEFAULT SETTINGS ! theres not alot you can do this with lol
	if (FlxG.save.data.wheresGarfield == null) {
		// gameplay settings
		FlxG.save.data.downscroll = false;
		FlxG.save.data.dudeRating = true;
		FlxG.save.data.ghosttap = true;
		FlxG.save.data.notebounce = true;
		FlxG.save.data.middlescroll = false;
		FlxG.save.data.subtitles = true;
		FlxG.save.data.camMove = true;
		// accessibility settings
		FlxG.save.data.language == null;
		// secret settings
		FlxG.save.data.debug = false;
		FlxG.save.data.xbox = false;
		FlxG.save.data.horse = false;
		FlxG.save.data.baldiStyle = false;
		FlxG.save.data.hitsounds = false;
		FlxG.save.data.geomtery = false;
		FlxG.save.data.nightmare = false;
		FlxG.save.data.goodCamera = false;
		FlxG.save.data.MelTabs = false;
		FlxG.save.data.burger = false;
		FlxG.save.data.ascend = false;
		FlxG.save.data.sillyLanguages = false;
		// other settings ( mail thems and shit )
		FlxG.save.data.mailTheme = "light";
		FlxG.save.data.wheresGarfield = false;
	}

	if (FlxG.keys.justPressed.F5) {
        FlxG.resetState();
		FlxG.mouse.visible = false;
        }
}