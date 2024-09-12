
function create() {
    trace("ive been summoned");

    Downscroll = new FlxText(200, 300);
    Downscroll.text = "DELUXE DLC MAIN MENU HAS LOADED";
    Downscroll.setFormat(Paths.font("COMIC.ttf"), 50, FlxColor.WHITE, "left");            
    Downscroll.color = 0xFFFFFFFF;
    Downscroll.antialiasing = false;
    add(Downscroll);
}

function update() {

    if (controls.BACK) {
		FlxG.switchState(new ModState("DLCMenu"));
	}

}