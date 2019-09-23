/* SETUP */

(
    {
        s.options.memSize = 128 * 1024;
        s.options.sampleRate = 48000;


	    ~libPath = "/Users/bkudler/forChannaHorwitz/lib".asAbsolutePath;
        ~piecePath = ~libPath ++ "/views/players";

        ~playlist = (~libPath ++ "/helpers/playlist.scd").load;
	    ~playlist.initializePieceDirectory(~piecePath);

        ~score = (~libPath ++ "/models/score.scd").load;
        ~score.create;

        ~colorMaker = (~libPath ++ "/views/colors/colorMaker.scd").load;
        ~colorMaker.create;

        ~player = (~libPath ++ "/controllers/player.scd").load;
        ~player.create(~score, ~playlist, 0.1, ~colorMaker);

        ~serverRunning = Condition.new;
        s.reboot;
        s.doWhenBooted({
            ~serverRunning.test_(true);
            ~serverRunning.signal
        });
        ~serverRunning.wait;

        "Config OK!".postln
    }.fork(AppClock)
)

/* USAGE */

// list available pieces
~playlist.postNames;

// create new playlist and player
(
    ~playlist.create([
        // \channaJar,
        // \channaMary,
        // \channaMary,
        \channaGuit,
        \channaMaryTwo,
        // \channaMaryTwo
    ]);

    ~player.create(~score, ~playlist, 0.1, ~colorMaker)
)

// play playlist on player
~player.task.play(SystemClock)
~player.task.stop
