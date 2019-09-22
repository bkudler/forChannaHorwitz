/* SETUP */

(
    {
	     var libPath, piecePath, pieces, playlist, score, colorMaker, player, serverRunning;

	    libPath = Document.current.dir++"/lib".asAbsolutePath; // change as needed
        piecePath = libPath ++ "/views/players";

        pieces = (libPath ++ "/helpers/pieces.scd").load;
        pieces.create(piecePath);

        playlist = (libPath ++ "/helpers/playlist.scd").load;
        playlist.create(pieces.directory);

        score = (libPath ++ "/models/score.scd").load;
        score.create;

        colorMaker = (libPath ++ "/views/colors/colorMaker.scd").load;
        colorMaker.create;

        player = (libPath ++ "/controllers/player.scd").load;
        player.create(score, playlist, 0.1, colorMaker);

	    serverRunning = Condition.new;
        s.reboot;
        s.doWhenBooted({
            serverRunning.test_(true);
            serverRunning.signal
        });
        serverRunning.wait;

        "Config OK!".postln;

	    ~realization = (pieces: pieces, playlist: playlist, score: score, colorMaker: colorMaker,
		    player: player);
    }.fork(AppClock)
)

/* USAGE */

// list available pieces
~realization.pieces.postNames;

// create new playlist and player
(
    ~realization.playlist.create(~realization.pieces.directory, [
	\channaJar,
        // \channaMary,
        // \channaMary,
	    // \channaGuit,
	    // \channaMaryTwo,
        // \channaMaryTwo
    ]);

    ~realization.player.create(~realization.score, ~realization.playlist, 0.1, ~realization.colorMaker)
)

// play playlist on player
~realization.player.task.play(SystemClock)
~realization.player.task.stop