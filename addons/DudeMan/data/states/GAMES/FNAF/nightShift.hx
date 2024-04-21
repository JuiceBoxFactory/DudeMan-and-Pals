function create(){
    window.title = "I'm Dudemanning my nights right now";

    monitor = new FlxSprite();
	monitor.frames = Paths.getFrames('nightShift/monitor/monitor');
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
	statiC.frames = Paths.getFrames('nightShift/monitor/static');
	statiC.animation.addByPrefix('idle', 'idle');
	statiC.animation.play('idle');
    statiC.scrollFactor.set();
    statiC.screenCenter();
    statiC.cameras = [camHUD];
    add(statiC);

    map = new FlxSprite();
	map.frames = Paths.getFrames('nightShift/monitor/map');
    map.scrollFactor.set();
    map.x = 840;
    map.y = 350;
    map.cameras = [camHUD];
    add(map);

    monitorButton = new FlxSprite();
	monitorButton.frames = Paths.getFrames('nightShift/monitor/monitorButton');
	monitorButton.scale.set(0.9, 0.9);
    monitorButton.scrollFactor.set();
    monitorButton.screenCenter();
    monitorButton.y = 640;
    monitorButton.cameras = [camHUD];
    add(monitorButton);
}
function update(elapsed:Float){
    if(controls.BACK){
        FlxG.switchState(new ModState('titleScreen'));
    }
    // keys
    if(FlxG.keys.justPressed.R){
        FlxG.switchState(new ModState('gameOver'));
    }
}