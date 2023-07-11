protocol Queue {
    associatedtype DataType: Comparable
    
    
    /// Inserts a new item into the queue.
    /// - parameter item: The item to add.
    /// - returns: Whether or not the insert was successful.
    
    @discardableResult func add(_ item: DataType) -> Bool
    
    
    /// Gets the first item in line and removes it from the queue.
    /// - returns: An Optional containing the first item in the queue.
    
    func dequeue() -> DataType?
    
    
    /// Gets the first item in line, without removing it from the queue.
    /// - returns: An Optional containing the first item in the queue.
    
    func peek() -> DataType?
    
    
    /// Clears the queue.
    
    func clear() -> Void

    var isEmpty: Bool { get }

    var count: Int { get }
}

class PriorityQueue<T: Comparable>: Queue {
    
  typealias DataType = T
  
  
  /// The backing storage for our queue.
   
  private var queue: Array<DataType>
  
  
  /// The current size of the queue.
   
  public var size: Int {
    return self.queue.count
  }
  
  public init() {
    self.queue = Array<DataType>()
  }

  var isEmpty: Bool {
    return queue.isEmpty
  }

  var count: Int {
    return queue.count
  }
  
  /// Inserts a new item into the queue.
  /// - parameter item: The item to add.
  /// - returns: Whether or not the insert was successful.
  
  @discardableResult func add(_ item: DataType) -> Bool {
    queue.append(item)
    heapifyUp()
    return true
  }
  
  private func heapifyUp() {
    var childIndex = queue.count - 1
    var parentIndex = childIndex.parent
    while parentIndex >= 0, queue[parentIndex] > queue[childIndex] {
      swap(childIndex, with: parentIndex)
      childIndex = parentIndex
      parentIndex = childIndex.parent
    }
  }
  
  private func heapifyDown() -> DataType? {
    guard queue.count > 1 else { 
      let item = queue.removeFirst()
      return item
    }
    let popItem = queue[0]
    queue[0] = queue.removeLast()
    
    var parent = 0
    
    while true {
      guard parent.leftChild < queue.count else {
        break
      }
      let rightChild = parent.rightChild
      var minChild = parent.leftChild
      if rightChild < queue.count, queue[rightChild] < queue[minChild] {
        minChild = rightChild
      }
      
      if queue[parent] > queue[minChild] {
        swap(parent, with: minChild)
        parent = minChild
      } else {
        break
      }
    }
    
    
    return popItem
  }
    
  /// Gets the first item in line and removes it from the queue.
  /// - returns: An Optional containing the first item in the queue.
  
  func dequeue() -> DataType? {
    return heapifyDown()
  }
  
  
  /// Gets the first item in line, without removing it from the queue.
  /// - returns: An Optional containing the first item in the queue.
  
  func peek() -> DataType? {
    return queue.first
  }
  
  
  /// Clears the queue.
  
  func clear() {
    queue.removeAll()
  }

  private func swap(_ firstIndex: Int, with secondIndex: Int) {
    let firstItem = queue[firstIndex]
    queue[firstIndex] = queue[secondIndex]
    queue[secondIndex] = firstItem
  }
}

private extension Int {
  var leftChild: Int {
    return (2 * self) + 1
  }
  
  var rightChild: Int {
    return (2 * self) + 2
  }
  
  var parent: Int {
    return (self - 1) / 2
  }
}
