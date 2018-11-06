func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle.count > 0 else {
        return 0
    }

    guard haystack.count >= needle.count else {
        return -1
    }

    let haystackArr = Array(haystack)
    let needleArr = Array(needle)

    for j in 0..<haystackArr.count {
        if haystackArr[j] == needleArr[0] {
            let startIndex = j
            var index = j
            for i in 0..<needleArr.count {
                guard haystackArr.count > index else {
                    return -1
                }

                if haystackArr[index] == needleArr[i] {
                    index += 1
                } else {
                    break
                }

                if i == needleArr.count - 1 {
                    return startIndex
                }
            }

        }
    }
    return -1
}
