# Writing a fluent-bit output plugin in Zig

### First translate the C headers
These are the same headers used by the go output plugin scaffolding project: https://github.com/fluent/fluent-bit-go

``` bash
zig translate-c include/flb_output.h > include/flb_output.zig
zig translate-c include/flb_plugin.h > include/flb_plugin.zig
```

### Build a shared object

``` bash
zig build-lib -dynamic scaffolding.zig
```

This will generate a `libscaffolding.so.0.0.0` in the current directory.

### Use!

``` bash
bin/fluent-bit -e libscaffolding.so.0.0.0 -i random -o zstdout -v
```
