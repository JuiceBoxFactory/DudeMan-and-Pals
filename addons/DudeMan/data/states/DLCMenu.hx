import sys.FileSystem;
import lime.graphics.Image;
import Sys;
import sys.io.File;
import StringTools;
import haxe.io.Path;

var output = [
    "",
    "",
    "",
    ""
];

var checkBlankNum = (-1);

function create() {

    Downscroll = new FlxText(200, 300);
    Downscroll.text = "DLCS FOUND:\n";
    Downscroll.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "left");            
    Downscroll.color = 0xFFFFFFFF;
    Downscroll.antialiasing = false;
    add(Downscroll);

    for (i in FileSystem.readDirectory("addons")) {

        trace(i);

        if (FileSystem.exists("addons/"+i+"/.dudelc")) {
            checkBlankNum += 1;
            var nameToShowNSTUFF = File.getContent("addons/"+i+"/DLCname.txt");
            output[checkBlankNum] = nameToShowNSTUFF;
            trace(output[checkBlankNum]);
            Downscroll.text = Downscroll.text +"\n"+output[checkBlankNum];
        }

    }

    Downscroll.text = Downscroll.text + "\n\nfor dev testing sake, you must press D to open \nthe first DLC folder's main menu";

}

function update() {

    if (controls.RIGHT_P) {
        var result = File.getContent("addons/"+output[0]+"/INITIALSTATE.txt");
        var resultPart2 = "addons/"+output[0]+"/data/states/"+result+".hx";
        trace(result);
        trace(resultPart2);
        if (FileSystem.exists(resultPart2)) {
            var path = new Path(result);
            trace(path.dir); // path/to
		    FlxG.switchState(new ModState(result));
        }
        else {
            trace("STATE DOES NOT EXIST, DID YOU PUT IN THE CORRECT NAMES?");
        }
	}

    if (controls.BACK) {
		FlxG.switchState(new MainMenuState());
	}

}