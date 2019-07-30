(
    (
        create: {|self, pieces, pieceList|
            self.pieces = pieceList.isNil.if {
                pieces.values.scramble
            } {
                pieceList.collect({|title| pieces[title] })
            }
        }
    )
)
