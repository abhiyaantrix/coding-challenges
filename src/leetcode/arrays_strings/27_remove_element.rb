# frozen_string_literal: true

# LeetCode Top Interview 150
# https://leetcode.com/problems/remove-element/description/?envType=study-plan-v2&envId=top-interview-150

# Time complexity: O(n)
# Space complexity: O(1)

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  return 0 if nums.nil?

  count = 0

  nums.each do |num|
    if num != val
      nums[count] = num
      count += 1
    end
  end

  count
end
