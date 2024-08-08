import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxOutlineEffect;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import funkin.backend.utils.DiscordUtil;

var lineToBe = 0;
var canProg = false;
var arbitrary = false;

function create() {

    awesomeCam = new FlxCamera(0, 0, 1280, 720);
    FlxG.cameras.add(awesomeCam, false);
    awesomeCam.bgColor = 0x00000000;

    darkness = new FlxSprite(0, 0).makeGraphic(1280, 720, 0xFF000000);
    darkness.scrollFactor.set(0, 0);
    darkness.alpha = 0;
    add(darkness);

	character1 = new FlxSprite(0, 100).loadGraphic(Paths.image('menulogue/ports/dudeman/base'));
	character1.antialiasing = false;
	character1.updateHitbox();
	character1.scrollFactor.set(0, 0);
    character1.cameras = [awesomeCam];
    character1.scale.set(0, 1);
	add(character1);

    character2 = new FlxSprite(650, 100).loadGraphic(Paths.image('menulogue/ports/dudeman/base'));
	character2.antialiasing = false;
	character2.updateHitbox();
	character2.scrollFactor.set(0, 0);
    character2.cameras = [awesomeCam];
    character2.flipX = true;
    character2.scale.set(0, 1);
	add(character2);

    explosion = new FlxSprite(400, -300);	
    explosion.antialiasing = false;
    explosion.frames = Paths.getSparrowAtlas('explosion');
    explosion.animation.addByPrefix('explode', 'explode', 10, false);
    explosion.animation.play('explode');
    explosion.alpha = 0;
    explosion.updateHitbox();
    explosion.scale.set(1, 1);
    explosion.cameras = [awesomeCam];
    add(explosion);

    box = new FlxSprite(0, 0).loadGraphic(Paths.image('menulogue/box'));
	box.antialiasing = false;
	box.updateHitbox();
	box.scrollFactor.set(0, 0);
    box.cameras = [awesomeCam];
    box.scale.set(0, 1);
	add(box);

    nametag = new FlxSprite(0, 0).loadGraphic(Paths.image('menulogue/nametag'));
	nametag.antialiasing = false;
	nametag.updateHitbox();
	nametag.scrollFactor.set(0, 0);
    nametag.scale.set(0, 1);
    nametag.cameras = [awesomeCam];
	add(nametag);

    name = new FlxText(-137, 460, 500);
	name.setFormat(Paths.font("TwCen.ttf"), 35, FlxColor.BLACK, "center");            
    name.text = "";
	name.cameras = [awesomeCam];
	name.antialiasing = false;
    name.scale.set(0, 1);
	add(name);

    txtBro = new FlxTypeText(60, 525, 1170, "", 16, true);
    txtBro.setFormat(Paths.font("TwCen.ttf"), 35, FlxColor.BLACK, "left");            
    txtBro.antialiasing = false;
    txtBro.delay = 0.02;
    txtBro.eraseDelay = 0.2;
    txtBro.autoErase = true;
    txtBro.waitTime = 0;
    txtBro.setTypingVariation(0.10, false);
    txtBro.cameras = [awesomeCam];
    txtBro.skipKeys = ["SHIFT"];
    txtBro.sounds = [
        FlxG.sound.load(Paths.sound("datingSim/typeSFX"), 0.5)
    ];
    add(txtBro);


    FlxG.sound.play(Paths.sound("menulogAppear"), 0.1);
    new FlxTimer().start(0.6, function(timer) {
        FlxTween.tween(box.scale, {x: 1}, 0.5, {ease:FlxEase.quartInOut}); 
        FlxTween.tween(nametag.scale, {x: 1}, 0.5, {ease:FlxEase.quartInOut}); 
    });
    new FlxTimer().start(0.9, function(timer) {
        FlxTween.tween(name.scale, {x: 1}, 0.5, {ease:FlxEase.quartInOut}); 
    });
    new FlxTimer().start(1.1, function(timer) {
        FlxTween.tween(character1.scale, {x: 1}, 0.5, {ease:FlxEase.quartInOut}); 
    });

    new FlxTimer().start(1.2, function(timer) {
        updateDialogue(FlxG.save.data.menuDialougeToPlay);
    });

    FlxTween.tween(darkness, {alpha: 0.7}, 0.5, {ease:FlxEase.quartInOut});

}

function prioritize(side) {

    switch (side) {

        case "left":
            FlxTween.tween(nametag, {x: 0}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(name, {x: -137}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character1.scale, {x: 1, y: 1}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character1, {alpha: 1}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character2, {alpha: 0.6}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character2.scale, {x: 0.6, y: 0.6}, 1, {ease:FlxEase.quartInOut});
            txtBro.alignment = "left";

        case "right":
            FlxTween.tween(nametag, {x: 1054}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(name, {x: 917}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character1.scale, {x: 0.6, y: 0.6}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character1, {alpha: 0.6}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character2, {alpha: 1}, 1, {ease:FlxEase.quartInOut});
            FlxTween.tween(character2.scale, {x: 1, y: 1}, 1, {ease:FlxEase.quartInOut});
            txtBro.alignment = "right";

    }

}

function charSwitch(which, toSwitch) {

    switch (which) {

        case 1:
            FlxG.sound.play(Paths.sound("menulogAppear"), 0.1);
            FlxTween.tween(character1.scale, {x: 0.001, y: 0.001}, 0.5, {ease:FlxEase.quartInOut});
            new FlxTimer().start(0.6, function(timer) {
                FlxTween.tween(character1.scale, {x: 1, y: 1}, 0.6, {ease:FlxEase.quartInOut});
                character1.loadGraphic(Paths.image('menulogue/ports/'+toSwitch));
            });

        case 2:
            FlxG.sound.play(Paths.sound("menulogAppear"), 0.1);
            FlxTween.tween(character2.scale, {x: 0.1, y: 0.1}, 0.5, {ease:FlxEase.quartInOut});
            new FlxTimer().start(0.6, function(timer) {
                FlxTween.tween(character2.scale, {x: 1, y: 1}, 0.6, {ease:FlxEase.quartInOut});
                character2.loadGraphic(Paths.image('menulogue/ports/'+toSwitch));
            });
        

    }

}

function updateDialogue(dialouge) {

    canProg = true;

    switch (dialouge) {

        case "takeBreaks":

        if (lineToBe == 0) {
            character1.loadGraphic(Paths.image('menulogue/ports/fruity/base'));
            name.text = "FRUITY";
            txtBro.resetText("HI HI THERE, ITS ME, FRUITY !!!");
            txtBro.start(0.03);
        }

        if (lineToBe == 1) {
            txtBro.resetText("I JUST WANTED TO REMIND YOU THAT, SINCE THIS MOD IS SO LONG, IT WOULDNT HURT TO TAKE BREAKS EVERY NOW AND THEN SO IT DOESNT GET STALE !!");
            txtBro.start(0.03);
        }

        if (lineToBe == 2) {
            txtBro.resetText("IF YOU DONT NEED ONE, THEN GREAT !!! IF YOU DO, THEN THATS OKAY TOO !!!");
            txtBro.start(0.03);
        }
        
        if (lineToBe == 3) {
            prioritize("right");
            name.text = "DUDEMAN";
            txtBro.resetText("no, actually");
            txtBro.start(0.03);
        }

        if (lineToBe == 4) {
            txtBro.resetText("you have to play my mod NOW");
            txtBro.start(0.03);
        }


        if (FlxG.save.data.funValue <= 73 && FlxG.save.data.funValue >= 63 && arbitrary == false) {

            if (lineToBe == 5) {
                prioritize("left");
                canProg = false;
                txtBro.resetText("");
                txtBro.start(0.03);
                new FlxTimer().start(0.6, function(timer) {
                    charSwitch(1, "purpleBald");
                    new FlxTimer().start(0.2, function(timer) {
                        name.text = "PURPLE BALDI";
                        canProg = true;
                        txtBro.resetText("no..that's not cool man. please learn and change. thats just not okay to say man.\nyou need to work on yourself and try to be a nice person, because that just isnt okay. you have to be nice to people.");
                        txtBro.start(0.03);
                    });
                });
            }
    
            if (lineToBe == 6) {
                prioritize("right");
                name.text = "DUDEMAN";
                txtBro.resetText("SHUT THE FUCK UP I HATE YOU");
                txtBro.start(0.03);
            }
    
            if (lineToBe == 7) {
                explosion.x = 0;
                explosion.animation.play('explode');
                FlxG.sound.play(Paths.sound('explode'), 1);
                explosion.alpha = 1;
                new FlxTimer().start(0.7, function(timer) {
                    txtBro.resetText("thank fucking god");
                    character1.loadGraphic(Paths.image('menulogue/ports/nobody'));
                    txtBro.start(0.03);
                });
            }
    
            if (lineToBe == 8) {
                txtBro.resetText("where was I?");
                txtBro.start(0.03);
            }
    
            if (lineToBe == 9) {
                txtBro.resetText("oh yeah");
                txtBro.start(0.03);
            }
    
            if (lineToBe == 10) {
                txtBro.resetText("you have to play my mod NOW");
                txtBro.start(0.03);
            }

            if (lineToBe == 11) {
                prioritize("left");
                canProg = false;
                txtBro.resetText("");
                txtBro.start(0.03);
                new FlxTimer().start(0.6, function(timer) {
                    charSwitch(1, "fruity/base");
                    new FlxTimer().start(0.2, function(timer) {
                        name.text = "FRUITY";
                        canProg = true;
                        txtBro.resetText("WELL, I MEAN, THEY DO HAVE A POINT DUDEMAN");
                        txtBro.start(0.03);
                    });
                });
                lineToBe = 4;
                arbitrary = true;
            }

        }
        else {

            if (lineToBe == 5) {
                name.text = "FRUITY";
                prioritize("left");
                txtBro.resetText("THATS REALLY REALLY NOT NICE !!!");
                txtBro.start(0.03);
            }
    
            if (lineToBe == 6) {
                name.text = "DUDEMAN";
                prioritize("right");
                txtBro.resetText("bleh wah booohooo I DONT CARE");
                txtBro.start(0.03);
            }

            if (lineToBe == 7) {
                name.text = "DUDEMAN";
                prioritize("right");
                txtBro.resetText("this conversation is OVER play my MOD");
                txtBro.start(0.03);
            }

            if (lineToBe == 8) {
                name.text = "FRUITY";
                prioritize("left");
                txtBro.resetText(":c");
                txtBro.start(0.03);
            }

            if (lineToBe == 9) {
                closeDiagloue();
            }

        }

    }

}

function closeDiagloue() {

    FlxG.sound.play(Paths.sound("menulogAppear"), 0.1);
    new FlxTimer().start(0.6, function(timer) {
        FlxTween.tween(box.scale, {x: 0}, 0.5, {ease:FlxEase.quartInOut}); 
        FlxTween.tween(nametag.scale, {x: 0}, 0.5, {ease:FlxEase.quartInOut}); 
        FlxTween.tween(txtBro, {alpha: 0}, 0.5, {ease:FlxEase.quartInOut}); 
    });
    new FlxTimer().start(0.9, function(timer) {
        FlxTween.tween(name.scale, {x: 0}, 0.5, {ease:FlxEase.quartInOut}); 
    });
    new FlxTimer().start(1.1, function(timer) {
        FlxTween.tween(character1.scale, {x: 0}, 0.5, {ease:FlxEase.quartInOut}); 
        FlxTween.tween(character2.scale, {x: 0}, 0.5, {ease:FlxEase.quartInOut}); 
    });

    new FlxTimer().start(1.7, function(timer) {
        FlxG.save.data.shortLived = true;
        close();
    });

    FlxTween.tween(darkness, {alpha: 0}, 0.5, {ease:FlxEase.quartInOut});

}

function update() {

    if (FlxG.keys.justPressed.ENTER && canProg == true) {
        canProg = false;
        txtBro.paused = true;
        FlxG.sound.play(Paths.sound('datingSim/contSFX'), 1);
        txtBro.alpha = 0.7;
        new FlxTimer().start(0.35, function(timer) {
            txtBro.paused = false;
            txtBro.alpha = 1;
            lineToBe += 1;
            updateDialogue(FlxG.save.data.menuDialougeToPlay);
        });
    }

}