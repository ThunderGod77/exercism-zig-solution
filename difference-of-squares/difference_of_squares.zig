pub fn squareOfSum(number: usize) usize {
    var sum: usize = 0;

    var i: usize = 0;

    while (i <= number) : (i += 1) {
        sum = sum + i;
    }

    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;

    var i: usize = 0;

    while (i <= number) : (i += 1) {
        sum = sum + i * i;
    }

    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
