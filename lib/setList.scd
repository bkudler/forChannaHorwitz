(
    (
        create: {|self, pieces, setList| 
            self.pieces = setList.isNil.if {
                pieces.values.scramble
            } {
                setList.collect({|title| pieces[title] }) 
            }
        }
    )
)
