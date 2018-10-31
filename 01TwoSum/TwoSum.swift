    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [Int: Int]()
        for i in 0..<nums.count {
            if let complementValue = dict[target - nums[i]] {
                return [complementValue, i]
            }
            dict[nums[i]] = i
        }
        return [-1]
    }
