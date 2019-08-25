/* SETUP */
(
~realization = (
	libPath: //fill in with absolute path of lib folder,
	memSize: 128 * 1024,
	sampleRate: 48000,
	pieces: nil,
	playlist:nil,
	player:nil,
	score: nil,
	colorMaker: nil,
	setUp: {arg self;

		var vals = (self.libPath ++ "/helpers/setup.scd").load.setUp(self.libPath, self.memSize, self.sampleRate).value();

		self.pieces = vals.pieces;
		self.playlist = vals.playlist;
		self.player = vals.player;
		self.score = vals.score;
		self.colorMaker = vals.colorMaker;
	};
);
)

~realization.setUp;


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
~realization.player.task.play(SystemClock);
~realization.player.task.stop
