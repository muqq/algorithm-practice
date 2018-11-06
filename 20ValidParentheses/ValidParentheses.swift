func isValid(_ s: String) -> Bool {

    guard s.count != 0 else {
        return true
    }

    guard s.count != 1 else {
        return false
    }

    var stack = Array<String>()

    let dict: [String: String] = [
        "(": ")",
        "{": "}",
        "[": "]"
    ]

    var stringArray = Array(s)

    for i in 0..<stringArray.count {
        switch stringArray[i] {
        case "(", "{", "[":
            stack.append(String(stringArray[i]))
        default:
            guard let lastChar = stack.last else {
                return false
            }
            guard dict[lastChar] == String(stringArray[i]) else {
                return false
            }
            stack.removeLast()
        }
    }
    return stack.count == 0
}
