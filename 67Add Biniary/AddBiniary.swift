class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aLength = a.count - 1
        var bLength = b.count - 1
        var sum = 0
        var intA = a.map { (char) -> Int in
            return Int(char.description)!
        }

        var intB = b.map { (char) -> Int in
            return Int(char.description)!
        }

        var result: [Int] = []


        while aLength >= 0 || bLength >= 0 || sum == 1 {
            sum += aLength >= 0 ? intA[aLength] : 0
            sum += bLength >= 0 ? intB[bLength] : 0
            result.insert(sum % 2, at: 0)
            sum /= 2
            aLength -= 1
            bLength -= 1
        }

        return result.map { return String($0) }.joined()
    }
}
