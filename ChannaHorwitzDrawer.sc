ChannaHorwitzDrawer : ApplicationDrawer {

	var window, colorValues, actualColors;

	*new{
		^super.new.init();
	}

	setColors { |colors|
		var newColors = [];

            colors.do({|color|
                var newColor;
                newColor = color[\color];
                newColors = newColors.add(colorValues[newColor])
            });

            actualColors = newColors
	}

	setColorValues {
		colorValues = (
			'dark green': Color.new255(20, 60, 48,240), 
            'light blue': Color.new255(0, 100, 255,180), 
            'dark blue': Color.new255(25, 80, 170), 
            'purple': Color.new255(120, 0, 100,160), 
            'rust': Color.new255(180, 80, 0), 
            'orange': Color.new255(220, 140, 0,255), 
            'yellow': Color.new255(255, 200, 0,210), 
            'light green': Color.new255(50, 205, 120)
        );
	}

	setActualColors {
		actualColors = [
            Color.new255(20, 60, 48,240),
            Color.new255(0, 100, 255,180),
            Color.new255(25, 80, 170),
            Color.new255(120, 0, 100,160),
            Color.new255(180, 80, 0),
            Color.new255(220, 140, 0,255),
            Color.new255(255, 200, 0,210),
            Color.new255(50, 205, 120)
        ];
	}

	init {
		window = Window.new.drawFunc_({
	        actualColors.do({|color, i|
	            var bounds = Window.screenBounds;

	            Pen.fillColor = color;
	            Pen.fillRect(Rect((bounds.width / 8) * i, 0, bounds.width / 8, bounds.height))
	        }) 
	    }).front;
		this.setColorValues();
		this.setActualColors();
	}
	
	draw{ |frame|

	    {
	        this.setColors(frame);
	       	window.refresh();
	    }.defer
	}

}