/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        
        guard l2 != nil else {
            return l1
        }
        
        var result = ListNode(0)
        var tempL1 = l1
        var tempL2 = l2
        var lastNode = result
        while tempL1 != nil && tempL2 != nil {
            if tempL1!.val < tempL2!.val {
                lastNode.next = ListNode(tempL1!.val)
                tempL1 = tempL1!.next
            } else {
                lastNode.next = ListNode(tempL2!.val)
                tempL2 = tempL2!.next
            }
            lastNode = lastNode.next!
        }
        
        var lastChain: ListNode!
        if tempL1 != nil {
            lastChain = tempL1
        } else {
            lastChain = tempL2
        }
        
        lastNode.next = lastChain
        
        return result.next
    }
}
