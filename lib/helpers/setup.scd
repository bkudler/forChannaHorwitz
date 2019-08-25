(
    (
        setUp: {|self, basePath, memSize, sampleRate|
		    var piecePath, pieces, playlist, score, colorMaker, player;

            s.options.memSize = memSize;
            s.options.sampleRate = sampleRate;

            piecePath = basePath ++ "/views/players";

            pieces = ( basePath++ "/helpers/pieces.scd").load;
            pieces.create(piecePath);

            playlist = (basePath ++ "/helpers/playlist.scd").load;
            playlist.create(pieces.directory);

            score = (basePath ++ "/models/score.scd").load;
            score.create;

            colorMaker = (basePath ++ "/views/colors/colorMaker.scd").load;
            colorMaker.create;

            player = (basePath ++ "/controllers/player.scd").load;
            player.create(score, playlist, 0.1, colorMaker);

            "Config OK!".postln;

		    (pieces: pieces, playlist: playlist, player: player, score: score, colorMaker: colorMaker);
        }
    )
)

