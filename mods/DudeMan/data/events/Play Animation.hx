function onEvent(_) {
    //trace(_);
    switch (_.event.name) {
        case "Play Animation":
            for (char in strumLines.members[_.event.params[0]].characters) {
                char.playAnim(_.event.params[1], _.event.params[2], null);
            }
    }
}