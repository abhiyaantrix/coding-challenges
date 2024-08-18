# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/determine-if-two-strings-are-close/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(n)
# Space complexity: O(1)

# @param {String} word1
# @param {String} word2
# @return {Boolean}
def close_strings(word1, word2)
  # hash_map_word1 = word1.chars.each_with_object(Hash.new(0)) { |item, acc| acc[item] += 1 }
  # hash_map_word2 = word2.chars.each_with_object(Hash.new(0)) { |item, acc| acc[item] += 1 }

  return true if word1 == word2
  return false if word1.length != word2.length

  word1_occurrences = word1.chars.tally
  word2_occurrences = word2.chars.tally

  word1_occurrences.keys.sort == word2_occurrences.keys.sort &&
    word1_occurrences.values.sort == word2_occurrences.values.sort
end
