ApplicationController {
	var <score, pieces;

	*new { |score, pieces|
		^super.newCopyArgs(score, pieces).init();
	}

	init {
		this.subclassResponsibility("init");
	}

	playPieces {
		this.subclassResponsibility("playPieces");
	}


}