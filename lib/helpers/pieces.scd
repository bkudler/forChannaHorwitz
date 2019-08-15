(
    (
        create: {|self, path|
            self.directory = ();

            PathName.new(path).files.collect({|f|
                f.fullPath.load
            }).do({|p|
                p.init;
                self.directory.add(p.title -> p)
            })
        },

        postNames: {|self|
            self.directory.keys.postln
        }
    )
)
