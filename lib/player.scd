(
    (
        create: {|self, score, setList, waitTime=0.1, display|
            self.score = score;
            self.setList = setList;
            self.waitTime = waitTime;
            self.display = display;
            
            self.task = Task.new({
                self.setList.pieces.do({|piece|
                    waitTime.yield;
                    self.playPiece(score, piece, display)
                })
            })
        },

        playPiece: {|self, score, piece, display|
            piece[\setup].notNil.if { piece.setup };

            score.movements.do({|movement, i|
                piece[\startMovement].notNil.if { piece.startMovement(i) };

                movement.do({|section, i|
                    display.notNil.if { display.draw(section, i) };

                    piece.playSection(section, i);
                });

                piece[\endMovement].notNil.if { piece.endMovement(i) };
            });

            piece[\teardown].notNil.if { piece.teardown }
        }
    )
)
