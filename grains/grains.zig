const std = @import("std");

pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index > 64 or index < 1) {
        return ChessboardError.IndexOutOfBounds;
    }
    return std.math.pow(u64, 2, index - 1);
}

pub fn total() u64 {
    var i: u32 = 1;

    var ans: u64 = 0;

    while (i <= 64) : (i += 1) {
        var val = square(i) catch {
            var j: u64 = 0;
            return j;
        };
        ans = ans + val;
    }

    return ans;
}
