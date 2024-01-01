const std = @import("std");

pub fn isIsogram(mystr: []const u8) bool {
    var pga = std.heap.GeneralPurposeAllocator(.{}){};

    var ma = pga.allocator();

    defer _ = pga.deinit();

    var charMap = std.AutoArrayHashMap(u8, bool).init(ma);
    defer charMap.clearAndFree();

    for (mystr) |mval| {
        var val = std.ascii.toLower(mval);
        var value = charMap.get(val);

        if (value) |_| {
            if (val == '-' or val == ' ') {
                continue;
            } else {
                return false;
            }
        } else {
            charMap.put(val, true) catch {};
        }
    }
    return true;
}
