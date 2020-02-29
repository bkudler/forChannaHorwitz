ChannaWaveChonkPiece : ApplicationPiece { 

    var mainWait = 0.7, colorWait = 0.225, currNotes;
    var bufSqrMod, arrSqr, weirdVals, envSqrMod, sigSqrMod, wtSqrMod, bufSqrModTwo, arrSqrTwo, envSqrModTwo, sigSqrModTwo, wtSqrModTwo, bufSqrModThree, arrSqrThree, envSqrModThree, sigSqrModThree, wtSqrModThree, bufCrazyModFour, segsFour, arrCrazyFourPoints, arrCrazyFourTimes, envCrazyModFour, sigCrazyModFour, wtCrazyModFour, bufCrazyFive, arr, bufCrazyFiveSig, bufCrazyFiveTable, bufCrazySinSix, bufCrazySinSixHarms, bufCrazySinSixFreqs, bufCrazySinSixAmps, bufCrazySeven, bufCrazySevenHarms, bufCrazySevenFreqs, bufCrazySevenTimes, bufCrazySevenEnv, bufCrazySevenShapes, sigCrazySeven, wtCrazySevenSig,bufCrazyEight, bufCrazyEightFreqs, bufCrazyEightTimes, bufCrazyEightEnv, bufCrazyEightShape, sigCrazyEight, wtCrazyEight;


	*new {|finalWait|
        ^super.new.init(finalWait);
	}

	init {|finalWaitArg|
		title = \channaWaveChonkPiece;

        finalWait = finalWaitArg;
        this.prLoadBuffers();

        SynthDef(\channaWaveChonkPiece, {arg baseFreq=440, srcMul=0.1, modFreq = 0,modMul=0,lfoFreq=0, lfoMul=0, lfoAdd=0, filtFreqFreq=0,rq=1,filtMul=0.2,pan=(-1),finalLevel=2, speed=0.5, filtFreqMul=0,filtFreqAdd=0,dePan=(-1), pos=0;

            var buf = Demand.kr(Impulse.kr(speed),0,Dseq(\bufs.kr(1 ! 8),inf));

            var modBuf = Demand.kr(Impulse.kr(speed*0.8),0,Dseq(\bufs.kr(1 ! 8),inf));

            var mod = Osc.kr(modBuf,modFreq,mul:baseFreq*modMul,add:baseFreq);

            var lfo = LFCub.ar(lfoFreq,mul:lfoMul,add:lfoAdd);

            var src = Mix(Osc.ar(buf,[ (mod-2).midicps,mod.midicps,(mod+3).midicps]+(lfo.midicps),mul:srcMul));

            var filtFreq = Osc.ar(buf,filtFreqFreq,mul:filtFreqMul,add:filtFreqAdd);

            var filt = RHPF.ar(src,filtFreq,rq,filtMul);

            var final = XFade2.ar(src,filt,pan,finalLevel);

            var finalDelay = XFade2.ar(final, CombC.ar(final,0.8,Osc.ar(1,Osc.ar(3,25,mul:29,add:30),mul:0.04,add:0.05),1),dePan);

            var env = Env.newClear(20);

            var envctl = \env.kr(env.asArray);

            var finalEnv = EnvGen.kr(envctl, \gate.tr,doneAction:2);

            Out.ar(0,Limiter.ar(Pan2.ar(finalDelay,pos),0.7));

        }).add;

        colors =  (


            'dark green': [
                        \gate, 1,
                        \baseFreq, 61,
                        \srcMul, 1,
                        \modFreq,0,
                        \modMul,0,
                        \lfoFreq,0.77835,
                        \lfoMul,50,
                        \lfoAdd, 0,
                        \filtFreqFreq, 0,
                        \filtFreqMul, 0,
                        \filtFreqAdd, 0,
                        \rq,0,
                        \pan, -1,
                        \dePan, -1,
                        \finalLevel, 0.8,
                        \env, Env([0,0.5,0.6,1.1,1,0.6,0],[0.001,0.0001,0.009,0.08,0.01,0.22],\sine),
                        \bufs, bufSqrMod.bufnum,

                        \speed, 0

                    ],

            'light blue': [
                        \gate, 1,
                        \baseFreq, 55,
                        \srcMul, 1,
                        \modFreq,0,
                        \modMul,0,
                        \lfoFreq,0,
                        \lfoMul,0,
                        \lfoAdd, 0,
                        \filtFreqFreq, 0,
                        \filtFreqMul, 0,
                        \filtFreqAdd, 0,
                        \rq,1,
                        \filtMul, 0,
                        \pan, -1,
                        \finalLevel, 1,
                        \env, Env([0,0,1.2,0.2,1.1,0],[0.001,0.0001,0.01,0.4,0.1,0.02],\sine),
                        \bufs, ([bufSqrMod.bufnum,bufSqrModTwo.bufnum]!6).flat.reverse,
                        \speed, 12
                    ],


            'dark blue': [
                        \gate, 1,
                        \baseFreq, 30,
                        \srcMul, 1,

                        \modFreq,0.5,
                        \modMul,-0.15,

                        \lfoFreq,1,
                        \lfoMul,28,
                        \lfoAdd, 30,

                        \filtFreqFreq, 0,
                        \filtFreqMul, 0,
                        \filtFreqAdd, 0,
                        \rq,1,
                        \filtMul, 0,
                        \pan, -1,
                        \dePan, -0.5,
                        \finalLevel, 1,
                        \env, Env([0,1.2,0.4,1.2,0],[0.001,0.01,0.004,0.1,0.5],\lin),
                        \bufs, ([bufSqrMod.bufnum, bufSqrModTwo.bufnum, bufSqrModThree.bufnum ]!5).flat.reverse,

                        \speed, 9

                    ],


                    'purple':[
                        \gate, 1,
                        \baseFreq, 50,
                        \srcMul, 1,

                        \modFreq,3,
                        \modMul,0.4,

                        \lfoFreq,0.5,
                        \lfoMul,8,
                        \lfoAdd, 8,

                        \filtFreqFreq, 0,
                        \filtFreqMul, 0,
                        \filtFreqAdd, 0,

                        \rq,1,
                        \filtMul, 0,
                        \pan, -1,
                        \finalLevel, 1,
                        \env, Env([0,1.1,0.2,1,0.4,0],[0.0008,0.001,0.002,0.5,0.65], \welch),
                        \bufs, ([bufSqrMod.bufnum, bufSqrModTwo.bufnum, bufSqrModThree.bufnum,bufCrazyModFour.bufnum]!4).flat.reverse,

                        \speed, 5],


                    'rust' : [
                        \gate, 1,
                        \baseFreq, 57,
                        \srcMul, 1,

                        \modFreq,20,
                        \modMul,0.4,

                        \lfoFreq,0,
                        \lfoMul,0,
                        \lfoAdd, 0,
                        \filtFreqFreq, 15,
                        \filtFreqMul, 800,
                        \filtFreqAdd, 1500,
                        \rq, 0.2,
                        \filtMul, 1,
                        \pan, -0.3,
                        \dePan, -0.3,
                        \finalLevel, 1,
                        \env, Env([1,0.8,0.3,0.5,0.2,0],[0.3,0.1,0.5,0.05,0.009, 0.1],\welch),
                        \bufs, ([bufSqrMod.bufnum, bufSqrModTwo.bufnum, bufSqrModThree.bufnum,bufCrazyModFour.bufnum,bufCrazyFive.bufnum]!3).flat.reverse,

                        \speed, 8

                    ],


                    'orange':[
                        \gate, 1,
                        \baseFreq, 56,
                        \srcMul, 1.4,

                        \modFreq, 0.15,
                        \modMul, 0.3,

                        \lfoFreq,20,
                        \lfoMul,5,
                        \lfoAdd, 0,
                        \filtFreqFreq, 0,
                        \filtFreqMul, 0,
                        \filtFreqAdd, 0,
                        \rq, 0,
                        \filtMul, 0,
                        \pan, -0.8,
                        \finalLevel, 1,
                        \env, Env([1,0.3,0.5,0.1,0.2,0],[0.01,0.7,0.2,0.13,0.02, 0.01],\sine),
                        \bufs, ([bufCrazySinSix.bufnum]!8).flat.reverse,

                        \speed, 0

                    ],


                    'yellow':[
                        \gate, 1,
                        \baseFreq, 72,
                        \srcMul, 0.8,

                        \modFreq,37,
                        \modMul,0.15,

                        \lfoFreq,0,
                        \lfoMul,0,
                        \lfoAdd, 0,
                        \filtFreqFreq, 0,
                        \filtFreqMul, 0,
                        \filtFreqAdd, 0,
                        \rq, 1,
                        \filtMul, 0.5,
                        \pan, -1,
                        \dePan, -0.2,
                        \finalLevel, 0.8,
                        \env, Env([0.5,0.2, 0.1,1,0.6,0],[0.18,0.004,0.005,0.5,1],\sine),
                        \bufs, ([bufCrazySeven.bufnum]!8).flat.reverse,

                        \speed, 0],


                    'light green':[
                        \gate, 1,
                        \baseFreq, 56,
                        \srcMul, 0.3,

                        \modFreq,0.5,
                        \modMul,1,
                        \dePan, 0,
                        \lfoFreq,2,
                        \lfoMul,20,
                        \lfoAdd, 30,
                        \filtFreqFreq, 0.08,
                        \filtFreqMul, 200,
                        \filtFreqAdd, 600,
                        \rq, 0.45,
                        \filtMul, 0.9,
                        \pan, 0.3,
                        \finalLevel, 1.2,
                        \env, Env([0.3,1,0.7,1,0],[0.2,0.02,0.4,0.7],\sine),
                        \bufs, [bufSqrMod.bufnum, bufSqrModTwo.bufnum, bufSqrModThree.bufnum,bufCrazyModFour.bufnum,bufCrazyFive.bufnum, bufCrazySinSix.bufnum,bufCrazySeven.bufnum, bufCrazyEight.bufnum].reverse,

                        \speed, 5

                    ]


        );

        currNotes = [
            Dictionary[
                'dark green'->[58,56,59,60,59.5,54,52,62],
                'light blue'-> [55, 55.8,51,49,56,50,60.2,55.5],
                'dark blue'->[30,30.5,39.2,21,21.5,52,39.5,33],
                'purple'->[50,55.5,57,50.25,56.35,49,48,40],
                'rust' -> [57,57.5,58,60,61,61.5,58.5,55],
                'orange'->[56,56.5,60,61,50,54,55,56.5],
                'yellow'-> [72,73,74,76,68,66,68.5,69.5],
                'light green'->[56,55,54,54.5,55.5,56.5,57,58]
            ],
            Dictionary[
                'dark green'->[58,49,48.5,61.5,50,52,54,68.25],
                'light blue'-> [55, 59.25,50.5,41,48.9,54,52,50.9],
                'dark blue'->[30,40.25,21,31.5,29.9,39.8,37.8,41.25],
                'purple'->[50,50.25,55,45.55,43.95,41.25,51.5,42.9],
                'rust' -> [57,57.5,57.25,60,57.99,66.99,56.8,64.9],
                'orange'->[56,66.1,50.2,59.3,66.4,50.5,54.6,56.7],
                'yellow'-> [72,70,68,66,65,73,74,72.9],
                'light green'->[56,50,49,48.5,49.9,54,57,57.5]
            ],
            Dictionary[
                'dark green'->[58,54,57,52,49,60.8,61,60.9],
                'light blue'-> [55, 59.1,60.2,64.3,65.4,55.5,50.6],
                'dark blue'->[30,29,28,27,24.8,20.8,39.8,32.8],
                'purple'->[50,60.1,55.5,55.59,51,49.15,47.8,45.3],
                'rust' -> [57,60,61.25, 56, 58.99,50.59,49.4,57.3],
                'orange'->[56,52.3,50.4,51.5,53.6,60,62,57],
                'yellow'-> [72,74,76,78,75.5,77,74.8,72.2],
                'light green'->[56,54.99,55,55.2,50.7,59.1,47.2,45.3]
            ],
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
                // ["section", section].postln;

                section.do({|color, index|
                    var delta = 0;
                    color[\active].if {
                        var x, y,useNotes;
                        var vars = colors[color[\color]];
                        var tempVars = vars.asDict;

                        x = color[\x]-1;
                        y = if( color[\y]-1 <= 0, {0}, {color[\y]-1});
                        useNotes = if(color[\y] < 4, {currNotes[0]}, {currNotes[1]});
                        tempVars['pos'] = if( y <= 4, {y*(-0.1) - rrand(0,0.6)},{y*0.1 + rrand(0,0.2)});
                        tempVars['baseFreq'] = useNotes[color[\color]][index];
                        tempVars = tempVars.asPairs;

                        Synth(title, tempVars);
                        delta = colorWait;
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

    prLoadBuffers{
        var currServer =  Server.default;

        bufSqrMod = Buffer.alloc(currServer, 2048);
        arrSqr = [0.2,exprand(0.1,0.2)]!5;
        arrSqr = arrSqr.flat;
        weirdVals = Array.fill(3,{arg i; i = i+1; exprand(0.355,0.588)+(i*0.1)});
        envSqrMod = Env([0,0.01,0.95, weirdVals, 0.9,0.8].flat, arrSqr, \sqr);
        sigSqrMod = envSqrMod.asSignal(1024);
        wtSqrMod = sigSqrMod.asWavetable;
        bufSqrMod.loadCollection(wtSqrMod);

        bufSqrModTwo = Buffer.alloc(currServer, 2048);
        arrSqrTwo = [0.2,exprand(0.1,0.15)]!4;
        arrSqrTwo = arrSqrTwo.flat;
        envSqrModTwo = Env([0,0.9,0.7,0.8,0.9,0.7,0.9,0.88], arrSqrTwo, \hold);
        sigSqrModTwo = envSqrModTwo.asSignal(1024);
        wtSqrModTwo = sigSqrModTwo.asWavetable;
        bufSqrModTwo.loadCollection(wtSqrModTwo);

        bufSqrModThree = Buffer.alloc(currServer, 2048);
        arrSqrThree = [2]!10;
        envSqrModThree = Env([0,0,0.1,0.2,0.17,0,0.9,0.7,0.6,0.9], arrSqrThree, [10,80]);
        sigSqrModThree = envSqrModThree.asSignal(1024);
        wtSqrModThree  = sigSqrModThree.asWavetable;
        bufSqrModThree.loadCollection(wtSqrModThree);

        bufCrazyModFour = Buffer.alloc(currServer, 2048);
        segsFour = 10;
        arrCrazyFourPoints = [ -0.32252383232117, -0.27349895238876, 0.47741967439651, 0.3508877158165, 0.059560239315033, 0.30184686183929, 0.26270288228989, -0.016142129898071, -0.12981700897217, -0.44080901145935 ]+[2,-2,-0.1,0,1];
        arrCrazyFourTimes = [ 1.2391604547032, 2.4661958339884, 2.8305885896017, 2.3779888701934, 2.5674915337821, 1.7079794657368, 2.9890073628543, 2.1822593534987, 2.064853255394, 1.5177564465375 ];
        envCrazyModFour = Env(arrCrazyFourPoints, arrCrazyFourTimes, {exprand(0.5,2)}!segsFour);
        sigCrazyModFour = envCrazyModFour.asSignal(1024);
        wtCrazyModFour =  sigCrazyModFour.asWavetable;
        bufCrazyModFour.loadCollection(wtCrazyModFour);

        bufCrazyFive = Buffer.alloc(currServer, 2048);
        arr = [ 0.29968409652284, 0.24447570709349, 0, 0, 0, 0, 0.6880477101437, 0, 0.25249120313484, 0, 0, 0, 0, 0.13472068632074, 0.14768388833031, 0, 0, 0, 0.40700751630991, 0, 0, 0.18004566420413, 0, 0, 0.39132233948908, 0.51593085875879, 0.2441800471695, 0.65206034945808, 0.17367106403369, 0, 0, 0, 0, 0.50262831039016, 0.2987165308635, 0.10647517177261, 0, 0, 0, 0.73723892290702 ];
        bufCrazyFiveSig = Signal.chebyFill(1024, arr);
        bufCrazyFiveTable = bufCrazyFiveSig.asWavetable;
        bufCrazyFive = bufCrazyFive.loadCollection(bufCrazyFiveTable);


        bufCrazySinSix = Buffer.alloc(currServer, 2048);
        bufCrazySinSixHarms = 20;
        bufCrazySinSixFreqs = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,4.2463976163804,12.810685808138,10.174610711358,6.114419469242,16.907831291929,16.774145871895,17.618586705312,8.3679450131344,13.936383601752,14.238185130255,16.204957401979,10.972009369157,7.2264515003567,6.3163633797749,6.4955212566769,4.8194932773534,13.443800812829,7.643299717701,15.159442421997,25.861841443083,13.36146785551,15.999952004453,20.916731805076,8.8228551262434,11.384672731377,7.171717764778];
        bufCrazySinSixAmps = [0.11557278633118,-0.13248424530029,-0.16018524169922,0.36031494140625,0.25000596046448,-0.38651103973389,-1.0212606906891,0.15030136108398,-1.5963027477264,-0.76839542388916,-1.7095756053925,2.0033449172974,-2.2191437244415,-1.7074542999268,-0.44348788261414,-1.3811065673828,-2.175174331665,0.39049100875854,-1.6969928741455,-0.77261257171631,-2.0194187164307,-2.7465392112732,2.455148267746
        ,-1.4131004333496,1.0780756144861,0.59909072468174,1.0126590287004,0.85893669684889,0.63754753523207,0.41389529008486,0.66529963011477,1.0345310934843,0.95937579092367,0.95098639935346,0.83957312946229,0.58838039814067,0.59485827325392,0.27761986458192,0.78628533470293,0.25940574017301,1.0084504115689,0.94622417361894,0.79403100148966,0.45730953149267,0.23957480036632,0.6979187204197,0.88933777963411,0.271889532494,0.77921771904589,0.28895733927468];
        bufCrazySinSix.sine3(bufCrazySinSixFreqs,bufCrazySinSixAmps,0!bufCrazySinSixHarms);




        bufCrazySeven = Buffer.alloc(currServer, 2048);
        bufCrazySevenHarms = 15;
        bufCrazySevenFreqs = [-2.2206641435623,-0.75583291053772,1.1156054735184,-0.82272863388062,-2.287827372551,-0.76077747344971,0.76077747344971,-0.72262501716614,-1.1156054735184,2.5569723844528,-0.09754478931427,1.4762721061707,-1.5865606069565,1.5582693815231,-1.1534235477448,1.5455374717712,0.72262501716614,0.09754478931427,-1.4762721061707,-2.8829255104065,-2.5569723844528,2.2206641435623,-1.5582693815231,-1.5455374717712,0.75583291053772,1.1534235477448,2.287827372551,0.82272863388062,1.5865606069565,2.8829255104065];
        bufCrazySevenTimes = [0.0,0.1,2,3,4,0.5,0.6,2.1,0.072,9,0.1,1.1,12,13,14];
        bufCrazySevenShapes = [inf,0.28714442693877,0.055831234573312,0.02448030056695,0.28627893598091,0.330117353335,0.046017395777761,0.05736535706965,0.033828132068417,0.011058534790821,0.067513726278771,0.021812450524727,0.00974293527088,0.009931154981456,0.014334466623818];
        bufCrazySevenEnv = Env(bufCrazySevenFreqs, bufCrazySevenTimes,bufCrazySevenShapes);
        sigCrazySeven = bufCrazySevenEnv.asSignal(1024);
        wtCrazySevenSig = sigCrazySeven.asWavetable;
        bufCrazySeven.loadCollection(wtCrazySevenSig);


        bufCrazyEight = Buffer.alloc(currServer, 2048);
        bufCrazyEightFreqs = [0.89183592796326,0.58271598815918,0.96974897384644,0.25,0.2,0.16666666666667,7,8,9,-0.39414036273956,0.28074789047241,0.051408529281616,0.10936760902405];
        bufCrazyEightTimes =
        [0.00073651133775711,0.0046394246101379,0.0072816295742989,0.4,0.5,0.6,0.7,0.8,0.9,0.099378854036331,0.091215711832047,0.05924654841423,0.032534149885178];
        bufCrazyEightShape = [ 5, 6, 2, 8, 12, 17, -17, 5, 17, -1, 4, -10, -16 ];
        bufCrazyEightEnv = Env(bufCrazyEightFreqs,bufCrazyEightTimes,bufCrazyEightShape);
        sigCrazyEight = bufCrazyEightEnv.asSignal(1024);
        wtCrazyEight = sigCrazyEight.asWavetable;
        bufCrazyEight.loadCollection(wtCrazyEight);
    }


}