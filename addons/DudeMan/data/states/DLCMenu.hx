import Sys;

var output = [
    "",
    "",
    "",
    ""
];
var pointlessVar = (-1);

function create() {
    
    for (file in Paths.getFolderContent('addons/')) {

        pointlessVar += 1;

        output[pointlessVar] = ""+file;

        //trace(output[pointlessVar]);
        trace(file);

    }

}

function update() {

    if (controls.BACK) {
		FlxG.switchState(new MainMenuState());
	}

}