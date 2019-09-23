(
    (
        title: \channaGuit,
        mainWait: 3,
        colorWait: 0.01,

        def: SynthDef(\channaGuit, {|baseFreq=620,carModAmt=0.5,pmIndexOne=5, pmIndexTwo=6, length=6, level=0.8|
            var mod, in_two, in_three, in_four, in_five, lowPass, klank, finalEnv;

            mod = PMOsc.ar(baseFreq*carModAmt,(baseFreq*carModAmt)*0.25,2,mul:0.2);

            in_two = PMOsc.ar(baseFreq,baseFreq*mod,pmIndexTwo,mul:0.6);

            // var in_three = RLPF.ar(PMOsc.ar(freq,freq*0.205,SinOscFB.kr(210,0.0009,mul:2,add:2)),850,0.6,0.3);

            in_three = PMOsc.ar(
                baseFreq,
                baseFreq + (baseFreq * 0.5),
                SinOscFB.kr(80,0.001,mul:3,add:4),
                mul:0.2
            );

            in_four = BBandPass.ar(
                    in_two,
                    SinOsc.kr(40,mul:400,add:900),
                    LFSaw.kr(0.1,mul:1,add:2)) * EnvGen.ar(
                        Env([0,0.3,0.7,0.5,0],[0.0009,0.08,0.01,3]),
                        Impulse.kr(SinOsc.kr(0.2,mul:0.1,add:0.2)),
                        0.2
                    );

            in_five = BBandPass.ar(
                Mix([in_two, in_three*1.5]) * EnvGen.ar(
                    Env([0,1,0],[0.009,0.3]), 
                    Impulse.kr(13)
                ), 
                SinOscFB.kr(100,0.09, mul:300,add:1800)
            );

            lowPass = Mix([
                RLPF.ar(
                    [in_two, in_three],
                    baseFreq+320,
                    LFPar.kr(0.2,mul:0.2,add:0.6),0.1
                )
            ]);

            klank = DynKlank.ar(`[
                [33.midicps,37.midicps,40.midicps,43.midicps],
                nil,
                [0.1,0.08,0.08,0.099]
            ], in_two);

            // in_one = BBandPass.ar(in_one

            finalEnv = EnvGen.ar(
                Env([0,level,0],[0.1,length]),
                Line.kr(1,0,length+0.2),
                doneAction:2
            );

            Out.ar(0,
                Splay.ar([
                    lowPass*0.2,
                    Pan2.ar(in_two),
                    Pan2.ar(in_three),
                    klank*0.007,
                    in_five*0.4,
                    Pan2.ar(in_four),
                    lowPass*0.2
                ], level:finalEnv)
            );

            // Out.ar(0,Pan2.ar(in_five));
        }),

        init: {|self, length=0.4|
            self.def.add;
            self.colors = self.makeColors(length)
        },

        notes: [
            [ (53+12).midicps, (59+12).midicps,  (51+12).midicps, (56+12).midicps, (48+12).midicps, (54+12).midicps, (57+12).midicps, (12+63).midicps],
            [53.midicps, 59.midicps,  51.midicps, 56.midicps, 48.midicps, 54.midicps, 57.midicps, 63.midicps],
            [50.midicps, 56.midicps,  48.midicps, 53.midicps, 45.midicps, 51.midicps, 54.midicps, 60.midicps],
            [55.midicps, 61.midicps,  52.midicps, 58.midicps, 50.midicps, 56.midicps, 59.midicps, 65.midicps],
	],

        lengths: [
            [6,8,10,12,14,16,18,20],
            [20,6,8,10,12,14,16,18],
            [18,20,6,8,10,12,14,16],
            [16,18,20,6,8,10,12,14],
            [14,16,18,20,6,8,10,12],
            [12,14,16,18,20,6,8,10],
            [10,12,14,16,18,20,6,8],
            [8,10,12,14,16,18,20,6]
	 ],

         setup: {|self|
             self.title.postln
         },

         startMovement: {|self, index|
             ("Movement" + (index + 1)).postln;
             self.curNotes = (index == 2).if {
                 0.5.coin.if { self.notes.wrapAt(2).scramble } { self.notes.wrapAt(2) }
             } {
                 self.notes.wrapAt(index).scramble
             }
         },

         playSection: {|self, section, curNotes|
             {
                section.do({|color, index|
                    var delta = 0;

                    color[\active].if {
                        var x, y, vars;

                        vars = self.colors[color[\color]].asDict;

                        vars[\baseFreq] = self.curNotes[index];
                        [self.curNotes, self.curNotes[index]].postln;

                        x = color[\x] - 1;
                        y = color[\y] - 1;
                        vars[\length] = self.lengths[y][x];
                        vars = vars.asPairs;

                        Synth(self.def.name, vars);
                        delta = self.colorWait
                    };

                    delta.yield
                });

                self.mainWait.yield
             }.forkIfNeeded
         },

         makeColors: {|self, level|
             (
                 'dark green': [
                     \baseFreq, 48, 
                     \carModAmt, 0.7, 
                     \level, level, 
                 ],
                 'light blue': [
                     \baseFreq, 49, 
                     \carModAmt, 0.125,  
                     \level, (level *(-7/8)), 
                 ],
                 'dark blue':  [
                     \baseFreq, 51,
                     \carModAmt, 0.15, 
                     \level, (level *(6/8)), 
                 ],
                 'purple':[
                     \baseFreq, 53, 
                     \carModAmt, 0.25, 
                     \level, (level *(-5/8)), 
                 ],
                 'rust' :  [
                     \baseFreq, 55,
                     \carModAmt, 0.5, 
                     \level, (level *(4/8)), 
                 ],
                 'orange':[
                     \baseFreq, 56,
                     \carModAmt, 0.15, 
                     \level, (level *(-3/8)), 
                 ],
                 'yellow':[
                     \baseFreq, 58,
                     \carModAmt, 0.25, 
                     \level, (level *(2/8)), 
                 ],
                 'light green':[
                     \baseFreq, 60 ,
                     \carModAmt, 0.35, 
                     \level, (level *(-1/8)), 
                 ]
             )
         }
    )
)
