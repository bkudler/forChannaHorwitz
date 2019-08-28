/* SETUP */
(
~realization = (
	libPath: "/Users/bkudler/dev/complex-data/forChannaHorwitz/lib/",
	memSize: 128 * 1024,
	sampleRate: 48000,
	pieces: nil,
	playlist:nil,
	player:nil,
	score: nil,
	colorMaker: nil,
	helper: {arg self; (self.libPath ++ "/helpers/setup.scd").load},
	startServer: {arg self;
		self.helper.value.startServer(self.memSize, self.sampleRate);
	},
	setUp: {arg self;
		    var vals;
		    vals =
 self.helper.value.setUp(self.libPath).value();
			self.pieces = vals.pieces;
		    self.playlist = vals.playlist;
		    self.player = vals.player;
		    self.score = vals.score;
		    self.colorMaker = vals.colorMaker;
		}
);
)

(
{
	~realization.startServer;
	while({s.serverRunning !== true}){
		1.wait;
	};
	~realization.setUp;
}.fork(AppClock);
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
~realization.player.task.play(SystemClock);
~realization.player.task.stop
