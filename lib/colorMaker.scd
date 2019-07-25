(
    (
        actualColors: [
            Color.new255(20, 60, 48,240),
            Color.new255(0, 100, 255,180),
            Color.new255(25, 80, 170),
            Color.new255(120, 0, 100,160),
            Color.new255(180, 80, 0),
            Color.new255(220, 140, 0,255),
            Color.new255(255, 200, 0,210),
            Color.new255(50, 205, 120)
        ],

        colorValues: (
            'dark green': Color.new255(20, 60, 48,240), 
            'light blue': Color.new255(0, 100, 255,180), 
            'dark blue': Color.new255(25, 80, 170), 
            'purple': Color.new255(120, 0, 100,160), 
            'rust': Color.new255(180, 80, 0), 
            'orange': Color.new255(220, 140, 0,255), 
            'yellow': Color.new255(255, 200, 0,210), 
            'light green': Color.new255(50, 205, 120)
        ),

        setColors: {|self, colors|
            var newColors = [];

            colors.do({|color|
                var newColor;

                newColor = color[\color];
                newColors = newColors.add(self.colorValues[newColor])
            });

            self.actualColors = newColors
        },

        draw: {|self, frame|
            {
                self.setColors(frame);
                self.window.refresh
            }.defer
        },

        create: {|self|
            self.window = Window.new
                .drawFunc_({
                    self.actualColors.do({|color, i|
                        var bounds = Window.screenBounds;

                        Pen.fillColor = color;
                        Pen.fillRect(Rect((bounds.width / 8) * i, 0, bounds.width / 8, bounds.height))
                    }) 
                })
                .front
        }
    )
)
