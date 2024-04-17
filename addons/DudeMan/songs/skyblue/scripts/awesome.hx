import funkin.game.HudCamera;

var shit = new CustomShader("shit");

function postCreate() {

	hypercamLogo = new FlxSprite(0, 0).loadGraphic(Paths.image('visuals/sb/Hypercam_2_watermark'));
	hypercamLogo.antialiasing = false;
	hypercamLogo.scale.set(0.5, 0.5);
	hypercamLogo.scrollFactor.set(0, 0);
	hypercamLogo.alpha = 0;
	hypercamLogo.cameras = [camHUD];
	hypercamLogo.updateHitbox();
	insert(99, hypercamLogo);

}

function stepHit(curStep:Int) { //this is all template btw lol so
    switch (curStep) {
        case 0: 
        defaultCamZoom = 1.8;
        case 256: 
        defaultCamZoom = 1.1;
        case 320: 
        defaultCamZoom = 1.8;
        case 512: 
        defaultCamZoom = 1.1;
        case 629: 
        defaultCamZoom = 1.8;
	case 255:
	hypercamLogo.alpha = 1;
	camGame.addShader(shit);
	camHUD.addShader(shit);
	case 319:
	hypercamLogo.alpha = 0;
	camGame.removeShader(shit);
	camHUD.removeShader(shit);
	}
}