# frozen_string_literal: true

# LeetCode 75

# Merge Strings Alternately
# https://leetcode.com/problems/merge-strings-alternately/?envType=study-plan-v2&envId=leetcode-75
# You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1
# If a string is longer than the other, append the additional letters onto the end of the merged string
# Return the merged string

# Time complexity: O(Max(Word1.Length,Word2.Length))
# Space complexity: O(1)

# Strategy:
# Iterate through the strings and merge them alternately
# If the strings are of different lengths, append the remaining characters to the merged string
# Return the merged string

# @param {String} word1
# @param {String} word2
# @return {String}
# @example
# merge_strings_alternately('abc', 'pqr') => 'apbqcr'
# merge_strings_alternately('ab', 'pqrs') => 'apbqrs'
# merge_strings_alternately('abcd', 'pq') => 'apbqcd'
def merge_strings_alternately(word1, word2)
  word1_length = word1.length
  word2_length = word2.length

  length = [word1_length, word2_length].max

  merged_word = ''

  (0...length).each do |pos|
    merged_word << word1[pos] if pos < word1_length
    merged_word << word2[pos] if pos < word2_length
  end

  merged_word
end

### Alternative 1
# This solution needs to create more array for compact and join method
def merge_alternately(word1, word2)
  length = [word1.length, word2.length].max

  (0..(length - 1)).each_with_object([]) do |pos, merged|
    merged << word1[pos]
    merged << word2[pos]
  end.compact.join
end
