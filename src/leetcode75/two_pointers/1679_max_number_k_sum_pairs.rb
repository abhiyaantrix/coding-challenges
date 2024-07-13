# frozen_string_literal: true

# Given an array of integers nums and an integer target_sum, return the maximum number of index-pairs (i, j) such that i < j and nums[i] + nums[j] == target_sum.
# https://leetcode.com/problems/max-number-of-target_sum-sum-pairs/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(nlogn)
# Space complexity: O(1)

# Strategy:
# 1. Sort the array
# 2. Use two pointers to find the sum of the two numbers
# 3. If the sum is equal to target_sum, increment the operations count and move the pointers
# 4. If the sum is less than target_sum, move the start pointer
# 5. If the sum is greater than target_sum, move the end pointer
# 6. Return the operations count

# @param {Integer[]} nums
# @param {Integer} target_sum
# @return {Integer}
def max_operations(nums, target_sum)
  nums.sort!

  start_pointer = 0
  end_pointer = nums.length - 1

  operations = 0

  while start_pointer < end_pointer
    end_value = nums[end_pointer]
    start_value = nums[start_pointer]

    if end_value > target_sum
      end_pointer -= 1
      next
    end

    sum = start_value + end_value

    if sum == target_sum
      operations += 1
      start_pointer += 1
      end_pointer -= 1
    elsif sum < target_sum
      start_pointer += 1
    else
      end_pointer -= 1
    end
  end

  operations
end

# Time complexity: O(n)
# Space complexity: O(n)

# Strategy:
# 1. Create a hash map with the frequency of each number
# 2. Iterate through the array
# 3. Calculate the compliment of the number
# 4. If the compliment is present in the hash map, decrement the frequency of the compliment and increment the operations count
# 5. If the compliment is not present in the hash map, increment the frequency of the number
# 6. Return the operations count

# Faster
# @param {Integer[]} nums
# @param {Integer} target_sum
# @return {Integer}
def max_operations_hash_map(nums, target_sum)
  nums_map = Hash.new 0 # Makes the default value 0 instead of nil
  operations = 0

  nums.each do |num|
    next if n >= target_sum

    compliment = target_sum - num

    if (nums_map[compliment]).positive?
      nums_map[compliment] -= 1

      operations += 1
    else
      nums_map[num] += 1
    end
  end

  operations
end

def max_operations_tally(nums, target_sum)
  # Create hash map with frequency of each number
  num_frequencies = nums.tally

  num_frequencies.default = 0

  # Calculate the maximum number of pairs
  max_pairs = num_frequencies.inject(0) do |total_pairs, (num, count)|
    complement = target_sum - num

    total_pairs + [count, num_frequencies[complement]].min
  end

  # Each pair is counted twice, so divide by 2 to get the actual number of pairs
  max_pairs / 2
end
