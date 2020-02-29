ChannaGuitPiece : ApplicationPiece {

	var mainWait = 3, colorWait = 0.01, length = 0.4, notes, lengths, curNotes;

	*new {|finalWait|
		^super.new.init(finalWait);
	}

	init {|finalWaitArg|
        var currServer =  Server.default;
        var bandFiltBuf = Buffer.alloc(currServer, 512, 1).sine3([-40,10, 2], [0.099,4,20, 10],[90,0,180,-90]);
        var bandFiltBufBW = Buffer.alloc(currServer, 512, 1).sine3([-2,0.0,1,4,0.5,3,-2], [1,0.2,0.5,0.5,0.01,0.01],[0,90,0,0,-90]);
        var lowFiltBuf = Buffer.alloc(currServer, 512, 1).sine3([-20,-3,0.001, 1,100], [1,2,0.001, 1,100], []);
        var sqrEnv = Env([0,0.01,0.9,0.7,0.9,0.88],[0.2]!6,\hold);
        var sqrSig = sqrEnv.asSignal(1024);
        var wtGuitSqr = sqrSig.asWavetable;
        var sqrBufChix = Buffer.alloc(currServer, 2048).loadCollection(wtGuitSqr);
		title = \channaGuit;
        finalWait = finalWaitArg;
		def =  SynthDef(\channaGuit, {arg baseFreq=620,carModAmt=0.5,pmIndexOne=5, pmIndexTwo=6, length=6, level=0.8, levelOne=0.48, levelTwo=0.2;



            var sqrEnv = EnvGen.ar(Env([0,0.5,0.2,1,0],[0.2,0.2,0.01,0.3]),Impulse.kr(LFSaw.kr(2,mul:0.9,add:1)),levelScale:1);

            var mod = PMOsc.ar(baseFreq*carModAmt,(baseFreq*carModAmt)*0.25,2,mul:0.2);

            var in_two = PMOsc.ar(baseFreq,baseFreq*mod,pmIndexTwo,mul:levelOne-0.08);//0.48

            var in_three = PMOsc.ar(baseFreq,baseFreq+(baseFreq*0.5),SinOscFB.kr(80,0.001,mul:3,add:4),mul:levelTwo-0.08);//0.2


            var in_four = BBandPass.ar(
                in_two,
                Osc.kr(bandFiltBuf, 40,mul:400,add:900),LFSaw.kr(0.1,mul:1,add:2))*EnvGen.ar(Env([0,0.3,0.7,0.5,0],[0.0009,0.08,0.01,3]),Impulse.kr(Osc.kr(bandFiltBuf,0.2,mul:0.1,add:0.2)),0.2);


            var in_five = BBandPass.ar(Mix([in_two, in_three*1.5])*EnvGen.ar(Env([0,0.7,0],[0.009,0.3]),Impulse.kr(13)),SinOscFB.kr(100,Osc.kr(bandFiltBufBW,5,mul:0.001,add:0.09), mul:300,add:1800));

            var lowPass = Mix([
                RLPF.ar(
                [in_two, in_three]*1.08,
                baseFreq+380,
                Osc.kr(lowFiltBuf,0.2,mul:0.2,add:0.4),0.9)
            ]);

            var klank = DynKlank.ar(`[
                [33.midicps,37.midicps,40.midicps,43.midicps],
                nil,
                [0.1,0.08,0.08,0.099]
            ],in_two*0.6);

            var finalEnv = EnvGen.ar(Env([0,0.3,0.78,0.2,0.5,0],[0.008,0.05,0.02,0.006,length]),Line.kr(1,0,length+0.2),doneAction:2);

            var sqr = Mix(Osc.ar(sqrBufChix,LFCub.kr(finalEnv,mul:[(baseFreq-55)/2,(baseFreq-53)/2],add:baseFreq/2),mul:[0.36,0.4]*finalEnv));

            var splayOut = Splay.ar([
                lowPass*0.5,Pan2.ar(in_two),Pan2.ar(in_three),klank*0.007,in_five*0.5,sqr*0.5,Pan2.ar(in_four)*0.7,lowPass*0.5;
            ],level:finalEnv);

            var verb = FreeVerb2.ar(splayOut,splayOut,0.35,0.4,0.1);

            var comp = Compander.ar(verb,verb,thresh: 0.1, slopeBelow:0.5, slopeAbove: 0.65);

            Out.ar(0, Pan2.ar(comp));

    }).add;
    def.add;
        colors =  (
                 'dark green': [
                     \baseFreq, 48,
                     \carModAmt, 0.7,
                     \level, length,
                 ],
                 'light blue': [
                     \baseFreq, 49,
                     \carModAmt, 0.125,
                     \level, (length *(-7/8)),
                 ],
                 'dark blue':  [
                     \baseFreq, 51,
                     \carModAmt, 0.15,
                     \level, (length *(6/8)),
                 ],
                 'purple':[
                     \baseFreq, 53,
                     \carModAmt, 0.25,
                     \level, (length *(-5/8)),
                 ],
                 'rust' :  [
                     \baseFreq, 55,
                     \carModAmt, 0.5,
                     \level, (length *(4/8)),
                 ],
                 'orange':[
                     \baseFreq, 56,
                     \carModAmt, 0.15,
                     \level, (length *(-3/8)),
                 ],
                 'yellow':[
                     \baseFreq, 58,
                     \carModAmt, 0.25,
                     \level, (length *(2/8)),
                 ],
                 'light green':[
                     \baseFreq, 60 ,
                     \carModAmt, 0.35,
                     \level, (length *(-1/8)),
                 ]
             );
        notes =  [
            [ (53+12).midicps, (59+12).midicps,  (51+12).midicps, (56+12).midicps, (48+12).midicps, (54+12).midicps, (57+12).midicps, (12+63).midicps],
            [53.midicps, 59.midicps,  51.midicps, 56.midicps, 48.midicps, 54.midicps, 57.midicps, 63.midicps],
            [50.midicps, 56.midicps,  48.midicps, 53.midicps, 45.midicps, 51.midicps, 54.midicps, 60.midicps],
            [55.midicps, 61.midicps,  52.midicps, 58.midicps, 50.midicps, 56.midicps, 59.midicps, 65.midicps],
        ];
        lengths = [
            [6,8,10,12,14,16,18,20],
            [20,6,8,10,12,14,16,18],
            [18,20,6,8,10,12,14,16],
            [16,18,20,6,8,10,12,14],
            [14,16,18,20,6,8,10,12],
            [12,14,16,18,20,6,8,10],
            [10,12,14,16,18,20,6,8],
            [8,10,12,14,16,18,20,6]
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



	startMovement {|index|
         ("Movement" + (index + 1)).postln;
            curNotes = (index == 2).if {
             0.5.coin.if { notes.wrapAt(2).scramble } { notes.wrapAt(2) }
         } {
             notes.wrapAt(index).scramble
         }
	}

	playSection {|section|
     {
        section.do({|color, index|
            var delta = 0;

            color[\active].if {
                var x, y, vars;

                vars = colors[color[\color]].asDict;

                vars[\baseFreq] = curNotes[index];

                x = color[\x] - 1;
                y = color[\y] - 1;
                vars[\length] = lengths[y][x];
                vars = vars.asPairs;

                Synth(title, vars);
                delta = colorWait;
            };

            delta.yield
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