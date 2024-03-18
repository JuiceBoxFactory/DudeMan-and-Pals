public var sectionselected = 0;

function new() {
    window.title = 'DudeMan and... PALS???';
    window.setIcon(Image.fromBytes(File.getBytes('mods/DudeMan/data/modIcon.png')));
}
function update(elapsed) {
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();
        }