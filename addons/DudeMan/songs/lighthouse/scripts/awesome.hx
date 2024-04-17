function create() {
}

function stepHit(curStep:Int) { //this is all template btw lol so
    switch (curStep) {
        case 0: 
        defaultCamZoom = 1;
        case 352: 
        defaultCamZoom = 1.2;
        case 368: 
        defaultCamZoom = 0.9;
        case 384: 
        defaultCamZoom = 1.6;
        case 512: 
	FlxG.camera.zoom += 0.3;
        case 640: 
        defaultCamZoom = 1;
        }
}