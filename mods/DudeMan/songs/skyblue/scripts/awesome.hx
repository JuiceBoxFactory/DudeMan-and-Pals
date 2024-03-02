import funkin.game.HudCamera;

var shit = new CustomShader("shit");

function postCreate() {
	print(shit);
}

function stepHit(curStep:Int) { //this is all template btw lol so
    switch (curStep) {
       case 16: 
       defaultCamZoom = 1.8;
	case 255:
	camGame.addShader(shit);
	camHUD.addShader(shit);
	case 319:
	camGame.removeShader(shit);
	camHUD.removeShader(shit);
	}
}