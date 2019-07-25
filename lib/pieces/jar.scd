(
    (
        title: \channaJar,

        def: SynthDef.new(\jar, {|freq=440, gate=0|
            var nOscs = 4;
            var fm, pwm, pw, ampEnv, sig, lag;

            lag = \lag.kr(5);

            fm = { 1.0.rand }!nOscs;
            fm = fm * (fm.sum / nOscs).reciprocal * LFBrownNoise1.kr(0.1, 0.5);

            pwm = { 1.0.rand }!nOscs;
            pwm = pwm * (pwm.sum / nOscs).reciprocal * LFBrownNoise1.kr(0.11, 0.5);

            ampEnv = EnvGen.kr(Env.asr(\ampenv_att.kr(5.0), 1.0, \ampenv_rel.kr(5.0)), gate);

            freq = (
                freq.cpsmidi +
                (Array.interpolation(nOscs, -1.0, 1.0) * \freqspread.kr(0, lag)) +
                (fm * \fmamt.kr(0, lag))
            ).midicps;

            pw = (
                0.5 +
                (Array.interpolation(nOscs, -0.5, 0.5) * \pwspread.kr(0, lag)) +
                (pwm * \pwmamt.kr(0, lag))
            ).clip(0.01, 0.99);

            sig = Pulse.ar(freq, pw);

            sig = (sig * ampEnv).tanh * \amp.kr(0.1);

            sig = Splay.ar(sig, \spread.kr(1), 1, \center.kr(0));
            OffsetOut.ar(\out.kr(0), sig)
        }),

        init: {|self|
            {
                s.bootSync;

                self.def.add;
                s.sync
            }.forkIfNeeded
        },

        setup: {|self|
            self.title.postln;
            self.nodes = 8.collect({|i|
                Synth.new(self.def.name, [
                    \freq, 55 * i,
                    \spread, 0.25,
                    \center, i.linlin(0, 7, -1, 1),
                    \ampenv_att, 15,
                    \gate, 1
                ])
            })
        },

        teardown: {|self|
            {
                self.nodes.do({|n| n.set(\ampenv_rel, 15, \gate, 0) });
                (15.01).yield;
                self.nodes.do({|n| n.free });
                "FIN".postln
            }.forkIfNeeded
        },

        startMovement: {|self, index|
            ("Movement" + (index + 1)).postln;
            self.nodes.do({|n|
                n.set(
                    \freqspread, index * 0.125,
                    \pwspread, index * 0.25
                )
            })
        },

        playSection: {|self, section, index|
            {
                var activeCells, delta;

                activeCells = section.select({|cell| cell.active });

                delta = (activeCells.size > 0).if {
                    activeCells.collect({|cell|
                        self.colors[cell.color].delta
                    }).mean
                } { 2 };

                self.nodes.do({|n, i|
                    var cell;

                    cell = section[i];

                    cell.active.if {
                        n.set(
                            \lag, delta * 2,
                            \fmamt, cell.y * 0.0625,
                            \pwmamt, self.colors[cell.color].pwmamt
                        )
                    }
                });

                section.postln;
                [index, delta].postln;
                delta.yield
            }.forkIfNeeded
        },

        colors: (
            'dark green': (
                delta: 1,
                pwmamt: 0.5
            ),
            'light blue': (
                delta: 2,
                pwmamt: 0.625
            ),
            'dark blue': (
                delta: 3,
                pwmamt: 0.75
            ),
            'purple': (
                delta: 4,
                pwmamt: 0.875
            ),
            'rust': (
                delta: 5,
                pwmamt: 0
            ),
            'orange': (
                delta: 6,
                pwmamt: 0.125
            ),
            'yellow': (
                delta: 7,
                pwmamt: 0.25
            ),
            'light green': (
                delta: 8,
                pwmamt: 0.375
            )
        )
    )
)
