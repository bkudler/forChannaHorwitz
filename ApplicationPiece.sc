ApplicationPiece {
	var <colors, <def, <title, <>drawer, finalWait = 0;

	init {
		this.subclassResponsibility("init");
	}

	setup {}

	teardown {}

	startMovement {}

	endMovement {}

	play {
		this.subclassResponsibility("play");		
	}

	prDraw {
		this.subclassResponsibility("draw");
	}

}