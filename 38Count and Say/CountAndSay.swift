func countAndSay(_ n: Int) -> String {
    var result: [Character] = ["1"]
    for _ in 0..<n - 1 {
        let arrayString = Array(result)
        var sameCount = 1
        result = []
        for j in 0..<arrayString.count {
            if j + 1 < arrayString.count && arrayString[j + 1] == arrayString[j] {
                sameCount += 1
            } else {
                result.append(Character.init("\(sameCount)"))
                result.append(arrayString[j])
                sameCount = 1
            }
        }
    }
    return String(result)
}
