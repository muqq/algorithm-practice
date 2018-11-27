func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    guard n != 0 else {
        return
    }

    guard m != 0 else {
        nums1 = nums2
        return
    }

    var firstCount = 0
    var secondCount = 0
    var result: [Int] = []
    for i in 0...m + n - 1 {
        if firstCount == m {
            result.append(nums2[secondCount])
            secondCount += 1
        } else if secondCount == n {
            result.append(nums1[firstCount])
            firstCount += 1
        } else if nums1[firstCount] <= nums2[secondCount] {
            result.append(nums1[firstCount])
            firstCount += 1
        } else {
            result.append(nums2[secondCount])
            secondCount += 1
        }
    }
    nums1 = result
}
