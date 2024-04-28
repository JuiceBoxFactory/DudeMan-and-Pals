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
"Peakest mod to Exist.. totally",
"Im gonna put a toothbrush up your ass",
"what the poop",
"Have a tip, pal",
"Give me your money, MeltyKelpy",
"Can you P-Rank my dude, man ?",
"Weclome to dude, man...?",
"Welcome to my Galaxy",
"I hate tadpoles",
"oogali boogaliii ( that was a clown. )",
"did you know that there is secret settings ?? they're.. soooo well hidden... bet u cant find them..... heh heh... yeah.",
"wait.. my shirt... its off !!!",
"Basketball Practice",
"Actual battle i destroyed the toilet btw"

];
var tipTextChosen = "null";
var highestNum = 17;

function postCreate() {

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

	updateTxt();
	
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
	tipTextChosen = tipText[FlxG.random.int(0,highestNum)];
	tipTxt.text = "Tip:\n"+tipTextChosen;
	tipTxt.screenCenter();		
	tipTxt.y += 75;
}