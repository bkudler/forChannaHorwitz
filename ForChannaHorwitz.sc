ForChannaHorwitz {

	var playlist = #[], player, colorMaker, score, classPieces, controller;

	setup{ |pieces|

		var serverRunning, server, drawer;

		if(pieces.isNil.or(pieces.isArray.not), { Error("You must pass a pieces array").throw });

		drawer = ChannaHorwitzDrawer();

		server = Server.default;
		server.options.memSize = 128 * 1024;
		server.options.sampleRate = 48000;

		pieces.do({arg piece;
			// piece.init();
			piece.drawer = drawer
		});

		classPieces = pieces;

		score = ChannaHorwitzScore();
		score.withReverse();


		controller = ChannaHorwitzController(score, pieces);

	}


	displayPieces {
		classPieces.do({arg piece;
			piece.title.postln;
			"---------".postln;
		});
	}

	removePiece {|title|
		var newPieces = [];
		classPieces.do({arg piece;
			if(piece.title !== title, {newPieces = newPieces.add(piece) });
		});
		classPieces = newPieces;
	}

	addPiece{|piece|
		classPieces = classPieces.add(piece);
	}

	start {
		controller.playPieces();
	}






}
