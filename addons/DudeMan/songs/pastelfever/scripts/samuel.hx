import flixel.text.FlxTextBorderStyle;

 function create() {

	remove(dad);
	remove(boyfriend);
	
	backdrop = new FlxSprite(200, -300).loadGraphic(Paths.image('backdrop/pastelfever/old/backdrop'));
	backdrop.antialiasing = false;
	backdrop.scrollFactor.set(2, 1);
	backdrop.scale.x = 2;
	backdrop.scale.y = 2;
	backdrop.alpha = 1;
	backdrop.updateHitbox();
	add(backdrop);
	
	ground = new FlxSprite(-100, 0).loadGraphic(Paths.image('backdrop/pastelfever/old/floor'));
	ground.antialiasing = false;
	ground.scale.x = 2;
	ground.alpha = 1;
	ground.updateHitbox();
	add(ground);

	backdroplam = new FlxSprite(20, 50).loadGraphic(Paths.image('backdrop/pastelfever/lamlam/back'));
	backdroplam.antialiasing = false;
	backdroplam.scrollFactor.set(1, 1);
	backdroplam.scale.x = 1;
	backdroplam.scale.y = 0.9;
	backdroplam.alpha = 0;
	backdroplam.updateHitbox();
	add(backdroplam);
		
	add(dad);
	add(boyfriend);

	text = new Character(110, 100, "text");
	text.flipX = false; 
	text.alpha = 0;
	add(text);
	soup = new Character(-650, 100, "soup");
	soup.flipX = false;
	soup.alpha = 0;
	add(soup);
	textlamlam = new Character(150, 100, "textlamlam");
	textlamlam.flipX = false; 
	textlamlam.alpha = 0;
	add(textlamlam);
	souplamlam = new Character(-670, 100, "souplamlam");
	souplamlam.flipX = false;
	souplamlam.alpha = 0;
	add(souplamlam);

	logo = new FlxSprite(375, -1000).loadGraphic(Paths.image('visuals/pf/pastelfeverlogo'));
	logo.antialiasing = false;
	logo.cameras = [camHUD];
	logo.scale.x = 2;
	logo.scale.y = 2;
	logo.updateHitbox();
	add(logo);

	logolam = new FlxSprite(350, -1000).loadGraphic(Paths.image('visuals/pf/lamlamlogo'));
	logolam.antialiasing = false;
	logolam.cameras = [camHUD];
	logolam.scale.x = 2;
	logolam.scale.y = 2;
	logolam.updateHitbox();
	add(logolam);

	white = new FlxSprite(0, -300).loadGraphic(Paths.image('white'));
	white.antialiasing = false;
	white.scale.x = 9;
	white.scale.y = 9;
	white.alpha = 0;
	white.updateHitbox();
	add(white);

	souptransition = new FlxSprite(200, 100);	
	souptransition.antialiasing = false;
	souptransition.frames = Paths.getSparrowAtlas('visuals/pf/transition');
	souptransition.animation.addByPrefix('switch', 'switch', 11);
	souptransition.animation.addByPrefix('shesnotthere', 'shessnothere', 11);
	souptransition.animation.play('shesnotthere');
	souptransition.scale.x = 0.7;
	souptransition.scale.y = 0.7;
	souptransition.scrollFactor.set(0, 0);
	souptransition.alpha = 1;
	souptransition.updateHitbox();
	add(souptransition);
	
}

function onPlayerHit(event) {
	soup.playSingAnim(event.direction);
	souplamlam.playSingAnim(event.direction);
}               
function onDadHit(event) {
	text.playSingAnim(event.direction);
	textlamlam.playSingAnim(event.direction);
}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 632:
    FlxTween.tween(white, {alpha: 1}, 0.7, {ease: FlxEase.circOut});
    FlxTween.tween(logo, {y: 200}, 0.7, {ease: FlxEase.circOut});
        case 640:
    soup.alpha = 1;
    text.alpha = 1;
    FlxTween.angle(logo, logo.angle, logo.angle - 360, 1, {ease: FlxEase.circOut});      
    FlxTween.tween(logo, {y: 1000}, 1.2, {ease: FlxEase.circIn});
        case 642:
    remove(dad);
    remove(boyfriend);
        case 646:
    ground.alpha = 0;
    backdrop.alpha = 0;
    FlxTween.tween(white, {alpha: 0}, 1.2, {ease: FlxEase.circOut});
        case 1231:
    souptransition.animation.play('switch');
        case 1236:
    backdroplam.alpha = 1;
    souplamlam.alpha = 1;
    textlamlam.alpha = 1;
    soup.alpha = 0;
    text.alpha = 0;
        case 1257:
    souptransition.alpha = 0;
        case 1249:
    FlxTween.tween(logolam, {y: 200}, 1.6, {ease: FlxEase.circOut});
	   case 1280:     
    FlxTween.tween(logolam, {y: 1000}, 1.2, {ease: FlxEase.circIn});
	}
}