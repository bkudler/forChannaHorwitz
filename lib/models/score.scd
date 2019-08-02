(
    (
        create: {|self|
            self.movements = [self.graph, self.graph2, self.graph2.reverse, self.graph.reverse]
        },

        graph: [
            [
                (x:1, y:1,color:'dark green',active:true), 
                (x:2, y:1,color:'light blue',active:true), 
                (x:3, y:1,color:'dark blue',active:true), 
                (x:4, y:1,color:'purple',active:true), 
                (x:5, y:1,color:'rust',active:true), 
                (x:6, y:1,color:'orange',active:true), 
                (x:7, y:1,color:'yellow',active:true), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:true), 
                (x:2, y:1,color:'light blue',active:false), 
                (x:3, y:1,color:'dark blue',active:false), 
                (x:4, y:1,color:'purple',active:false), 
                (x:5, y:1,color:'rust',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:2,color:'dark green',active:true), 
                (x:3, y:1,color:'dark blue',active:false), 
                (x:4, y:1,color:'purple',active:false), 
                (x:5, y:1,color:'rust',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:true), 
                (x:3, y:2,color:'light blue',active:true), 
                (x:4, y:1,color:'purple',active:false), 
                (x:5, y:1,color:'rust',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:2,color:'light blue',active:false), 
                (x:4, y:2,color:'dark blue',active:true), 
                (x:5, y:1,color:'rust',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:3,color:'dark green',active:true), 
                (x:4, y:2,color:'dark blue',active:false), 
                (x:5, y:2,color:'purple',active:true), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:true), 
                (x:4, y:2,color:'dark blue',active:false), 
                (x:5, y:2,color:'purple',active:false), 
                (x:6, y:2,color:'rust',active:true), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:3,color:'light blue',active:true), 
                (x:5, y:2,color:'purple',active:false), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:2,color:'orange',active:true), 
                (x:8, y:1,color:'light green',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:3,color:'light blue',active:false), 
                (x:5, y:2,color:'purple',active:false), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:2,color:'yellow',active:true)
            ], [
                (x:1, y:3,color:'yellow',active:true), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:4,color:'dark green',active:true), 
                (x:5, y:3,color:'dark blue',active:true), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:5,color:'light green',active:true), 
                (x:5, y:3,color:'dark blue',active:false), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:true), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:3,color:'dark blue',active:false), 
                (x:6, y:3,color:'purple',active:true), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:4,color:'light blue',active:true), 
                (x:6, y:3,color:'purple',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:4,color:'light blue',active:false), 
                (x:6, y:3,color:'purple',active:false), 
                (x:7, y:3,color:'rust',active:true), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:5,color:'yellow',active:true), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:5,color:'dark green',active:true), 
                (x:6, y:3,color:'purple',active:false), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:6,color:'light green',active:true), 
                (x:6, y:4,color:'dark blue',active:true), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:3,color:'orange',active:true)
            ], [
                (x:1, y:4,color:'orange',active:true), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:4,color:'dark blue',active:false), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:4,color:'dark blue',active:false), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:5,color:'orange',active:true), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:6,color:'yellow',active:true), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:5,color:'light blue',active:true), 
                (x:7, y:4,color:'purple',active:true), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:5,color:'light blue',active:false), 
                (x:7, y:4,color:'purple',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:6,color:'dark green',active:true), 
                (x:7, y:4,color:'purple',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:6,color:'orange',active:true), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:7,color:'light green',active:true), 
                (x:7, y:4,color:'purple',active:false), 
                (x:8, y:4,color:'rust',active:true)
            ], [
                (x:1, y:5,color:'rust',active:true), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:5,color:'dark blue',active:true), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:7,color:'yellow',active:true), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:5,color:'dark blue',active:false), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:6,color:'rust',active:true), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:5,color:'dark blue',active:false), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:7,color:'orange',active:true), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:6,color:'light blue',active:true), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:6,color:'light blue',active:false), 
                (x:8, y:5,color:'purple',active:true)
            ], [
                (x:1, y:6,color:'purple',active:true), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:7,color:'rust',active:true), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:7,color:'dark green',active:true), 
                (x:8, y:5,color:'purple',active:false)
            ], [
                (x:1, y:6,color:'purple',active:false), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:8,color:'light green',active:true), 
                (x:8, y:5,color:'purple',active:false)
            ], [
                (x:1, y:6,color:'purple',active:false), 
                (x:2, y:7,color:'purple',active:true), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:8,color:'yellow',active:true), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:5,color:'purple',active:false)
            ], [
                (x:1, y:6,color:'purple',active:false), 
                (x:2, y:7,color:'purple',active:false), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:8,color:'orange',active:true), 
                (x:6, y:8,color:'yellow',active:false), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:6,color:'dark blue',active:true)
            ], [
                (x:1, y:7,color:'dark blue',active:true), 
                (x:2, y:7,color:'purple',active:false), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:8,color:'rust',active:true), 
                (x:5, y:8,color:'orange',active:false), 
                (x:6, y:8,color:'yellow',active:false), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:6,color:'dark blue',active:false)
            ], [
                (x:1, y:7,color:'dark blue',active:false), 
                (x:2, y:7,color:'purple',active:false), 
                (x:3, y:8,color:'purple',active:true), 
                (x:4, y:8,color:'rust',active:false), 
                (x:5, y:8,color:'orange',active:false), 
                (x:6, y:8,color:'yellow',active:false), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:6,color:'dark blue',active:false)
            ], [
                (x:1, y:7,color:'dark blue',active:false), 
                (x:2, y:8,color:'dark blue',active:true), 
                (x:3, y:8,color:'purple',active:false), 
                (x:4, y:8,color:'rust',active:false), 
                (x:5, y:8,color:'orange',active:false), 
                (x:6, y:8,color:'yellow',active:false), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:7,color:'light blue',active:true)
            ], [
                (x:1, y:8,color:'light blue',active:true), 
                (x:2, y:8,color:'dark blue',active:false), 
                (x:3, y:8,color:'purple',active:false), 
                (x:4, y:8,color:'rust',active:false), 
                (x:5, y:8,color:'orange',active:false), 
                (x:6, y:8,color:'yellow',active:false), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:7,color:'light blue',active:false)
            ], [
                (x:1, y:8,color:'light blue',active:false), 
                (x:2, y:8,color:'dark blue',active:false), 
                (x:3, y:8,color:'purple',active:false), 
                (x:4, y:8,color:'rust',active:false), 
                (x:5, y:8,color:'orange',active:false), 
                (x:6, y:8,color:'yellow',active:false), 
                (x:7, y:8,color:'light green',active:false), 
                (x:8, y:8,color:'dark green',active:true)
            ]
        ],

        graph2: [
            [
                (x:1, y:7,color:'dark blue',active:true), 
                (x:2, y:7,color:'purple',active:true), 
                (x:3, y:7,color:'rust',active:true), 
                (x:4, y:7,color:'orange',active:true), 
                (x:5, y:7,color:'yellow',active:true), 
                (x:6, y:7,color:'light green',active:true), 
                (x:7, y:7,color:'dark green',active:true), 
                (x:8, y:7,color:'light blue',active:true)
            ], [
                (x:1, y:7,color:'dark blue',active:false), 
                (x:2, y:7,color:'purple',active:false), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:6,color:'light blue',active:true), 
                (x:8, y:7,color:'light blue',active:false)
            ], [
                (x:1, y:7,color:'dark blue',active:false), 
                (x:2, y:7,color:'purple',active:false), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:6,color:'light blue',active:false), 
                (x:8, y:6,color:'dark blue',active:true)
            ], [
                (x:1, y:6,color:'purple',active:true), 
                (x:2, y:7,color:'purple',active:false), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:5,color:'dark blue',active:true), 
                (x:8, y:6,color:'dark blue',active:false)
            ], [
                (x:1, y:6,color:'purple',active:false), 
                (x:2, y:6,color:'rust',active:true), 
                (x:3, y:7,color:'rust',active:false), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:5,color:'dark blue',active:false), 
                (x:8, y:6,color:'dark blue',active:false)
            ], [
                (x:1, y:6,color:'purple',active:false), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:6,color:'orange',active:true), 
                (x:4, y:7,color:'orange',active:false), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:5,color:'dark blue',active:false), 
                (x:8, y:5,color:'purple',active:true)
            ], [
                (x:1, y:6,color:'purple',active:false), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:true), 
                (x:5, y:7,color:'yellow',active:false), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:4,color:'purple',active:true), 
                (x:8, y:5,color:'purple',active:false)
            ], [
                (x:1, y:5,color:'rust',active:true), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:true), 
                (x:6, y:7,color:'light green',active:false), 
                (x:7, y:4,color:'purple',active:false), 
                (x:8, y:5,color:'purple',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:6,color:'rust',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:6,color:'dark green',active:true), 
                (x:7, y:4,color:'purple',active:false), 
                (x:8, y:5,color:'purple',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:5,color:'orange',active:true), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:5,color:'light blue',active:true), 
                (x:7, y:4,color:'purple',active:false), 
                (x:8, y:4,color:'rust',active:true)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:6,color:'orange',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:5,color:'light blue',active:false), 
                (x:7, y:3,color:'rust',active:true), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:5,color:'rust',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:5,color:'yellow',active:true), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:4,color:'dark blue',active:true), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:4,color:'orange',active:true), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:6,color:'yellow',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:4,color:'dark blue',active:false), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:true), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:4,color:'dark blue',active:false), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:4,color:'rust',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:5,color:'orange',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:6,color:'light green',active:false), 
                (x:6, y:3,color:'purple',active:true), 
                (x:7, y:3,color:'rust',active:false), 
                (x:8, y:3,color:'orange',active:true)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:4,color:'yellow',active:true), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:5,color:'dark green',active:true), 
                (x:6, y:3,color:'purple',active:false), 
                (x:7, y:2,color:'orange',active:true), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:4,color:'light blue',active:true), 
                (x:6, y:3,color:'purple',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:4,color:'orange',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:5,color:'yellow',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:4,color:'light blue',active:false), 
                (x:6, y:3,color:'purple',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:true), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:4,color:'light green',active:true), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:3,color:'dark blue',active:true), 
                (x:6, y:2,color:'rust',active:true), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:3,color:'dark blue',active:false), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:3,color:'orange',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:5,color:'light green',active:false), 
                (x:5, y:3,color:'dark blue',active:false), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:2,color:'orange',active:false), 
                (x:8, y:2,color:'yellow',active:true)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:4,color:'yellow',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:4,color:'dark green',active:true), 
                (x:5, y:2,color:'purple',active:true), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:1,color:'yellow',active:true), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:3,color:'light green',active:true), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:3,color:'light blue',active:true), 
                (x:5, y:2,color:'purple',active:false), 
                (x:6, y:2,color:'rust',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:3,color:'light blue',active:false), 
                (x:5, y:2,color:'purple',active:false), 
                (x:6, y:1,color:'orange',active:true), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:3,color:'yellow',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:2,color:'dark blue',active:true), 
                (x:5, y:2,color:'purple',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:2,color:'light green',active:true), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:4,color:'light green',active:false), 
                (x:4, y:2,color:'dark blue',active:false), 
                (x:5, y:1,color:'rust',active:true), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:3,color:'dark green',active:true), 
                (x:4, y:2,color:'dark blue',active:false), 
                (x:5, y:1,color:'rust',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:2,color:'yellow',active:false)
            ], [
                (x:1, y:2,color:'light green',active:false), 
                (x:2, y:3,color:'light green',active:false), 
                (x:3, y:2,color:'light blue',active:true), 
                (x:4, y:1,color:'purple',active:true), 
                (x:5, y:1,color:'rust',active:false), 
                (x:6, y:1,color:'orange',active:false), 
                (x:7, y:1,color:'yellow',active:false), 
                (x:8, y:1,color:'light green',active:true)
            ]
        ]
    )
)

