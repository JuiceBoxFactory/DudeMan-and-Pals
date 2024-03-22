import flixel.text.FlxTextBorderStyle;

var sname:FlxText;
var cname:FlxText;
var fname:FlxText;

function create() {

	songbox = new FlxSprite(-370, 370).loadGraphic(Paths.image('game/songnamebar'));
	songbox.antialiasing = false;
	songbox.cameras = [camHUD];
	songbox.scale.x = 0.4;
	songbox.scale.y = 0.8;
	songbox.updateHitbox();
	add(songbox);

    fname = new FlxText(-360, 380, 400, "", 0);
    fname.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    fname.scrollFactor.set();
    fname.borderColor = 0xFF000000;
    fname.borderSize = 2;
    add(fname);
    fname.cameras = [camHUD];

    sname = new FlxText(-360, 420, 1000, "", 0);
    sname.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    sname.scrollFactor.set();
    sname.borderColor = 0xFF000000;
    sname.borderSize = 2;
    add(sname);
    sname.cameras = [camHUD];

    cname = new FlxText(-360, 450, 400, "", 0);
    cname.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    cname.scrollFactor.set();
    cname.borderColor = 0xFF000000;
    cname.borderSize = 2;
    add(cname);
    cname.cameras = [camHUD];

}

function Songname(text:String) {
    sname.scale.x = 1;
    sname.scale.y = 1;
    sname.text = text;
}


function Composername(text:String) {
    cname.scale.x = 1;
    cname.scale.y = 1;
    cname.text = text;
}

function Freeplaysectionname(text:String) {
    fname.scale.x = 1;
    fname.scale.y = 1;
    fname.text = text;
}

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 16:
            Freeplaysectionname("VS LEMON");
            Songname("Lemon");
            Composername("AussieDoesThings");         
            for (obj in [fname, cname, sname])
            FlxTween.tween(obj, {x: 10}, 2, {ease:FlxEase.quartOut});
            for (obj in [songbox])
            FlxTween.tween(obj, {x: 0}, 2, {ease:FlxEase.quartOut});
        case 66:
            for (obj in [fname, cname, sname])
            FlxTween.tween(obj, {x: -560}, 4, {ease:FlxEase.quartOut});
            for (obj in [songbox])
            FlxTween.tween(obj, {x: -370}, 4, {ease:FlxEase.quartOut});
    }
    	if (curStep > 50) {        
		cname.alpha = 0;
		sname.alpha = 0;
		fname.alpha = 0;
		songbox.alpha = 0;	
	}
}