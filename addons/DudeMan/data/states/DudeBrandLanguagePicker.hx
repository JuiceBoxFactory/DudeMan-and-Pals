import flixel.FlxCamera;
import flixel.util.FlxSave;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;

var popUpOPEN = false;
var subStateOpen = false;
var languagePicked = "english";
var scroll = 0;

function create() {

	popUpCamera = new FlxCamera(0, 0, 1280, 720);
	popUpCamera.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(popUpCamera, false);

	cursorCam = new FlxCamera(0, 0, 1280, 720);
	cursorCam.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(cursorCam, false);

	coolBackdropPOP = new FlxBackdrop(Paths.image('ui/bg'));
	coolBackdropPOP.moves = true;
	coolBackdropPOP.scrollFactor.set(0, 0);
	coolBackdropPOP.velocity.x = 20;
	coolBackdropPOP.velocity.y = 20;
	coolBackdropPOP.active = true;
	coolBackdropPOP.cameras = [popUpCamera];
	coolBackdropPOP.alpha = 0;
	add(coolBackdropPOP);

	englishButton = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/button'));
	englishButton.scrollFactor.set(0, 0);
	englishButton.cameras = [popUpCamera];
	englishButton.scale.set(1, 1);
	englishButton.alpha = 0;
	englishButton.updateHitbox();
	add(englishButton);

	englishButton = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/button'));
	englishButton.scrollFactor.set(0, 0);
	englishButton.cameras = [popUpCamera];
	englishButton.scale.set(1, 1);
	englishButton.alpha = 0;
	englishButton.updateHitbox();
	add(englishButton);

	englishButtonText = new FlxText(100, 100, 450);
	englishButtonText.text = "English";
	englishButtonText.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	englishButtonText.cameras = [popUpCamera];
	englishButtonText.color = 0xFF130022;
	englishButtonText.antialiasing = false;
	englishButtonText.borderSize = 2.25;
	englishButtonText.alpha = 0;
	add(englishButtonText);

    espanolButton = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/button'));
	espanolButton.scrollFactor.set(0, 0);
	espanolButton.cameras = [popUpCamera];
	espanolButton.scale.set(1, 1);
	espanolButton.alpha = 0;
	espanolButton.updateHitbox();
	add(espanolButton);

    espanolButtonText = new FlxText(100, 100, 450);
	espanolButtonText.text = "Español";
	espanolButtonText.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	espanolButtonText.cameras = [popUpCamera];
	espanolButtonText.color = 0xFF130022;
	espanolButtonText.antialiasing = false;
	espanolButtonText.borderSize = 2.25;
	espanolButtonText.alpha = 0;
	add(espanolButtonText);

	englishButtonText = new FlxText(100, 100, 450);
	englishButtonText.text = "English";
	englishButtonText.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center");            
	englishButtonText.cameras = [popUpCamera];
	englishButtonText.color = 0xFF130022;
	englishButtonText.antialiasing = false;
	englishButtonText.borderSize = 2.25;
	englishButtonText.alpha = 0;
	add(englishButtonText);

	warningTextPOP = new FlxText(50, 25, 450);
	warningTextPOP.text = "pick ur language prty plz";
	warningTextPOP.setFormat(Paths.font("COMIC.ttf"), 25, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	warningTextPOP.cameras = [popUpCamera];
	warningTextPOP.color = 0xFF130022;
	warningTextPOP.antialiasing = false;
	warningTextPOP.borderSize = 2.25;
	warningTextPOP.alpha = 0;
	add(warningTextPOP);

	popBorder = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/border'));
	popBorder.scrollFactor.set(0, 0);
	popBorder.cameras = [popUpCamera];
	popBorder.scale.set(1, 1);
	popBorder.alpha = 0;
	add(popBorder);

    popUpPos = new FlxSprite(350, 50).makeGraphic(550, 600, FlxColor.WHITE);
    popUpPos.alpha = 0;
	add(popUpPos);

	cursor = new FlxSprite(0, 0).loadGraphic(Paths.image('game/cursor'));
    cursor.cameras = [cursorCam];
    add(cursor);

    popUp("open");


}

function update() {

    if (FlxG.mouse.overlaps(popUpPos)) {
        if (FlxG.mouse.wheel < 0) {
            for (buttons in [englishButton, espanolButton]) {
                buttons.y -= 20;
            }
            for (buttonText in [englishButtonText, espanolButtonText]) {
                buttonText.y -= 20;
            }

            scroll -= 1;
        }
        if (FlxG.mouse.wheel > 0 && scroll != 0) {
            for (buttons in [englishButton, espanolButton]) {
                buttons.y += 20;
            }
            for (buttonText in [englishButtonText, espanolButtonText]) {
                buttonText.y += 20;
            }

            scroll += 1;
        }
    }

    cursor.x = FlxG.mouse.screenX;
    cursor.y = FlxG.mouse.screenY;

	if (popUpOPEN && FlxG.mouse.justPressed) {
		if (FlxG.mouse.overlaps(englishButton)) {
			languagePicked = "english";
            pickLanguage();
		}
        if (FlxG.mouse.overlaps(espanolButton)) {
			languagePicked = "spanish";
            pickLanguage();
		}
	}
    

}

function pickLanguage() {
    popUp("close");
	FlxG.save.data.language = languagePicked;
    new FlxTimer().start(1.5, function(timer) {
        FlxG.switchState(new ModState("BetaWarningState"));
    });
}

function popUp(openclose) {

	switch (openclose) {
		case "open":
			popUpCamera.x = 350;
			popUpCamera.y = 50;
			popUpCamera.width = 550;
			popUpCamera.height = 600;
			popBorder.scale.set(5.55, 6.1);
			popBorder.x = 225;
			popBorder.y = 255;

			warningTextPOP.scale.set(0.001, 0.001);
			englishButtonText.scale.set(0.001, 0.001);
			warningTextPOP.alpha = 1;

            for (buttons in [englishButton, espanolButton]) {
                buttons.scale.set(0.001, 0.001);
			    buttons.alpha = 1;
            }
            for (buttonTexts in [englishButtonText, espanolButtonText]) {
                buttonTexts.scale.set(0.001, 0.001);
			    buttonTexts.alpha = 1;
            }

			englishButton.x = 495;
			englishButton.y = 155;
            englishButton.offset.set(350, 50);
            englishButtonText.x = 60;
			englishButtonText.y = englishButton.y - 25;

            espanolButton.x = 495;
			espanolButton.y = 255;
            espanolButton.offset.set(350, 50);
            espanolButtonText.x = 60;
			espanolButtonText.y = espanolButton.y - 25;

            
            for (buttons in [englishButton, espanolButton]) {
			    FlxTween.tween(buttons.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
            }
            for (buttonTexts in [englishButtonText, espanolButtonText]) {
			    FlxTween.tween(buttonTexts.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
            }

			FlxTween.tween(warningTextPOP.scale, {x: 1, y: 1}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(coolBackdropPOP, {alpha: 1}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(popBorder, {alpha: 1}, 1, {ease: FlxEase.quartOut});

			popUpOPEN = true;
			subStateOpen = true;

		case "close":

        for (buttons in [englishButton, espanolButton]) {
            FlxTween.tween(buttons.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
        }
        for (buttonTexts in [englishButtonText, espanolButtonText]) {
            FlxTween.tween(buttonTexts.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
        }

			FlxTween.tween(warningTextPOP.scale, {x: 0.001, y: 0.001}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(coolBackdropPOP, {alpha: 0}, 1, {ease: FlxEase.quartOut});
			FlxTween.tween(popBorder, {alpha: 0}, 1, {ease: FlxEase.quartOut});

			subStateOpen = false;
			popUpOPEN = false;
		
	}

}