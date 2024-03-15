import flixel.addons.display.FlxBackdrop;

var Selected = 0;

function create() {

	coolBackdrop = new FlxBackdrop(Paths.image('mainmenu/checkerboardbg')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	numbers = new FlxSprite(0, 0).loadGraphic(Paths.image('storyMode/numbers'));
	numbers.antialiasing = false;
	numbers.updateHitbox();
	add(numbers);
	
	weekDude = new FlxSprite(325, 80);
	weekDude.antialiasing = false;
	weekDude.frames = Paths.getSparrowAtlas('storyMode/weekCons/dudeWeek');
	weekDude.animation.addByPrefix('animation', 'idle', 6);
	weekDude.animation.play('animation');
	weekDude.scale.x = 1;
	weekDude.scale.y = 1;
	weekDude.scrollFactor.set(1, 1);
	weekDude.alpha = 0;
	weekDude.updateHitbox();
	add(weekDude);

	weekFruit = new FlxSprite(325, 235);
	weekFruit.antialiasing = false;
	weekFruit.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekFruit.animation.addByPrefix('animation', 'idle', 6);
	weekFruit.animation.play('animation');
	weekFruit.scale.x = 1;
	weekFruit.scale.y = 1;
	weekFruit.scrollFactor.set(1, 1);
	weekFruit.alpha = 0;
	weekFruit.updateHitbox();
	add(weekFruit);

	weekZee = new FlxSprite(325, 390);
	weekZee.antialiasing = false;
	weekZee.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekZee.animation.addByPrefix('animation', 'idle', 6);
	weekZee.animation.play('animation');
	weekZee.scale.x = 1;
	weekZee.scale.y = 1;
	weekZee.scrollFactor.set(1, 1);
	weekZee.alpha = 0;
	weekZee.updateHitbox();
	add(weekZee);
	
	weekRobert = new FlxSprite(325, 545);
	weekRobert.antialiasing = false;
	weekRobert.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekRobert.animation.addByPrefix('animation', 'idle', 6);
	weekRobert.animation.play('animation');
	weekRobert.scale.x = 1;
	weekRobert.scale.y = 1;
	weekRobert.scrollFactor.set(1, 1);
	weekRobert.alpha = 0;
	weekRobert.updateHitbox();
	add(weekRobert);

	weekKathy = new FlxSprite(675, 80);
	weekKathy.antialiasing = false;
	weekKathy.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekKathy.animation.addByPrefix('animation', 'idle', 6);
	weekKathy.animation.play('animation');
	weekKathy.scale.x = 1;
	weekKathy.scale.y = 1;
	weekKathy.scrollFactor.set(1, 1);
	weekKathy.alpha = 0;
	weekKathy.updateHitbox();
	add(weekKathy);

	weekUmbreon = new FlxSprite(675, 235);
	weekUmbreon.antialiasing = false;
	weekUmbreon.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekUmbreon.animation.addByPrefix('animation', 'idle', 6);
	weekUmbreon.animation.play('animation');
	weekUmbreon.scale.x = 1;
	weekUmbreon.scale.y = 1;
	weekUmbreon.scrollFactor.set(1, 1);
	weekUmbreon.alpha = 0;
	weekUmbreon.updateHitbox();
	add(weekUmbreon);

	weekStick = new FlxSprite(675, 390);
	weekStick.antialiasing = false;
	weekStick.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekStick.animation.addByPrefix('animation', 'idle', 6);
	weekStick.animation.play('animation');
	weekStick.scale.x = 1;
	weekStick.scale.y = 1;
	weekStick.scrollFactor.set(1, 1);
	weekStick.alpha = 0;
	weekStick.updateHitbox();
	add(weekStick);
	
	weekSilly = new FlxSprite(675, 545);
	weekSilly.antialiasing = false;
	weekSilly.frames = Paths.getSparrowAtlas('storyMode/weekCons/placeWeek');
	weekSilly.animation.addByPrefix('animation', 'idle', 6);
	weekSilly.animation.play('animation');
	weekSilly.scale.x = 1;
	weekSilly.scale.y = 1;
	weekSilly.scrollFactor.set(1, 1);
	weekSilly.alpha = 0;
	weekSilly.updateHitbox();
	add(weekSilly);
	
	}
	
function update() {

	for (obj in [weekDude, weekFruit, weekZee, weekRobert, weekKathy, weekUmbreon, weekStick, weekSilly])
	obj.alpha = 0.6;

	if (controls.UP_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 1;
	}
	if (controls.DOWN_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 1;
	}
	if (controls.LEFT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected -= 4;
	}
	if (controls.RIGHT_P) {
		FlxG.sound.play(Paths.sound('menu/scroll'));
		Selected += 4;
	}
	if (Selected == 0) {
			weekDude.alpha = 1;
	}
	if (Selected == 1) {
			weekFruit.alpha = 1;
	}
	if (Selected == 2) {
			weekZee.alpha = 1;
	}
	if (Selected == 3) {
			weekRobert.alpha = 1;
	}
	if (Selected == 4) {
			weekKathy.alpha = 1;
	}
	if (Selected == 5) {
			weekUmbreon.alpha = 1;
	}
	if (Selected == 6) {
			weekStick.alpha = 1;
	}
	if (Selected == 7) {
			weekSilly.alpha = 1;
	}
	if (Selected == 0 && controls.ACCEPT) {
			PlayState.loadWeek( {
                name: "DudeMan Week",
                id: "weekDude",
                sprite: null,
                chars: [null, null, null],
                songs: [for (song in ["dude"]) {name: song, hide: false}],
                difficulties: ['hard']
            }, "hard");

			new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());}); 
	}
	if (Selected > 7) {
		Selected = 0;
	}
	if (Selected < 0) {
		Selected = 7;
	}
 	
	if (controls.BACK) {
	FlxG.switchState(new StoryMenuState());
	}
}