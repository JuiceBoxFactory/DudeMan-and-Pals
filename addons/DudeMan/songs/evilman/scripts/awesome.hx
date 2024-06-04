import flixel.text.FlxTextBorderStyle;

function create() {

    image = new FlxSprite(-500, 150);
    image.loadGraphic(Paths.image("visuals/my thinking face/myThinkingFace"));
    image.cameras = [camHUD];
    add(image);

    shit = new FlxText(-600, 500, Std.int(image.width));
    shit.text = "this my thinking face :fire:";
    shit.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
    shit.cameras = [camHUD];
    shit.color = 0xFFFFFFFF;
    shit.borderColor = 0xFF000000;
    shit.antialiasing = false;
    shit.borderSize = 2;
    add(shit);
    
}

function stepHit(curStep:Int) { //this is all template btw lol so
    switch (curStep) {
        case 0:
            defaultCamZoom = 1.6; 
        case 240:
            defaultCamZoom = 2.0; 
        case 256:
            FlxTween.tween(image, {x: 435}, 2.5, {ease: FlxEase.quartOut}); 
            FlxTween.tween(shit, {x: 435}, 2.8, {ease: FlxEase.quartOut}); 
            defaultCamZoom = 1.6; 
        case 290:
            FlxTween.tween(image, {x: 1335}, 1.5, {ease: FlxEase.quartIn}); 
            FlxTween.tween(shit, {x: 1335}, 1.8, {ease: FlxEase.quartIn}); 
        case 516:
            image.loadGraphic(Paths.image("visuals/my thinking face/myImports"));
            shit.text = "do you like my imports sunglasses emoji";
            FlxTween.tween(image, {x: 435}, 2.5, {ease: FlxEase.quartOut}); 
            FlxTween.tween(shit, {x: 435}, 2.8, {ease: FlxEase.quartOut});  
        case 585:
            FlxTween.tween(image, {x: -500}, 1.5, {ease: FlxEase.quartIn}); 
            FlxTween.tween(shit, {x: -700}, 1.8, {ease: FlxEase.quartIn}); 
	}
}