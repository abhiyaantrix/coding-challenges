# frozen_string_literal: true

# Move Zeroes to End
# https://leetcode.com/problems/move-zeroes/?envType=study-plan-v2&envId=leetcode-75
# Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements
# Note that you must do this in-place without making a copy of the array

# Time complexity: O(n), where n is the length of the array
# Space complexity: O(1)

# Strategy:
# Use a two-pointer approach to move all the non-zero elements to the beginning of the array
# Initialize a pointer to keep track of the position where the next non-zero element should be placed
# Iterate through the array and if the current element is non-zero, move it to the position pointed by the pointer
# Move all the remaining elements to the end of the array
# Return the modified array

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
# @example
# move_zeroes_to_end([0,1,0,3,12]) => [1,3,12,0,0]
# move_zeroes_to_end([0]) => [0]
# move_zeroes_to_end([1,2,3,4,5]) => [1,2,3,4,5]
# move_zeroes_to_end([0,0,0,0,0]) => [0,0,0,0,0]
def move_zeroes_to_end(nums)
  non_zero_swap_pos = 0

  nums.each do |num|
    if num != 0
      nums[non_zero_swap_pos] = num
      non_zero_swap_pos += 1
    end
  end

  (non_zero_swap_pos...nums.length).each { |index| nums[index] = 0 }

  nums
end

# First attempt, too many swaps, complex
# def move_zeroes_to_end(nums)
#   length = nums.length

#   return nums if length < 2

#   iterator = length - 1
#   swap = length - 1

#   while iterator >= 0
#     current_val = nums[iterator]

#     if current_val.zero? # candidate move to right
#       (iterator...swap).each do |pos|
#         prev = nums[pos + 1]

#         break if prev&.zero?

#         nums[pos], nums[pos + 1] = nums[pos + 1], nums[pos]
#       end
#       swap -= 1
#     end

#     iterator -= 1
#   end

#   nums
# end
