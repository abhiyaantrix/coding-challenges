# frozen_string_literal: true

# LeetCode
# https://leetcode.com/problems/concatenation-of-array/description/

# Time complexity: O(n)
# Space complexity: O(n)

# @param {Integer[]} nums
# @return {Integer[]}
def get_concatenation(nums)
  length = nums.length

  double_length = 2 * length

  (0...double_length).map { |index| nums[index % length] }

  # Alternatives
  # Array.new(nums.length * 2) { |index| nums[index % nums.length] }
  # nums + nums
  # nums * 2
  # nums.concat(nums)
end
