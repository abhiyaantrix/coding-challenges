# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/unique-number-of-occurrences/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O()
# Space complexity: O()

# @param {Integer[]} arr
# @return {Boolean}
def unique_occurrences(arr)
  hash_map = arr.each_with_object(Hash.new(0)) { |item, acc| acc[item] += 1 }

  # in-built
  # hash_map = arr.tally

  hash_map.length == hash_map.values.uniq.length
end
