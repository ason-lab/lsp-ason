const std = @import("std");
const lex = @import("src/lexer.zig");

pub fn main() !void {
    const src =
        \\{
        \\    id,
        \\    name,
        \\    active
        \\}:
        \\(
        \\    1,
        \\    Alice,
        \\    true
        \\)
    ;
    var lexer = lex.Lexer.init(src);
    while (true) {
        const t = lexer.next();
        std.debug.print("{s} '{s}' line={d} col={d}\n", .{@tagName(t.kind), t.value, t.line, t.col});
        if (t.kind == .eof or t.kind == .err) break;
    }
}
