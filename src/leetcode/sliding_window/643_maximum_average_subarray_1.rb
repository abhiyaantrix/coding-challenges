# frozen_string_literal: true

# LeetCode 75

# Find the maximum average of a subarray of size target_length
# https://leetcode.com/problems/maximum-average-subarray-i/description/?envType=study-plan-v2&envId=leetcode-75
# Given an array of integers nums, and an integer target_length, return the maximum average of a subarray of size target_length

# Time complexity: O(n), where n is the length of the nums array
# Space complexity: O(1)

# Strategy:
# Use a sliding window to find the maximum average of a subarray of size target_length
# Initialize the start and end pointers to 0 and target_length - 1 respectively
# Calculate the sum of the first target_length elements and set it as the current sum and the max sum
# Iterate through the array and update the current sum by adding the next element and subtracting the first element
# Update the max sum if the current sum is greater than the max sum
# Return the maximum average by dividing the max sum by target_length

# @param {Integer[]} nums
# @param {Integer} target_length
# @return {Float}
# @example
# find_max_average([1,12,-5,-6,50,3], 4) => 12.75
# find_max_average([5], 1) => 5.0
# find_max_average([0,4,0,3,2], 1) => 4.0
def find_max_average(nums, target_length)
  length = nums.length

  start_pointer = 0
  end_pointer = target_length - 1

  max_sum = current_sum = nums[0...target_length].sum

  while end_pointer < length - 1
    end_pointer += 1

    current_sum += nums[end_pointer]

    current_sum -= nums[start_pointer]

    start_pointer += 1

    max_sum = [current_sum, max_sum].max
  end

  max_sum.fdiv(target_length)
end

# Alternate
def find_max_average_with_each(nums, target_length)
  max_sum = current_sum = nums[0...target_length].sum

  (target_length...nums.length).each do |end_pointer|
    current_sum = current_sum + nums[end_pointer] - nums[end_pointer - target_length]

    max_sum = [current_sum, max_sum].max
  end

  max_sum.fdiv(target_length)
end
