import flixel.util.FlxSave;

function create() {

// who sings on the left side in this song
FlxG.save.data.leftSideSinger = "Kathy";

// who sings on the right side in this song
FlxG.save.data.rightSideSinger = "DudeManCOOLHAT";

// cateogry for the song ( VS DUDEMAN, VS FRUITY, EXTRAS, COVERS, REMIXES, DAX SHAPED DUEL, etc, please use capitols ! )
FlxG.save.data.categoryName = "COVERS";

// name of the song
FlxG.save.data.songName = "Obituary";

// composer for the song
FlxG.save.data.composerName = "Saayo";

}