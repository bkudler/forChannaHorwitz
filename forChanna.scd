(
    {
        s.options.memSize = 128 * 1024;
        s.options.sampleRate = 48000;
	// ~libPath = "~/Documents/SC/2019/channa/forChannaHorwitz/lib/".asAbsolutePath; // change as needed
	~libPath = "/Users/bkudler/dev/complex-data/forChannaHorwitz/lib/".asAbsolutePath;

        ~piecePath = ~libPath ++ "pieces/";
        ~pieces = ();

        PathName.new(~piecePath).files.collect({|f|
            f.fullPath.load
        }).do({|p|
            p.init;
            ~pieces.add(p.title -> p)
        });

        ~playlist = (~libPath ++ "pieceList.scd").load;
        ~playlist.create(~pieces, [
            \channaJar,
//            \channaMary,
//            \channaMary,
//            \channaGuit,
//            \channaMaryTwo,
//            \channaMaryTwo
        ]);

        ~score = (~libPath ++ "score.scd").load;
        ~score.create;

        ~colorMaker = (~libPath ++ "colorMaker.scd").load;
        ~colorMaker.create;

        ~player = (~libPath ++ "player.scd").load;
        ~player.create(~score, ~playlist, 0.1, ~colorMaker);

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
