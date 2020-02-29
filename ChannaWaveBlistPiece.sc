ChannaWaveBlistPiece : ApplicationPiece { 

    var mainWait = 0.09, colorWait =  0.225, currNotes;
    var bufSqrMod, arrSqr, weirdVals, envSqrMod, sigSqrMod, wtSqrMod, bufSqrModTwo, arrSqrTwo, envSqrModTwo, sigSqrModTwo, wtSqrModTwo, bufSqrModThree, arrSqrThree, envSqrModThree, sigSqrModThree, wtSqrModThree, bufCrazyModFour, segsFour, arrCrazyFourPoints, arrCrazyFourTimes, envCrazyModFour, sigCrazyModFour, wtCrazyModFour, bufCrazyFive, arr, bufCrazyFiveSig, bufCrazyFiveTable, bufCrazySinSix, bufCrazySinSixHarms, bufCrazySinSixFreqs, bufCrazySinSixAmps, bufCrazySeven, bufCrazySevenHarms, bufCrazySevenFreqs, bufCrazySevenTimes, bufCrazySevenEnv, bufCrazySevenShapes, sigCrazySeven, wtCrazySevenSig,bufCrazyEight, bufCrazyEightFreqs, bufCrazyEightTimes, bufCrazyEightEnv, bufCrazyEightShape, sigCrazyEight, wtCrazyEight;


    *new {|finalWait|
        ^super.new.init(finalWait);
    }


    init {|finalWaitArg|		
        title = \channaWaveBlistPiece;
        
        finalWait = finalWaitArg;
        this.prLoadBuffers();


        SynthDef(\channaWaveBlistPiece, {arg baseFreq=440, srcMul=0.1,modMul=0,lfoFreq=0, lfoMul=0, lfoAdd=0, filtFreqFreq=0,rq=1,pan=(-1),finalLevel=2, speed=0.5, filtMul=0, filtFreqMul=0,filtFreqAdd=0, modAmt = 0, modAmtMul=0, modAmtAdd=0;

            var buf = Demand.kr(Impulse.kr(speed),0,Dseq(\bufs.kr(1 ! 8),inf));

            var modBuf = Demand.kr(Impulse.kr(speed*0.8),0,Dseq(\bufs.kr(1 ! 8),inf));

            var modFreq = Gendy3.kr(freq:modAmt,mul:modAmtMul, add:modAmtAdd);

            var mod = Osc.kr(modBuf,modFreq,mul:baseFreq*modMul,add:baseFreq);

            var lfo = LFCub.ar(lfoFreq,mul:lfoMul,add:lfoAdd);

            var src = Mix(Osc.ar(buf,[ (mod-2).midicps,mod.midicps,(mod+3).midicps]+(lfo.midicps),mul:srcMul));

            var filtFreq = Osc.ar(buf,filtFreqFreq,mul:filtFreqMul,add:filtFreqAdd);

            var filt = BBandPass.ar(src,filtFreq,rq,filtMul);

            var final = XFade2.ar(src,filt,pan,finalLevel);

            var env = Env.newClear(20);

            var envctl = \env.kr(env.asArray);

            var finalEnv = EnvGen.kr(envctl, \gate.tr,doneAction:2);


            Out.ar(0,Limiter.ar(Pan2.ar(final*finalEnv), 0.7));

        }).add;


        colors = (


        'dark green': [
                    \gate, 1,
                    \baseFreq, 61,
                    \srcMul, 0.9,
                    \modMul,0,
                    \lfoFreq,12,
                    \lfoMul,20,
                    \lfoAdd, 30,
                    \modAmt, 0,
                    \modAmtMul, 0,
                    \modAmtAdd, 0,
                    \filtFreqFreq, 0,
                    \filtFreqMul, 0,
                    \filtFreqAdd, 0,
                    \rq,0,
                    \pan, -1,
                    \filtMul, 0,
                    \finalLevel, 1.2,
                    \env, Env([0,0.5,0.6,0.9,1.09,0.6,0],[0.009,0.08,0.006,0.008,0.01,0.05],\sine),
                    \bufs, [bufSqrMod.bufnum],
                    \speed, 0
                ],

        'light blue': [
                    \gate, 1,
                    \baseFreq, 52,
                    \srcMul, 0.8,
                    \modMul, -0.2,
                    \lfoFreq,1,
                    \lfoMul,0.8,
                    \lfoAdd,1,
                    \modAmt, 0.05,
                    \modAmtMul, 20,
                    \modAmtAdd, 30,
                    \filtFreqFreq, 3,
                    \filtFreqMul, 1900,
                    \filtFreqAdd, 2000,
                    \rq,1,
                    \filtMul, 0.8,
                    \pan, -0.4,
                    \finalLevel, 1,
                    \env, Env([0,0,1.2,0.2,1,0],[0.0001,0.003,0.0005,0.069,0.05],\sine),
                    \bufs, [bufSqrModTwo.bufnum],
                    \speed, 0
                ],


        'dark blue': [
                    \gate, 1,
                    \baseFreq, 30,
                    \srcMul, 0.8,

                    \modFreq,2,
                    \modMul, 0.15,

                    \lfoFreq,1,
                    \lfoMul,2,
                    \lfoAdd, 3,

                    \filtFreqFreq, 0,
                    \filtFreqMul, 0,
                    \filtFreqAdd, 1800,
                    \rq,1,
                    \filtMul, 0.8,
                    \pan, -0.5,
                    \finalLevel, 1,
                    \env, Env([0,1.2,0.4,1.2,0],[0.0008,0.001,0.01,0.13],\lin),
                    \bufs, [bufSqrModThree.bufnum],

                    \speed, 0],


                'purple':[
                    \gate, 1,
                    \baseFreq, 46,
                    \srcMul, 0.7,

                    \lfoFreq,0.9,
                    \lfoMul,30,
                    \lfoAdd, 40,
                    \filtFreqFreq, 10,
                    \filtFreqMul, 440,
                    \filtFreqAdd, 900,

                    \modMul,0.0,

                    \modAmt, 0,
                    \modAmtMul, 0,
                    \modAmtAdd, 0,

                    \rq,1,
                    \filtMul, 0.7,
                    \pan, -0.8,
                    \finalLevel, 1,
                    \env, Env([0,0.8,0.5,1,0.4,0],[0.001,0.0001,0.009,0.09,0.09],\welch),
                    \bufs, [bufCrazyModFour.bufnum],
                    \speed, 0],


                'rust' : [
                    \gate, 1,
                    \baseFreq, 47,
                    \srcMul, 0.7,

                    \modMul,0.2,

                    \modAmt, 0,
                    \modAmtMul, 0,
                    \modAmtAdd, 0.8,

                    \lfoFreq,0,
                    \lfoMul,0,
                    \lfoAdd, 0,
                    \filtFreqFreq, 0,
                    \filtFreqMul, 0,
                    \filtFreqAdd, 0,
                    \rq, 0,
                    \filtMul,0,
                    \pan, -1,
                    \finalLevel, 1,
                    \env, Env([1,0.8,0.3,0.5,0.2,0],[0.14,0.098,0.08,0.09,0.009, 0.099],\welch),
                    \bufs, [bufCrazyFive.bufnum],

                    \speed, 0],


                'orange':[
                    \gate, 1,
                    \baseFreq, 56,
                    \srcMul, 1.4,

                    \modAmt, 0.5,
                    \modAmtMul, 0.5,
                    \modAmtAdd, 0.1,
                    \modMul,0.35,

                    \lfoFreq,20,
                    \lfoMul,20,
                    \lfoAdd, 0,
                    \filtFreqFreq, 0.1,
                    \filtFreqMul, 800,
                    \filtFreqAdd, 1500,
                    \rq, 0.3,
                    \filtMul, 0,
                    \pan, -0.5,
                    \filtMul,0.8,
                    \finalLevel, 1,
                    \env, Env([1,0.3,0.5,0.1,0.2,0.4,0],[0.01,0.1,0.2,0.05,0.02, 0.01,0.06],\sine),
                    \bufs, [bufCrazySinSix.bufnum],

                    \speed, 0],


                'yellow':[
                    \gate, 1,
                    \baseFreq, 67,
                    \srcMul, 0.5,

                    \modAmt, 0,
                    \modAmtMul, 0,
                    \modAmtAdd, 0.8,
                    \modMul,0.1,

                    \lfoFreq,0,
                    \lfoMul,0,
                    \lfoAdd, 0,
                    \filtFreqFreq, 0.2,
                    \filtFreqMul, 900,
                    \filtFreqAdd, 1900,
                    \rq, 0.6,
                    \filtMul, 0.7,
                    \pan, -0.7,
                    \finalLevel, 0.8,
                    \env, Env([0.5,0.2, 0.1,1,0.6,0],[0.089,0.004,0.007,0.1,0.09],\sqr),
                    \bufs, [bufCrazySeven.bufnum],

                    \speed, 0],


                'light green':[
                    \gate, 1,
                    \baseFreq, 42,
                    \srcMul, 0.9,

                    \modAmt, 0.8,
                    \modAmtMul, 4,
                    \modAmtAdd, 12,
                    \modMul,0.01,

                    \lfoFreq,40,
                    \lfoMul,20,
                    \lfoAdd, 25,
                    \filtFreqFreq, 2,
                    \filtFreqMul, 600,
                    \filtFreqAdd, 9600,
                    \rq, 0.5,
                    \filtMul, 0.8,
                    \pan, 1,
                    \finalLevel, 1.1,
                    \env, Env([0.3,0.8,0.7,1,0.5,0.4,0],[0.05,0.0071,0.09,0.098,0.08,0.1],\lin),
                    \bufs, [bufCrazyEight.bufnum],

                    \speed, 0]


            );

        currNotes = [
            Dictionary[
                'dark green'->[58,76,63,60,69.5,64,62,59],
                'light blue'-> [45, 65.8,61,49,76,30,70.2,55.5],
                'dark blue'->[30,40.5,49.2,51,41.5,42,49.5,33],
                'purple'->[60,55.5,47,60.25,59.35,69,78,70],
                'rust' -> [57,57.5,58,50,51,51.5,58.5,55],
                'orange'->[56,56.5,50,51,40,54,55,56.5],
                'yellow'-> [52,53,54,56,68,56,58.5,59.5],
                'light green'->[72,70,74,74.5,75.5,76.5,77,68]
            ],
            Dictionary[
                'dark green'->[68,59,68.5,69.5,70,72,64,68.25],
                'light blue'-> [55, 69.25,50.5,61,58.9,64,42,60.9],
                'dark blue'->[40,50.25,21,41.5,59.9,79.8,47.8,71.25],
                'purple'->[40,40.25,45,45.55,53.95,51.25,41.5,52.9],
                'rust' -> [47,47.5,47.25,40,47.99,46.99,46.8,64.9],
                'orange'->[56,46.1,60.2,59.3,56.4,50.5,64.6,46.7],
                'yellow'-> [52,50,58,56,55,53,54,52.9],
                'light green'->[76,70,79,78.5,79.9,74,77,77.5]
            ],
            Dictionary[
                'dark green'->[68,64,67,62,69,60.8,63,65.9],
                'light blue'-> [45, 49.1,40.2,44.3,45.4,45.5,40.6],
                'dark blue'->[40,49,48,47,44.8,20.8,49.8,48.8],
                'purple'->[60,50.1,55.5,55.79,51,69.15,57.8,60.3],
                'rust' -> [67,70,71.25, 76, 78.99,70.59,69.4,67.3],
                'orange'->[56,52.3,50.4,51.5,53.6,50,52,60],
                'yellow'-> [52,54,56,78,55.5,57,54.8,62.2],
                'light green'->[66,69.99,69,65.2,70.7,69.1,70.2,65.3]
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
                // ["section", section].postln;

                section.do({|color, index|
                    var delta = 0;
                    color[\active].if {
                        var x, y, useNotes;
                        var vars = colors[color[\color]];
                        var tempVars = vars.asDict;
                        x = color[\x]-1;
                        y = if( color[\y]-1 <= 0, {0}, {color[\y]-1});
                        useNotes = if(color[\y] < 4, {currNotes[0]}, {currNotes[1]});
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