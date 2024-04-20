import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;

static var initialized:Bool = false;

function new() {
window.title = "Dudeman or whatever you wanna call it here!";
window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('whatever the icon name is!'))));
}
public var sectionselected = 0;

function new() {
    window.title = 'DudeMan and... PALS???';
    window.setIcon(Image.fromBytes(Assets.getBytes('assets/data/modIcon.png')));
}

function create() {

	if (FlxG.save.data.wheresGarfield == null) {
		FlxG.save.data.downscroll = false;
		FlxG.save.data.botplay = false;
		FlxG.save.data.ghosttap = true;
		FlxG.save.data.notebounce = true;
		FlxG.save.data.middlescroll = false;
		FlxG.save.data.debug = false;
		FlxG.save.data.xbox = false;
		FlxG.save.data.horse = false;
		FlxG.save.data.baldiStyle = false;
		FlxG.save.data.hitsounds = false;
		FlxG.save.data.geomtery = false;
		FlxG.save.data.nightmare = false;
		FlxG.save.data.goodCamera = false;
		FlxG.save.data.MelTabs = false;
		FlxG.save.data.subtitles = true;
		FlxG.save.data.camMove = true;
	}

}

function update(elapsed) {

    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();
        }