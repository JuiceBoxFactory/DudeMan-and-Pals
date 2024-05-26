import flixel.math.FlxRandom;

var defaultStrumY;
var defaultStrumX0;
var defaultStrumX1;
var defaultStrumX2;
var defaultStrumX3;

function onPostNoteCreation(event)
{
    defaultStrumY = cpuStrums.members[0].y;
    defaultStrumX0 = playerStrums.members[0].x;
    defaultStrumX1 = playerStrums.members[1].x;
    defaultStrumX2 = playerStrums.members[2].x;
    defaultStrumX3 = playerStrums.members[3].x;
}

function update()
{
    if (curStep < 496)
    {
        cpuStrums.members[0].y = 750;
        cpuStrums.members[1].y = 750;
        cpuStrums.members[2].y = 750;
        cpuStrums.members[3].y = 750;
    }

    if (curStep > 1663 && curStep < 2432)
    {
        playerStrums.members[0].x = defaultStrumX0 + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[1].x = defaultStrumX1 + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[2].x = defaultStrumX2 + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[3].x = defaultStrumX3 + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[0].y = defaultStrumY + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[1].y = defaultStrumY + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[2].y = defaultStrumY + FlxG.random.int(-1.5, 1.5);
        playerStrums.members[3].y = defaultStrumY + FlxG.random.int(-1.5, 1.5);
    }

    if (curStep == 2434)
    {
        playerStrums.members[0].x = defaultStrumX0;
        playerStrums.members[1].x = defaultStrumX1;
        playerStrums.members[2].x = defaultStrumX2;
        playerStrums.members[3].x = defaultStrumX3;
        playerStrums.members[0].y = defaultStrumY;
        playerStrums.members[1].y = defaultStrumY;
        playerStrums.members[2].y = defaultStrumY;
        playerStrums.members[3].y = defaultStrumY;  
    }
}


function stepHit(curStep:Int) 
{
    switch (curStep)
    {
        case 496:
            FlxTween.tween(cpuStrums.members[0], {y: defaultStrumY}, 1, {ease: FlxEase.quartOut});
            FlxTween.tween(cpuStrums.members[1], {y: defaultStrumY}, 1, {ease: FlxEase.quartOut});
            FlxTween.tween(cpuStrums.members[2], {y: defaultStrumY}, 1, {ease: FlxEase.quartOut});
            FlxTween.tween(cpuStrums.members[3], {y: defaultStrumY}, 1, {ease: FlxEase.quartOut});
    }
}