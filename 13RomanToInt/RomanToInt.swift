    func romanToInt(_ s: String) -> Int {
        var res: Int = 0
        var dict: [String: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        let arrayString = Array(s)

        for i in 0..<arrayString.count - 1 {
            let indexString = String(arrayString[i])
            let nextIndexString = String(arrayString[i + 1])
            guard let indexNum = dict[indexString], let nextIndexNum = dict[nextIndexString] else {
                return 0
            }
            if indexNum < nextIndexNum {
                res -= indexNum
            } else {
                res += indexNum
            }
        }
        res += dict[String(arrayString.last!)]!
        return res
    }
