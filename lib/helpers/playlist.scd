(
    (

	   directory: (),

	   pieces: [],

       initializePieceDirectory: {|self, path|

            PathName.new(path).files.collect({|f|
                f.fullPath.load
            }).do({|p|
                p.init;
                self.directory.add(p.title -> p)
            })
        },

        create: {|self, pieceList|
		    pieceList.isNil.if{
		        "please provide a piece list".postln;
		    } {
			   self.pieces = pieceList.collect({|title|
				self.directory[title];
			   })
		    };
		    self.pieces = self.pieces.removeEvery([nil])
        },

	    postNames: {|self|
		    self.directory.keys.postln;
        }
    )
)
