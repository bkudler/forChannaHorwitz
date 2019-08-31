/* SETUP */

(
    {
	~libPath = "/Users/bkudler/forChannaHorwitz/lib".asAbsolutePath; // change as needed
        ~piecePath = ~libPath ++ "/views/players";

        ~pieces = (~libPath ++ "/helpers/pieces.scd").load;
        ~pieces.create(~piecePath);

        ~playlist = (~libPath ++ "/helpers/playlist.scd").load;
        ~playlist.create(~pieces.directory);

        ~score = (~libPath ++ "/models/score.scd").load;
        ~score.create;

        ~colorMaker = (~libPath ++ "/views/colors/colorMaker.scd").load;
        ~colorMaker.create;

        ~player = (~libPath ++ "/controllers/player.scd").load;
        ~player.create(~score, ~playlist, 0.1, ~colorMaker);

        s.bootSync;
        "Config OK!".postln
    }.fork(AppClock)
)

/* USAGE */

// list available pieces
~pieces.postNames;

// create new playlist and player
(
    ~playlist.create(~pieces.directory, [
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
