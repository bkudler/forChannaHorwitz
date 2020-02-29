c = ForChannaHorwitz();

d = ChannaJarPiece();
e = ChannaGuitPiece(28);
f = ChannaMaryOnePiece(4);
g = ChannaMaryTwoPiece();
h = ChannaWaveChonkPiece();
i = ChannaWaveBlistPiece();

p = [d, e, f, g, h, i];
p = [d, e, f];

c.setup(p);
c
c.displayPieces;
c.addPiece(j);
c.displayPieces;
c.removePiece(e.title);
c.displayPieces;


c.start