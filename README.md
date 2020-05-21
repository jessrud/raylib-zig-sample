an example of using my fork of raylib-zig as a dependency.

It has raylib's repo as a submodule, and builds and links it into your program without
depending on raylib being installed or built already. It includes a build helper called 'raydep.zig'. See build.zig for details.

to test it out, `git clone https://github.com/jessrud/raylib-zig-sample --recurse-submodules`
