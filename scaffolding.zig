const warn = @import("std").debug.warn;

const std = @import("std");
const output = @import("./include/flb_output.zig");
const plugin = @import("./include/flb_plugin.zig");

export fn FLBPluginRegister(plugin_configuration: *plugin.flb_plugin_proxy_def) i32 {
    warn("Initializing the zig plugin");
    plugin_configuration.proxy = 11;
    plugin_configuration.type = 2;
    plugin_configuration.name = @ptrCast([*c]u8, &"zstdout");
    plugin_configuration.description = @ptrCast([*c]u8, &"zstdout");
    plugin_configuration.flags = 0;
    return 0;
}

export fn FLBPluginInit(plugin_params: i32) i32 {
    warn("Starting the zig output plugin");
    return plugin.FLB_OK;
}

export fn FLBPluginFlush(data: [*c]u8, length: i32, tag: [*c]u8) i32 {
    warn("Got data of length {} with tag {}\n", length, tag);
    return plugin.FLB_OK;
}

export fn FLBPluginExit() i32 {
    warn("Got exit callback");
    return plugin.FLB_OK;
}
