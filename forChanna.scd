(
    {
        s.options.memSize = 128 * 1024;
        s.options.sampleRate = 48000;

	// ~libPath = "~/Documents/SC/2019/channa/V3/lib/".asAbsolutePath; // change as needed
        ~piecePath = ~libPath ++ "pieces/";
        ~pieces = ();

        PathName.new(~piecePath).files.collect({|f|
            f.fullPath.load
        }).do({|p|
            p.init;
            ~pieces.add(p.title -> p)
        });

        ~score = (~libPath ++ "score.scd").load;
        ~score.create;

        ~colorMaker = (~libPath ++ "colorMaker.scd").load;
        ~colorMaker.create;

        ~player = (~libPath ++ "player.scd").load;
        ~player.create(~score, ~pieces, 0.1, ~colorMaker);

        /*
        ~player.changeSetList([
            \channaMary,
            \channaMary,
            \channaGuit,
            \channaMaryTwo,
            \channaMaryTwo
        ]);
        */

        ~player.changeSetList([\channaJar]);

        "Config OK!".postln
    }.fork(AppClock)
)

~player.task.play(SystemClock)
~player.task.stop
