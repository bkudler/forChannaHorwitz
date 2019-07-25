(
    (
        title: \channaMary,
        mainWait: 0.03,
        colorWait: 0.1,

        def: SynthDef(\channaMaryTwo, {|baseFreq=90, length=1, phase=90, pan=0|
            var out, mul, env, pitch, relLength, filt1, filt2, filt3;

            pitch = baseFreq.midicps;

            //little bit more than it would actually be
            relLength = length - (0.001);

            env = Array.fill(5, {arg i;
                var doneAction;
                if(i == 4, {doneAction = 2},{doneAction = 0});
                i=i+1; i=i*0.01;
                EnvGen.ar(
                    Env([0,0.3,0.5,0],[0.009,0.003+i,relLength]),
                    Line.kr(1,0,length+0.01),
                    doneAction:doneAction
                )
            });

            out = Mix.fill(5, {|i, d|
                i=i+1; d=i*rrand(2,5); 
                SinOsc.ar(pitch+d,phase, env[i-1])*0.2
            });

            filt1 = RHPF.ar(out, baseFreq - 0.1, 0.2 , 0.5);
            filt2 = RHPF.ar(out, baseFreq - 0.1, 0.3 , 0.2);
            filt3 = RHPF.ar(out, baseFreq - 0.1, 1 , 0.15);

            out = Mix([filt1, filt2, filt3,out]);

            Out.ar(0,Pan2.ar(out,pan));
        }),

        init: {|self, length=0.1, base=88.3125|
            {
                s.bootSync;

                self.def.add;
                s.sync;

                self.lengths = self.makeLengths(length);
                self.colors = self.makeColors(base)
            }.forkIfNeeded
        },

        setup: {|self|
            self.title.postln
        },

        teardown: {|self|
            {
                self.mainWait.yield
            }.forkIfNeeded
        },

        playSection: {|self, section|
            {
                section.do({|color, index|
                    var delta = 0;

                    color[\active].if {
                        var x, y, vars;

                        vars = self.colors[color[\color]].asDict;
                        x = color[\x] - 1;
                        y = color[\y] - 1;
                        vars[\length] = self.lengths[y][x];
                        vars = vars.asPairs;

                        vars.postln;

                        Synth(self.def.name, vars);
                        delta = self.colorWait
                    };

                    delta.yield
                });

                self.mainWait.yield
            }.forkIfNeeded
        },

        makeLengths: {|self, length|
            [
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
            ]
        },

        makeColors: {|self, base|
            (
                'dark green': [
                    \baseFreq, [base,(base.midicps*1.2).cpsmidi], 
                    \phase, 45, 
                    \pan, 1
                ],
                'light blue': [
                    \baseFreq, [base+2,((base+3).midicps*1.205).cpsmidi], 
                    \phase, -45, 
                    \pan, 1
                ],
                'dark blue':  [
                    \baseFreq, [base+4,((base+4).midicps*1.2).cpsmidi], 
                    \phase, 90, 
                    \pan, 1
                ],
                'purple': [
                    \baseFreq, [base+6,((base+6).midicps*1.21).cpsmidi], 
                    \phase, -90, 
                    \pan, -1
                ],
                'rust' :  [
                    \baseFreq, [base+8,((base+8).midicps*1.2).cpsmidi], 
                    \phase, 180, 
                    \pan, -1
                ],
                'orange': [
                    \baseFreq, [base+10,((base+10).midicps*1.201).cpsmidi],
                    \phase, -180, 
                    \pan,-1
                ],
                'yellow': [
                    \baseFreq, [base+12,((base+12).midicps*1.2).cpsmidi], 
                    \phase, 180, 
                    \pan, 1
                ],
                'light green': [
                    \baseFreq, [base+14,((base+14).midicps*1.205).cpsmidi], 
                    \phase, 45, 
                    \pan, -1
                ]
            )
        }
    )
)
