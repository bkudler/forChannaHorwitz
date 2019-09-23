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
/*            self.pieces = pieceList.isNil.if {
                pieces.values.scramble
            } {
                pieceList.collect({|title| pieces[title] })
            }*/
		// var directory = self.directory;

		    pieceList.isNil.if{
		        "please provide a piece list".postln;
		    } {
			   self.pieces = pieceList.collect({|title|
				    self.directory[title].notNil.if{
					    self.directory[title];
				    }
			    })
		    }
        },

	    postNames: {|self|
		    self.directory.keys.postln;
        }
    )
)
