/* SETUP */

(
    //change as needed
    ~libPath = //put path to library here;
    ~memSize = 128 * 1024;
    ~sampleRate = 48000;
    (~libPath ++ "/helpers/setup.scd").load.setUp(~libPath, ~memSize, ~sampleRate);
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
