import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxTimer;

var tipText:Array<String> = [

"when the dude is.. man... yeah man.",
"lowkey, im better than you at this game.",
"9364 WI-16 onalaska, WI",
"Bob V3",
"Peakest mod to Exist.. totally"

];
var tipTextChosen = "null";

function postCreate() {

	tipTextChosen = tipText[FlxG.random.int(0,3)];

	coolBackdrop = new FlxBackdrop(Paths.image('titleScreen/checkerboardbg'));
	coolBackdrop.moves = true;
	coolBackdrop.scrollFactor.set(0, 0);
	coolBackdrop.velocity.x = 100;
	coolBackdrop.velocity.y = 100;
	coolBackdrop.active = true;
	add(coolBackdrop);

	light = new FlxSprite(0, 0).loadGraphic(Paths.image('titleScreen/backgroundLight'));
	light.antialiasing = false;
	light.updateHitbox();
	add(light);

	border = new FlxSprite(0, 0).loadGraphic(Paths.image('titleScreen/border'));
	border.antialiasing = false;
	border.updateHitbox();
	add(border);

	Logo = new FlxSprite(0, 0).loadGraphic(Paths.image('modLogo'));
	Logo.antialiasing = false;
	Logo.updateHitbox();
	Logo.screenCenter();
	Logo.y -= 100;
	Logo.x -= 20;
	add(Logo);

	tipTxt = new FlxText();
	tipTxt.text = "Tip:\n"+tipTextChosen;
	tipTxt.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	tipTxt.color = 0xFFFFFFFF;
	tipTxt.borderColor = 0xFF000000;
	tipTxt.antialiasing = false;
	tipTxt.borderSize = 3;
	tipTxt.screenCenter();
	tipTxt.x += 0;
	tipTxt.y += 75;
	add(tipTxt);

	BottomText = new FlxText();
	BottomText.text = "btw, this is the part where you press";
	BottomText.setFormat(Paths.font("COMIC.ttf"), 20, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	BottomText.color = 0xFFFFFFFF;
	BottomText.borderColor = 0xFF000000;
	BottomText.antialiasing = false;
	BottomText.screenCenter();
	BottomText.borderSize = 3;
	BottomText.x += 0;
	BottomText.y += 290;
	add(BottomText);

	enterTxt = new FlxText();
	enterTxt.text = "ENTER";
	enterTxt.setFormat(Paths.font("COMIC.ttf"), 35, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);            
	enterTxt.color = 0xFFFFFFFF;
	enterTxt.borderColor = 0xFF000000;
	enterTxt.antialiasing = false;
	enterTxt.borderSize = 3;
	enterTxt.screenCenter();
	enterTxt.x += 0;
	enterTxt.y += 325;
	add(enterTxt);
	
	new FlxTimer().start(7, function(tmr:FlxTimer) {
		updateTxt();
	}, 600);
	
}

function update() {

	if (FlxG.keys.justPressed.SHIFT) {
		updateTxt();
	}

}

function updateTxt() {
	tipTextChosen = tipText[FlxG.random.int(0,4)];
	tipTxt.text = "Tip:\n"+tipTextChosen;
	tipTxt.screenCenter();		
	tipTxt.y += 75;
}