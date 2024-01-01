const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var n = num;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    var ma = gpa.allocator();

    var digits = std.ArrayList(u128).init(ma);
    defer digits.clearAndFree();

    var num_digits: u128 = 0;

    while (n > 0) : (n /= 10) {
        digits.append(n % 10) catch {};
        num_digits += 1;
    }

    var a_ans: u128 = 0;

    for (digits.items) |val| {
        a_ans = a_ans + std.math.pow(u128, val, num_digits);
    }

    if (a_ans == num) {
        return true;
    } else {
        return false;
    }
}
