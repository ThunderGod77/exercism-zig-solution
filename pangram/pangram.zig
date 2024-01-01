const std = @import("std");

fn toUpperCase(char: u8) u8 {
    if (char >= 'a' and char <= 'z') {
        return char - ('a' - 'A');
    }
    return char;
}

pub fn isPangram(str: []const u8) bool {
    var hashMap = std.AutoHashMap(u8, bool).init(std.heap.page_allocator);

    var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    for (characters) |val| {
        var v = toUpperCase(val);
        hashMap.put(v, false) catch {};
    }

    for (str) |val| {
        var v = toUpperCase(val);
        hashMap.put(v, true) catch {};
    }

    for (characters) |val| {
        var my_val = hashMap.get(val);

        if (my_val) |b| {
            if (!b) {
                return false;
            } else {
                continue;
            }
        } else {
            return false;
        }
    }

    return true;
}
