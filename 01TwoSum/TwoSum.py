from typing import List


def two_sum(self, nums: List[int], target: int) -> List[int]:
    hash_map = {}
    for idx, num in enumerate(nums):
        if target - num in hash_map:
            return [hash_map[target - num], idx]
        hash_map[num] = idx
    return [-1]
