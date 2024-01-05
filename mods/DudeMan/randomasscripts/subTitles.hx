import flixel.text.FlxTextBorderStyle;

var sname:FlxText;
var cname:FlxText;

function create() {
    sname = new FlxText(0, 0);
    sname.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    sname.scrollFactor.set();
    sname.borderColor = 0xFF000000;
    sname.borderSize = 2;
    add(sname);
    sname.cameras = [camHUD];

    cname = new FlxText(0, 0);
    cname.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    cname.scrollFactor.set();
    cname.borderColor = 0xFF000000;
    cname.borderSize = 2;
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

function stepHit(curStep:Int) { 
    switch (curStep) {
        case 0:
            Songname("Nourishing Blood");
            Composername("Kenny L");
    }
}
