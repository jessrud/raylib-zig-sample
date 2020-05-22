const std = @import("std");
const Builder = std.build.Builder;

// import lib.zig and tell it where raylib-zig is
const raylib = @import("./raylib-zig/lib.zig").Pkg("./raylib-zig");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    // avoid msvc by default on windows :)
    const target = b.standardTargetOptions(
        if (std.builtin.os.tag == .windows)
            .{
                .default_target = .{ .abi = .gnu },
            }
        else
            .{},
    );

    const exe = b.addExecutable("main", "src/main.zig");
    exe.setBuildMode(mode);
    exe.setTarget(target);

    // this does most of the heavy lifting
    raylib.link(exe);
    raylib.addAsPackage("raylib", exe);
    raylib.math.addAsPackage("raylib-math", exe);

    const run_cmd = exe.run();
    const run_step = b.step("run", "Run the game");
    run_step.dependOn(&run_cmd.step);
    exe.install();
}
