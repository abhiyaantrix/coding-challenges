# frozen_string_literal: true

# LeetCode 75

# Given an array of integers nums, calculate the pivot index of this array
# The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to
# the sum of all the numbers strictly to the index's right
# If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left
# This also applies to the right edge of the array
# Return the leftmost pivot index. If no such index exists, return -1
# https://leetcode.com/problems/find-pivot-index/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(n)
# Space complexity: O(1)

# @param {Integer[]} nums
# @return {Integer}
# Example:
# Input: nums = [1,7,3,6,5,6]
# Output: 3
# Input: nums = [1,2,3]
# Output: -1
# Input: nums = [2,1,-1]
# Output: 0
def pivot_index(nums)
  left_sum = 0
  total_sum = nums.sum

  nums.each_with_index do |num, index|
    right_sum = total_sum - left_sum - num

    return index if left_sum == right_sum

    left_sum += num
  end

  -1
end
