pub const ComputationError = error{
    IllegalArgument,
};
pub fn steps(number: usize) anyerror!usize {
    var num = number;
    var ans: usize = 0;
    if (num == 0) {
        return ComputationError.IllegalArgument;
    }

    while (num != 1) {
        if (num % 2 == 0) {
            num = num / 2;
        } else {
            num = num * 3 + 1;
        }

        ans = ans + 1;
    }

    return ans;
}
