# frozen_string_literal: true

# LeetCode Top Interview 150
# https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150

# Time complexity: O(n)
# Space complexity: O(1)

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.nil?

  length = nums.length

  return 1 if length == 1

  unique_num_count = 1

  nums.each do |current_num|
    last_unique_num = nums[unique_num_count - 1]

    next if last_unique_num == current_num

    nums[unique_num_count] = current_num
    unique_num_count += 1
  end

  unique_num_count
end
