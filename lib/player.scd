(
    (
        create: {|self, score, pieces, waitTime=0.1, display|
            self.score = score;
            self.pieces = pieces;
            self.waitTime = waitTime;
            self.display = display;

            self.setList = self.setList.isNil.if { pieces.keys.asArray.scramble } { self.setList };
            
            self.task = Task.new({
                self.setList.do({|title|
                    waitTime.yield;
                    self.playPiece(score, pieces[title], display)
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
        },

        changeSetList: {|self, setList|
            self.setList = setList;
            self.create(self.score, self.pieces, self.waitTime, self.display)
        }
    )
)
