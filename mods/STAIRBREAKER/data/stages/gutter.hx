var shader:CustomShader = null;
var shader2:CustomShader = null;
var shader3:CustomShader = null;
var time = 0;
var tween:FlxTween;
var waveSpeed:Int = 0.0025;
var scary = false;
var baseY = 0;
var thingy = 1;
var timer = 0;
var moveAmt = 0;
var flashinglights = 1;
var boxTarY = 0;
var onePart = false;

function black() {
	camGame.x = 1800;
	trace("Blackened!");
	flash();
}
function unblack() {
	camGame.x = 0;
	trace("Un-Blackened!");
	flash();
}

function create() {
	pepperman = new Character(850, 100, "pepperman");
	pepperman.flipX = false;
	pepperman.scale.x = pepperman.scale.y *= 1.5;
	pepperman.alpha = 0;
	add(pepperman);
	joe2 = new Character(200, 0, "joe2");
	joe2.flipX = false;
	joe2.scale.x = joe2.scale.y *= 0.5;
	joe2.alpha = 0;
	add(joe2);
    	box = new FlxSprite();
	box.makeGraphic(10, 10, FlxColor.WHITE);
	box.x = 0;
	box.y = 0;
	box.camera = camGame;
	add(box);
	if (FlxG.save.data.flights == true) {
		flashinglights = 1;
	} else if (FlxG.save.data.flights != true) {
		flashinglights = 0;
	}
	trace(FlxG.save.data.flights);
	shader2 = new CustomShader("bgGlitch");
	shader3 = new CustomShader("effect weird");
	if (FlxG.save.data.flights == true) {
		camGame.addShader(shader2);
		camGame.addShader(shader3);
	}
	bg.shader = shader = new CustomShader("zigzag");
	black();
	shader2.iAmt = 0;
	shader3.offsetIntensity = 0;
	onePart = false;
	tween = FlxTween.tween(box, {x: 0}, 1, {ease:FlxEase.backOut});
	tween.cancel();
}

function update(elapsed) {
	defaultCamZoom = FlxMath.remapToRange(camGame.scroll.x, 0, 300, 1.2, 0.9);
	time += waveSpeed;
	shader.uTime = time;
	shader2.iTime = (box.x / 100);
	shader3.iTime = (box.x / 100);
	shader3.Amt = (box.y / 1000);
}


function onPlayerHit(event) {
	pepperman.playSingAnim(event.direction);
}
function onDadHit(event) {
	joe2.playSingAnim(event.direction);
}

function peppino() {
	trace("Back to this guy.");
	flash();
	pepperman.alpha = 0;
	boyfriend.alpha = 1;
}
function pepper() {
	trace("Pepperman?");
	flash();
	boxTarY = 500;
	pepperman.alpha = 1;
	boyfriend.alpha = 0;
}

function flash() {
	camHUD.flash(FlxColor.fromRGB(255,255,255), 0.75 / inst.pitch);
	trace("Flashed!");
}

function scary() {
	scary = true;
	shader.uAmt = 2.5;
	waveSpeed *= 2;
	shader2.iAmt = 1;
	shader3.offsetIntensity = 1;
	moveAmt = 1;
	dad.alpha = 0;
	joe2.alpha = 1;
	boxTarY = 1000;
	flash();
}

function scary2() {
	shader.uAmt = 5;
	waveSpeed *= 2;
	shader2.iAmt = 2;
	shader3.offsetIntensity = 2;
	moveAmt = 2;
	boxTarY = 1500;
	flash();
}
function thatonepart() {
	onePart = true;
	camHUD.scale.y = -1;
	trace("cool");
}
function notthatonepart() {
	onePart = false;
	camHUD.scale.y = 1;
	trace("not as cool");
}

function beatHit(curBeat) {
	thingy *= -1;
	box.y = boxTarY / 16;
	FlxTween.tween(box, {x: box.x + (100 * moveAmt), y: boxTarY}, 0.3, {ease:FlxEase.quartOut});
	if (onePart == true) {
		tween.cancel();
		camHUD.angle = 20 * thingy;
		tween = FlxTween.tween(camHUD, {angle:0}, 0.35, {ease:FlxEase.backOut});
	}
}