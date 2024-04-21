var DoorOC:Int = 0;
var ventOC:Int = 0;
var monitorOC:Int = 0;
var curCam:Int = 1;
var dudemanAI:Int = 0;
var dudemanTimer:Float = 0;
var usageValue:Int = 1;
var powerPercent:Float = 100;
var minute:Float = 0;
var hour:Int = 12;
var perspective:CustomShader = null;

function create(){
    window.title = "I'm Dudemanning my nights right now";

    camHUD = new FlxCamera();
    FlxG.cameras.add(camHUD, false);
    camHUD.bgColor = FlxColor.TRANSPARENT;

    perspective = new CustomShader('FNAF/perspective');
    FlxG.camera.addShader(perspective);

    camFollow = new FlxSprite();
    camFollow.makeGraphic(20, 20, 0xffffffff);
    camFollow.x = 925;
    camFollow.y = 385;
    camFollow.visible = false;
    camFollow.cameras = [camHUD];
    add(camFollow);

    leftSlower = new FlxSprite();
	leftSlower.makeGraphic(500, FlxG.height, 0xffd97aff);
    leftSlower.scrollFactor.set();
    leftSlower.visible = false;
    leftSlower.cameras = [camHUD];
    add(leftSlower);

	leftMedium = new FlxSprite();
	leftMedium.makeGraphic(340, FlxG.height, 0xffae62cc);
    leftMedium.scrollFactor.set();
    leftMedium.visible = false;
    leftMedium.cameras = [camHUD];
    add(leftMedium);

	leftFaster = new FlxSprite();
	leftFaster.makeGraphic(160, FlxG.height, 0xff824999);
    leftFaster.scrollFactor.set();
    leftFaster.visible = false;
    leftFaster.cameras = [camHUD];
    add(leftFaster);

	rightSlower = new FlxSprite();
	rightSlower.makeGraphic(500, FlxG.height, 0xffd97aff);
    rightSlower.scrollFactor.set();
    rightSlower.x = 780;
    rightSlower.visible = false;
    rightSlower.cameras = [camHUD];
    add(rightSlower);

	rightMedium = new FlxSprite();
	rightMedium.makeGraphic(340, FlxG.height, 0xffae62cc);
    rightMedium.scrollFactor.set();
    rightMedium.x = 940;
    rightMedium.visible = false;
    leftSlower.cameras = [camHUD];
    add(rightMedium);

	rightFaster = new FlxSprite();
	rightFaster.makeGraphic(160, FlxG.height, 0xff824999);
    rightFaster.scrollFactor.set();
    rightFaster.x = 1120;
    rightFaster.visible = false;
    rightFaster.cameras = [camHUD];
    add(rightFaster);

    office = new FlxSprite();
	office.frames = Paths.getFrames('shh/FNAF/nightShift/office/office');
	office.animation.addByPrefix('idle', 'idle');
	office.animation.play('idle');
	office.scale.set(0.9, 0.9);
    add(office);

    monitor = new FlxSprite();
	monitor.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/monitor');
	monitor.animation.addByPrefix('open', 'open');
	monitor.animation.addByPrefix('idle', 'idle');
	monitor.animation.addByPrefix('close', 'close');
	monitor.animation.play('idle');
    monitor.scrollFactor.set();
    monitor.screenCenter();
    monitor.cameras = [camHUD];
    add(monitor);

    room = new FlxSprite();
    room.scrollFactor.set();
    room.cameras = [camHUD];
    add(room);

    statiC = new FlxSprite();
	statiC.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/static');
	statiC.animation.addByPrefix('idle', 'idle');
	statiC.animation.play('idle');
    statiC.scrollFactor.set();
    statiC.screenCenter();
    statiC.cameras = [camHUD];
    add(statiC);

    map = new FlxSprite();
	map.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/map');
    map.scale.set(0.45,0.45);
    map.scrollFactor.set();
    map.x = 450;
    map.y = 100;
    map.cameras = [camHUD];
    add(map);

    cam1 = new FlxSprite();
    cam1.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam1.animation.addByPrefix('Blank', 'CamButton Blank');
	cam1.animation.addByPrefix('on', 'CamButton Hue1');
	cam1.animation.addByPrefix('off', 'CamButton Hue2');
	cam1.animation.play('Blank');
    cam1.scrollFactor.set();
    cam1.x = 840;
    cam1.y = 570;
    cam1.cameras = [camHUD];
    add(cam1);

    cam2 = new FlxSprite();
    cam2.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam2.animation.addByPrefix('Blank', 'CamButton Blank');
	cam2.animation.addByPrefix('on', 'CamButton Hue1');
	cam2.animation.addByPrefix('off', 'CamButton Hue2');
	cam2.animation.play('Blank');
    cam2.scrollFactor.set();
    cam2.x = 1090;
    cam2.y = 570;
    cam2.cameras = [camHUD];
    add(cam2);

    cam3 = new FlxSprite();
    cam3.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam3.animation.addByPrefix('Blank', 'CamButton Blank');
	cam3.animation.addByPrefix('on', 'CamButton Hue1');
	cam3.animation.addByPrefix('off', 'CamButton Hue2');
	cam3.animation.play('Blank');
    cam3.scrollFactor.set();
    cam3.x = 790;
    cam3.y = 520;
    cam3.cameras = [camHUD];
    add(cam3);

    cam4 = new FlxSprite();
    cam4.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam4.animation.addByPrefix('Blank', 'CamButton Blank');
	cam4.animation.addByPrefix('on', 'CamButton Hue1');
	cam4.animation.addByPrefix('off', 'CamButton Hue2');
	cam4.animation.play('Blank');
    cam4.scrollFactor.set();
    cam4.x = 1140;
    cam4.y = 520;
    cam4.cameras = [camHUD];
    add(cam4);

    cam5 = new FlxSprite();
    cam5.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam5.animation.addByPrefix('Blank', 'CamButton Blank');
	cam5.animation.addByPrefix('on', 'CamButton Hue1');
	cam5.animation.addByPrefix('off', 'CamButton Hue2');
	cam5.animation.play('Blank');
    cam5.scrollFactor.set();
    cam5.x = 965;
    cam5.y = 465;
    cam5.cameras = [camHUD];
    add(cam5);

    cam6 = new FlxSprite();
    cam6.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam6.animation.addByPrefix('Blank', 'CamButton Blank');
	cam6.animation.addByPrefix('on', 'CamButton Hue1');
	cam6.animation.addByPrefix('off', 'CamButton Hue2');
	cam6.animation.play('Blank');
    cam6.scrollFactor.set();
    cam6.x = 980;
    cam6.y = 700;
    cam6.cameras = [camHUD];
    add(cam6);

    cam7 = new FlxSprite();
    cam7.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/CamButton');
    cam7.animation.addByPrefix('Blank', 'CamButton Blank');
	cam7.animation.addByPrefix('on', 'CamButton Hue1');
	cam7.animation.addByPrefix('off', 'CamButton Hue2');
	cam7.animation.play('Blank');
    cam7.scrollFactor.set();
    cam7.x = 580;
    cam7.y = 300;
    cam7.cameras = [camHUD];
    add(cam7);

    monitorButton = new FlxSprite();
	monitorButton.frames = Paths.getFrames('shh/FNAF/nightShift/monitor/monitorButton');
	monitorButton.scale.set(0.9, 0.9);
    monitorButton.scrollFactor.set();
    monitorButton.screenCenter();
    monitorButton.y = 640;
    monitorButton.cameras = [camHUD];
    add(monitorButton);

    timer = new FlxText();
    timer.size = 24;
    timer.scrollFactor.set();
    timer.x = 60;
    timer.y = 50;
    timer.cameras = [camHUD];
    add(timer);

    usage = new FlxText();
    usage.size = 24;
    usage.scrollFactor.set();
    usage.x = 60;
    usage.y = 90;
    usage.cameras = [camHUD];
    add(usage);
    
    power = new FlxText();
    power.size = 24;
    power.scrollFactor.set();
    power.x = 60;
    power.y = 130;
    power.cameras = [camHUD];
    add(power);

    camHUD.flash(FlxColor.BLACK, 1);
}
function update(elapsed:Float){
    if(controls.BACK){
        FlxG.switchState(new ModState('titleScreen'));
    }
    if(FlxG.keys.justPressed.R){
        FlxG.switchState(new ModState('gameOver'));
    }
    FlxG.camera.follow(camFollow);
    if(monitorOC == 0 && dudemanAI <= 10){
        if(camFollow.x > 720){
            if(FlxG.mouse.overlaps(leftSlower)){
                camFollow.x -= 1;
            }
            if(FlxG.mouse.overlaps(leftMedium)){
                camFollow.x -= 2;
            }
            if(FlxG.mouse.overlaps(leftFaster)){
                camFollow.x -= 3;
            }
        }
        if(camFollow.x < 1140){
            if(FlxG.mouse.overlaps(rightSlower)){
                camFollow.x += 1;
            }
            if(FlxG.mouse.overlaps(rightMedium)){
                camFollow.x += 2;
            }
            if(FlxG.mouse.overlaps(rightFaster)){
                camFollow.x += 3;
            }
        }
    }
    if(FlxG.mouse.overlaps(monitorButton)){
            if(monitorOC == 0){
                FlxG.sound.play(Paths.sound('fnaf/gunshot'));
                monitorOC = 1;
                if(usageValue < 5){
                    usageValue += 1;
                }
            }else if(monitorOC == 2){
                FlxG.sound.play(Paths.sound('fnaf/gunshot'));
                monitorOC = 3;
                if(usageValue > 1){
                    usageValue -= 1;
                }
            }
        }
    } 
    if(monitorOC == 0){
        monitor.animation.play('idle');
        monitor.visible = false;
        room.visible = false;
        statiC.visible = false;
        map.visible = false;
        cam1.visible = false;
        cam2.visible = false;
        cam3.visible = false;
        cam4.visible = false;
        cam5.visible = false;
        monitorButton.visible = true;
    }else if(monitorOC == 1){
        monitor.animation.play('open');
        monitor.visible = true;
        if(monitor.animation.frameIndex == 14){
            FlxG.sound.play(Paths.sound('fnaf/gunshot'));
            monitorOC = 2;
        }
    } 