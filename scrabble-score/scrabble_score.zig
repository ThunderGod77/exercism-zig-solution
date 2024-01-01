fn toUpperCase(char: u8) u8 {
    if (char >= 'a' and char <= 'z') {
        return char - ('a' - 'A');
    }
    return char;
}

pub fn score(s: []const u8) u32 {
    var ans: u32 = 0;

    for (s) |val| {
        var a = toUpperCase(val);
        switch (a) {
            'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => {
                ans = ans + 1;
            },
            'D', 'G' => {
                ans = ans + 2;
            },
            'B', 'C', 'M', 'P' => {
                ans = ans + 3;
            },
            'F', 'H', 'V', 'W', 'Y' => {
                ans = ans + 4;
            },
            'K' => {
                ans = ans + 5;
            },
            'J', 'X' => {
                ans = ans + 8;
            },
            'Q', 'Z' => {
                ans = ans + 10;
            },
            else => {
                ans = ans + 0;
            },
        }
    }

    return ans;
}
