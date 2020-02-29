ChannaMaryOnePiece : ApplicationPiece {

    var base = 88.3125, length = 0.1, colorWait = 0.1, mainWait = 0.03, lengths;


    *new {|finalWait|
        ^super.new.init(finalWait);
    }


    init {|finalWaitArg|        
		title = \channaMaryOnePiece;
        finalWait = finalWaitArg;

        SynthDef(\channaMaryOnePiece, {arg baseFreq=90, length=1, phase=90, pan=0;
            var out, mul, env, pitch, relLength, filt1, filt2, filt3;

            pitch = baseFreq.midicps;

            //little bit more than it would actually be
            relLength = length - (0.3 + 0.09);

            env = EnvGen.ar(Env([0,0.25,0.08,0],[0.09,0.3,relLength+0.2]),Line.kr(1,0,length+2),doneAction:2);

            out = SinOsc.ar(pitch,phase, env);

            filt1 = RHPF.ar(out, baseFreq - 0.1, 0.25 , 0.1);

            filt2 = RHPF.ar(out, baseFreq - 0.1, 0.5 , 0.1);

            filt3 = RHPF.ar(out, baseFreq - 0.1, 1 , 0.15);


            out = Mix([filt1, filt2, filt3,out]);


            Out.ar(0,Pan2.ar(out,pan));

        }).add;

        colors = (


            'dark green': [\baseFreq, [base,(base.midicps*1.2).cpsmidi], \length, length, \phase:45, pan:1] ,


            'light blue': [\baseFreq, [base+2,((base+3).midicps*1.205).cpsmidi], \length, length*(7/8), \phase:-45, pan:1],


            'dark blue':  [\baseFreq, [base+4,((base+4).midicps*1.2).cpsmidi],  \length, length*(6/8),\phase:90, pan:1],


            'purple': [\baseFreq, [base+6,((base+6).midicps*1.21).cpsmidi], \length, length*(5/8), \phase:-90, pan:-1],

            'rust' :  [\baseFreq, [base+8,((base+8).midicps*1.2).cpsmidi], \length, length*(4/8), \phase:180, pan:-1],


            'orange': [\baseFreq, [base+10,((base+10).midicps*1.201).cpsmidi],\length, length*(3/8), \phase:-180, pan:-1],


            'yellow': [\baseFreq, [base+12,((base+12).midicps*1.2).cpsmidi], \length, length*(2/8), \phase:180, pan:1],


            'light green':[\baseFreq, [base+14,((base+14).midicps*1.205).cpsmidi], \length, length*(1/8), \phase: 45, pan:-1],


        );

        lengths = [
                [
                    length,
                    length*(7/8),
                    length*(6/8),
                    length*(5/8),
                    length*(4/8),
                    length*(3/8),
                    length*(2/8),
                    length*(1/8)
                ],
                [
                    length*(1/8),
                    length,
                    length*(7/8),
                    length*(6/8),
                    length*(5/8),
                    length*(4/8),
                    length*(3/8),
                    length*(2/8)
                ],
                [
                    length*(2/8),
                    length*(1/8),
                    length,
                    length*(7/8),
                    length*(6/8),
                    length*(5/8),
                    length*(4/8),
                    length*(3/8)
                ],
                [
                    length*(3/8),
                    length*(2/8),
                    length*(1/8),
                    length,
                    length*(7/8),
                    length*(6/8),
                    length*(5/8),
                    length*(4/8)
                ],
                [
                    length*(4/8),
                    length*(3/8),
                    length*(2/8),
                    length*(1/8),
                    length,
                    length*(7/8),
                    length*(6/8),
                    length*(5/8)
                ],
                [
                    length*(5/8),
                    length*(4/8),
                    length*(3/8),
                    length*(2/8),
                    length*(1/8),
                    length,
                    length*(7/8),
                    length*(6/8)
                ],
                [
                    length*(6/8),
                    length*(5/8),
                    length*(4/8),
                    length*(3/8),
                    length*(2/8),
                    length*(1/8),
                    length,
                    length*(7/8)
                ],
                [
                    length*(7/8),
                    length*(6/8),
                    length*(5/8),
                    length*(4/8),
                    length*(3/8),
                    length*(2/8),
                    length*(1/8),
                    length
                ]
            ];
	}


    setup {
        title.postln;
    }


    teardown {
        {
           "FIN".postln;
            finalWait.wait;
        }.forkIfNeeded
    }

	playSection  {|section|
            {

                section.do({|color, index|
                    var delta = 0;
                    ["color", color].postln;
                    color[\active].if {
                        var x, y, vars;

                        vars = colors[color[\color]].asDict;
                        x = color[\x] - 1;
                        y = color[\y] - 1;
                        vars[\length] = lengths[y][x];
                        vars = vars.asPairs;

                        vars.postln;

                        Synth(title, vars);
                        delta = colorWait
                    };

                    delta.yield;
                });

                mainWait.yield
            }.forkIfNeeded
    }

    play{|section, index|
        this.prDraw(section);
        this.playSection(section, index);
    }

	prDraw {|section, index|
        drawer.draw(section, index);
	}


}