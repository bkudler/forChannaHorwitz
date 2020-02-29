ChannaHorwitzController : ApplicationController {

	init{
		^this;
	}

	playPieces{
		Task.new({
			pieces.do({arg piece;
				0.1.yield;
	            piece.setup();
	            score.movements.do({|movement, i|
	                piece.startMovement(i);

	                movement.do({|section, j|
	                    piece.play(section, j);
	                });

	                piece.endMovement(i);
	            });

	            piece.teardown();
			})
		}).play;
	}
}