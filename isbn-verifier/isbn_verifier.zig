const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    var sum: usize = 0;

    var counter: usize = 10;

    for (s) |val| {
        if (counter < 1) {
            return false;
        }
        if (std.ascii.isDigit(val)) {
            sum = sum + (counter * (val - '0'));
            counter -= 1;
        } else if ((val == 'x' or val == 'X') and counter == 1) {
            sum = sum + (counter * 10);
            counter -= 1;
        } else if (val == '-') {
            continue;
        } else {
            return false;
        }
    }

    if (counter != 0) {
        return false;
    }

    return (sum % 11 == 0);
}
