(
    {
        s.options.memSize = 128 * 1024;
        s.options.sampleRate = 48000;
	~libPath = "/Users/bkudler/forChannaHorwitz/lib/".asAbsolutePath; // change as needed
        ~piecePath = ~libPath ++ "views/players/";
        ~pieces = ();

        PathName.new(~piecePath).files.collect({|f|
            f.fullPath.load;
        }).do({|p|
            p.init;
            ~pieces.add(p.title -> p);
        });

        ~playlist = (~libPath ++ "/helpers/playlist.scd").load;
	    ~playlist.create(~pieces, [
            \channaJar,
//            \channaMary,
//            \channaMary,
//            \channaGuit,
//            \channaMaryTwo,
//            \channaMaryTwo
	   ]);

        ~score = (~libPath ++ "/models/score.scd").load;
        ~score.create;

        ~colorMaker = (~libPath ++ "/views/colors/colorMaker.scd").load;
        ~colorMaker.create;

        ~player = (~libPath ++ "/controllers/player.scd").load;
        ~player.create(~score, ~playList, 0.1, ~colorMaker);

        "Config OK!".postln
    }.fork(AppClock)
)

~player.task.play(SystemClock)
~player.task.stop


(

~playlist.create(~pieces, [
	// \channaJar,
	// \channaMary,
	// \channaMary,
    \channaGuit,
    \channaMaryTwo,
	// \channaMaryTwo
]);

~player.create(~score, ~playlist, 0.1, ~colorMaker);

)

~player.task.play(SystemClock)
~player.task.stop
