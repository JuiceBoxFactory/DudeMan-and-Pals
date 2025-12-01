function dialogueUpdateShit() {
    
        if (alongTheDialogue == 0) {
            transitionShit("nameBoxPEAR", "");
            ground = 'thatSchoolThatIHate';
            char1var = 'dudeDating';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'DudeMan';
            txtBro.resetText("Hi there my GOOD FRIEND!");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 1) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("its me. the dude.. man!");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 2) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("welcome to DUDE SCHOOL.");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 3) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("its awesome and cool and awesome and cool and-");
            txtBro.start(0.03);
        }
    
    
        if (alongTheDialogue == 4) {
            char2var = 'Fruity/base';
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("APPEAR", char2);
            name.text = 'Fruity';
            txtBro.resetText("HI DUDEMAN ! HI THAT ONE GUY !");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 5) {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            characterStatus("SIDELEFT", char1);
            characterStatus("SIDERIGHT", char2);
            name.text = 'DudeMan';
            txtBro.resetText("FRUITY. YOU ARE RUINING. MY. INTRO!!!!!!");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 6) {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'Fruity';
            txtBro.resetText("BUT I JUST WANTED TO SAY HI :c");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 7) {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("i DONT care lil bro");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 8) {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            name.text = 'DudeMan';
            txtBro.resetText("AS i was saying.");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 9) {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            name.text = 'DudeMan';
            txtBro.resetText("Welcome to DUDE SCHOOL");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 10) {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            name.text = 'DudeMan';
            txtBro.resetText("somewhere here, you'll find someone to LOVE <3333");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 11) {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            characterStatus("SIDELEFT", char1);
            characterStatus("MIDDLE", char2);
            name.text = 'Fruity';
            txtBro.resetText("NO THEY WONT !! c:");
            txtBro.start(0.03);
        } 
        
        if (alongTheDialogue == 12) {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            characterStatus("MIDDLE", char1);
            characterStatus("SIDERIGHT", char2);
            name.text = 'DudeMan';
            txtBro.resetText("FRUITY SHUT UP");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 13) {
            canDoShitDude = true;
            characterStatus("UNAPPEAR", char2);
            name.text = 'DudeMan';
            txtBro.resetText("Now, friend of mine. pal.");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 13) {
            canDoShitDude = false;
            name.text = 'DudeMan';
            txtBro.resetText("Are you ready to take step into my.,,. school of love....?");
            txtBro.start(0.03);
            val3 = true;
            val4 = false;
            buttonText3Be("Yeah, Man !");
            buttonText4Be("No, dude.");
            buttonAdd(3);
            buttonAdd(4);
        }
    
        if (alongTheDialogue == 14 && readyForLove == false) {
            canDoShitDude = true;
            music.pause();
            name.text = 'DudeMan';
            txtBro.resetText("oh");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 15 && readyForLove == false) {
            FlxG.switchState(new ModState("GAMES/datingSimTitle"));
        }
    
        if (alongTheDialogue == 14 && readyForLove == true) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("oh yeah baby. this is happening. its just getting started.");
            txtBro.start(0.03);
        }
    
        if (alongTheDialogue == 15 && readyForLove == true) {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("okay come with me then bestie");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 16) {
            canDoShitDude = false;
            transitionShit("switchLocation", "hallway1");
        }

        if (alongTheDialogue == 17) {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            characterStatus("APPEAR", char1);
            name.text = 'DudeMan';
            txtBro.resetText("my school");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 18) {
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'DudeMan';
            txtBro.resetText("im realizing that u actually have to meet people to FIND LOVE <3, so im going to let you do that\n\n\nAuf Wiedersehen, Kumpel! Ich hoffe, du kommst zugrunde!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 19) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("DudeMan climbs into a locker and vanishes, its up to you now, I guess!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 20) {
            canDoShitDude = false;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            placeToBe = "hallway1";
            val1 = true;
            val2 = true;
            val3 = true;
            val4 = true;
            buttonText1Be("yoiur moms ho use.");
            buttonText2Be("Keep going forwards");
            buttonText3Be("Class on the Left !");
            buttonText4Be("Class on the Right !");
            buttonAdd(1);
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            txtBro.resetText("Where would you like to go ?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 21 && placeToBe == "hallway1" && beenHereBefore == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("haha you're SO FUCKING FUNNY MAN");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway1" && beenHereBefore == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("I HOPE U DIE BRO RRRAAAAH IM THE BURGER DEMON FUCK YOU");
            txtBro.start(0.03);
            yourMom = true;
        }

        if (alongTheDialogue == 21 && placeToBe == "hallway1" && beenHereBefore == true && beenHereBefore2 == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("dude are you fucking serious");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway1" && beenHereBefore == true && beenHereBefore2 == false) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("YOU'RE ABUSING A BUG TO ASK TO SEE MY MOM AGAIN ????");
            txtBro.start(0.03);
            yourMom = false;
        }
        
        if (alongTheDialogue == 23 && placeToBe == "hallway1" && yourMom == false && beenHereBefore == true) {
            canDoShitDude = true;
            alongTheDialogue = 22;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("FUCK YOU");
            txtBro.start(0.03);
            yourMom = true;
        }

        if (alongTheDialogue == 23 && yourMom == true && placeToBe == "hallway1") {
            canDoShitDude = false;
            alongTheDialogue = 20;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            placeToBe = "hallway1";
            val2 = true;
            val3 = true;
            val4 = true;
            buttonText2Be("Keep going forwards");
            buttonText3Be("Class on the Left !");
            buttonText4Be("Class on the Right !");
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            txtBro.resetText("Where would you like to go ?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 21 && placeToBe == "hallway1" && beenHereBefore2 == true) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            txtBro.resetText("i hope you rot");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway1" && beenHereBefore2 == true) {
            saveGame();
            Sys.exit();
        }

        if (alongTheDialogue == 21 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            transitionShit("screenFade", "");
            name.text = '';
            txtBro.resetText("You enter the classroom,");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 22 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            txtBro.resetText("It smells like,.. smellified autism.");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 23 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            ground = "Class2";
            txtBro.resetText("didnt know that was even possible");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 24 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            transitionShit("screenUnfade", "");
            char1var = 'Fruity/Base';
            char2var = 'Zee/Base';
            characterStatus("SIDELEFT", char1);
            characterStatus("SIDERIGHT", char2);
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Fruity';
            txtBro.resetText("NO ZEE U ARENT DOING IT RIGHT U GOTTA DO THE LIGHTER COLORS FIRST");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 25 && placeToBe == "class2") {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            transitionShit("screenUnfade", "");
            char1var = 'Fruity/Base';
            char2var = 'Zee/Base';
            characterStatus("SIDELEFT", char1);
            characterStatus("SIDERIGHT", char2);
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'Zee';
            txtBro.resetText("THIZ IZ CONFUZING!!! WATERCOLOR IS CONFUZING!!!");
            txtBro.start(0.03);
        }

    if (alongTheDialogue == 21 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxDPEAR", "");
        transitionShit("screenFade", "");
        name.text = '';
        txtBro.resetText("You enter the classroom,");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 22 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxDPEAR", "");
        name.text = '';
        ground = "Class1";
        txtBro.resetText("It smells like,.. jobs?? tf that aint supposed to happen :sob:");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 23 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxPEAR", "");
        transitionShit("screenUnfade", "");
        char1var = 'BrooklynGuy';
        characterStatus("APPEAR", char1);
        name.text = 'Brooklyn Guy';
        txtBro.resetText("Oh boy I sure do LOVE my jobs class");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 24 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxPEAR", "");
        transitionShit("screenUnfade", "");
        char1var = 'BrooklynGuy';
        characterStatus("APPEAR", char1);
        name.text = 'Brooklyn Guy';
        txtBro.resetText("I love jobs :grin:");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 25 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'You';
        txtBro.resetText("HOLY CRAP LOUIS ITS BROOKLYN T. GUY");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 26 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'Brooklyn Guy';
        txtBro.resetText("Brooklyn T. Guy");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 27 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'You';
        txtBro.resetText("This fucking ROCKS.");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 28 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        name.text = 'Brooklyn Guy';
        txtBro.resetText("Well Brooklyn T. Guy. you did it again.");
        txtBro.start(0.03); 
    }

    if (alongTheDialogue == 29 && placeToBe == "class1BROOKLYN") {
        canDoShitDude = true;
        transitionShit("nameBoxDPEAR", "");
        transitionShit("screenFade", "");
        name.text = '';
        txtBro.resetText("you BLACK OUT lmao\n\nbut ur like awake now so yeah does a kissy face");
        txtBro.start(0.03);
    }

    if (alongTheDialogue == 30 && placeToBe == "class1BROOKLYN") {
        alongTheDialogue = 22;
        placeToBe = "class1";
    }

        if (alongTheDialogue == 21 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            transitionShit("screenFade", "");
            name.text = '';
            txtBro.resetText("You enter the classroom,");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 22 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            ground = "Class1";
            txtBro.resetText("It smells like,.. blood?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 23 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            transitionShit("screenUnfade", "");
            char1var = 'Kathy/Base';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("Oh boy I sure do LOVE my blood class");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 24 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Tired';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("...");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 25 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Tired';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("Who are you?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 26 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            char1var = 'Kathy/Tired';
            characterStatus("APPEAR", char1);
            name.text = '';
            txtBro.resetText("this dialogue doesnt exist you're seeing things");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 27 && placeToBe == "class1") {
            canDoShitDude = true;
            transitionShit("nameBoxPEAR", "");
            char1var = 'Kathy/Happy';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("oh, [NONEXISTENT NAME], thats a nice name");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 28 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Confused';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("how did you uh... get here? ive never seen you in this school before");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 29 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Angry';
            characterStatus("APPEAR", char1);
            name.text = 'You';
            txtBro.resetText("The Door");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 30 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Angry';
            characterStatus("APPEAR", char1);
            name.text = 'Kathy';
            txtBro.resetText("wow. you're so funny");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 31 && placeToBe == "class1") {
            canDoShitDude = true;
            char1var = 'Kathy/Ew';
            characterStatus("SIDERIGHT", char1);
            characterStatus("FLYIN", char2);
            char2.x = 375;
            characterStatus("DEPRIO", char1);
            char2var = 'dudeDating';
            name.text = 'DudeMan';
            txtBro.resetText("hello friends are you liking my awesome sudduesxchohol");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 32 && placeToBe == "class1") {
            canDoShitDude = true;
            name.text = 'DudeMan';
            characterStatus("SIDELEFT", char2);
            txtBro.resetText("wait");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 33 && placeToBe == "class1") {
            canDoShitDude = true;
            name.text = 'DudeMan';
            char1var = 'Kathy/oh';
            txtBro.resetText("Kathy why the FUCK do you look like that");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 34 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Kathy';
            txtBro.resetText("Cuz i can");
            txtBro.start(0.03);
        }
        
        if (alongTheDialogue == 35 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("KATHY");
            txtBro.start(0.03);
        }
               
        if (alongTheDialogue == 36 && placeToBe == "class1") {
            canDoShitDude = true;
            name.text = 'DudeMan';
            txtBro.resetText("YOU'RE NOT SUPPOSED TO LOOK LIKE THAT");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 37 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Kathy';
            txtBro.resetText("Cuz i can");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 38 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("I HATE YOU");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 39 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("PRIO", char1);
            characterStatus("DEPRIO", char2);
            name.text = 'Kathy';
            txtBro.resetText("No you dont");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 40 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("DEPRIO", char1);
            characterStatus("PRIO", char2);
            name.text = 'DudeMan';
            txtBro.resetText("You're right");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 41 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("FLYOUT", char2);
            name.text = '';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 42 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            characterStatus("PRIO", char1);
            name.text = 'Kathy';
            txtBro.resetText("Good Riddance I hate that guy");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 43 && placeToBe == "class1") {
            canDoShitDude = true;
            characterStatus("MIDDLE", char1);
            characterStatus("PRIO", char1);
            name.text = 'Kathy';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 21 && placeToBe == "hallway2") {
            transitionShit("nameBoxDPEAR", "");
            canDoShitDude = false;
            transitionShit("switchLocation", "Hallway2");
        }

        if (alongTheDialogue == 22 && placeToBe == "hallway2") {
            transitionShit("nameBoxDPEAR", "");
            canDoShitDude = true;
            characterStatus("UNAPPEAR", char1);
            name.text = '';
            buttonText2Be("Nah bro take me back");
            buttonText3Be("Janitor's Closet");
            buttonText4Be("Class on the Right");
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            txtBro.resetText("Theres two doors you can go through");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 23 && placeToBe == "hallway2") {
            transitionShit("nameBoxDPEAR", "");
            alongTheDialogue = 19;
            transitionShit("switchLocation", "Hallway1");
        }

        if (alongTheDialogue == 23 && placeToBe == "JanitorCloset") {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            transitionShit("screenFade", "");
            name.text = '';
            txtBro.resetText("You enter the janitors closet,");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 24 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            txtBro.resetText("it smells of,.., windex");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 25 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            canDoShitDude = true;
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            ground = 'JanitorCloset';
            txtBro.resetText("Who up washing my windows");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 26 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            canDoShitDude = true;
            transitionShit("screenUnfade", "");
            transitionShit("nameBoxDPEAR", "");
            name.text = '';
            txtBro.resetText("You may be the first person in this school to see what the janitors closet looks like, good for you!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 27 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 28 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 29 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("Well there, partner! this is for Janitors only!");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 30 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            buttonText3Be("idfk");
            buttonText4Be("I like windex smell");
            buttonAdd(3);
            buttonAdd(4);
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("What're you doin here?");
            txtBro.start(0.03);
        }

        if (alongTheDialogue == 31 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            characterStatus("APPEAR", char1);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("thats fair");
            txtBro.start(0.03);
            neverTalkedToJanitor = false;
            alongTheDialogue = 23;
        }

        if (alongTheDialogue == 24 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false) {
            ground = 'JanitorCloset';
            transitionShit("screenUnfade", "");
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = false;
            characterStatus("APPEAR", char1);
            buttonText2Be("Yes!");
            buttonText3Be("Could we just talk?");
            buttonText4Be("No thanks, Man");
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("ya wanna view my wares, partner?");
            txtBro.start(0.03);
        } 

        if (alongTheDialogue == 25 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false && inTalk == true) {
            ground = 'JanitorCloset';
            char1var = 'jimoJanitor';
            canDoShitDude = false;
            characterStatus("APPEAR", char1);
            buttonText1Be("School Secrets?");
            buttonText2Be("Opinions on Ppl?");
            buttonText3Be("Supplier?");
            buttonText4Be("[More Options]");
            buttonAdd(1);
            buttonAdd(2);
            buttonAdd(3);
            buttonAdd(4);
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("oh, alrigh, 'bout what?");
            txtBro.start(0.03);
        } 
        
        if (alongTheDialogue == 25 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false && notTalkOrShop == true) {
            transitionShit("nameBoxPEAR", "");
            char1var = 'jimoJanitor';
            canDoShitDude = true;
            name.text = 'Jimbo T. Janitor';
            txtBro.resetText("ok");
            txtBro.start(0.03);
        } 

        if (alongTheDialogue == 26 && placeToBe == "JanitorCloset" && neverTalkedToJanitor == false && notTalkOrShop == true) {
            transitionShit("nameBoxDPEAR", "");
            canDoShitDude = false;
            placeToBe = "hallway2";
            transitionShit("switchLocation", "Hallway2");
            alongTheDialogue = 21;
        } 


        if (FlxG.save.data.imFromBrooklyn == true) {
            char1var = "BrooklynGuy";
            char2var = "BrooklynGuy";
            name.text = 'Brooklyn Guy';
        }

        char1.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char1var));
        char2.loadGraphic(Paths.image('shh/DATINGSIM/ports/'+char2var));
        bg.loadGraphic(Paths.image('shh/DATINGSIM/background/'+ground));
    
            key.alpha = 0;
            buttonText3Be("Yeah, Man !");
            buttonText4Be("No, dude.");
            buttonAdd(3);
            buttonAdd(4);
    
}