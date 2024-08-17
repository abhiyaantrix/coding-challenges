# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/find-peak-element/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(log n)
# Space complexity: O(1)

# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  left = 0
  right = nums.length - 1

  while left < right
    mid = left + ((right - left) / 2)

    num = nums[mid]
    right_num = nums[mid + 1]

    if num > right_num
      right = mid
    else
      left = mid + 1
    end
  end

  left # at the end of while, left == right
end
