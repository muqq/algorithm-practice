class Solution {
    
    private var array: [Int] = []
    private var rank: [Int] = []
    private var unionCount = 0
    
    func functionName() -> Int {
        for i in 0..<n {
            array.append(i)
            rank.append(1)
            unionCount = n
        }
        return -1
    }
    
    func find(_ x: Int) -> Int {
        if x == array[x] {
            return x
        }
        array[x] = find(array[x])
        return array[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            if rank[rootX] > rank[rootY] {
                array[rootY] = rootX
            } else if rank[rootX] < rank[rootY] {
                array[rootX] = rootY
            } else {
                array[rootY] = rootX
                rank[rootX] += 1 
            }
            unionCount -= 1
        }
    }
}
Console
