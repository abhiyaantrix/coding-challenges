# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/find-the-difference-of-two-arrays/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(n + m)
# Space complexity: O(n + m)

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[][]}
def find_difference_set(nums1, nums2)
  nums1_set = nums1.to_set
  nums2_set = nums2.to_set

  [(nums1_set - nums2_set).to_a, (nums2_set - nums1_set).to_a]
end

def find_difference_uniq(nums1, nums2)
  nums1_uniq = nums1.uniq
  nums2_uniq = nums2.uniq

  [nums1_uniq - nums2_uniq, nums2_uniq - nums1_uniq]
end

def find_difference_bitwise_or(nums1, nums2)
  uniq_combined = nums1 | nums2

  [uniq_combined - nums2, uniq_combined - nums1]
end
