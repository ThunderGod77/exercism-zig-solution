const std = @import("std");

pub const DnaError = error{ UnequalDnaStrands, EmptyDnaStrands };

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    var ans: usize = 0;

    var index: usize = 0;

    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    }

    if (first.len != second.len) {
        return DnaError.UnequalDnaStrands;
    }

    while (index < first.len) : (index += 1) {
        if (first[index] != second[index]) {
            ans += 1;
        }
    }

    return ans;
}
