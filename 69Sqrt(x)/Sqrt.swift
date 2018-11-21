class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x != 0 else {
            return 0
        }

        guard x > 3 else {
            return 1
        }
        var left = 2
        var right = x / 2
        while left <= right {
            let mid = (right + left) / 2
            if mid == x / mid {
                return mid
            } else if mid < x / mid {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return right
    }
}
