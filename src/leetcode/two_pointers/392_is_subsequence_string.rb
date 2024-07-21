# frozen_string_literal: true

# LeetCode 75

# Is Subsequence String
# https://leetcode.com/problems/is-subsequence/?envType=study-plan-v2&envId=leetcode-75
# Given two strings str and target, return true if str is a subsequence of target, or false otherwise
# A subsequence of a string is a new string that is formed from the original string by deleting some (can be none)
# of the characters without disturbing the relative positions of the remaining characters
# (i.e., "ace" is a subsequence of "abcde" while "aec" is not)

# Time complexity: O(n), where n is the length of the target string
# Space complexity: O(1)

# Strategy:
# Use two pointers to check if the characters in the string are present in the target string
# Initialize the pointers to the start of the string and target string
# Iterate through the target string and if the characters at the pointers are the same, move the string pointer
# Return true if the string pointer reaches the end of the string, otherwise return false

# @param {String} str
# @param {String} target
# @return {Boolean}
# @example
# is_subsequence('abc', 'ahbgdc') => true
# is_subsequence('axc', 'ahbgdc') => false
# is_subsequence('abc', 'ahbgdc') => true
# is_subsequence('abc', 'ahbgdc') => true
def is_subsequence(str, target) # rubocop:disable Naming/PredicateName
  str_pointer = 0
  target_pointer = 0

  while target_pointer < target.length
    str_pointer += 1 if str_pointer < str.length && str[str_pointer] == target[target_pointer]

    target_pointer += 1
  end

  str_pointer == str.length
end

def is_subsequence_iterator(str, target) # rubocop:disable Naming/PredicateName
  str_pointer = 0

  target.each_char do |target_char|
    str_pointer += 1 if str_pointer < str.length && str[str_pointer] == target_char
  end

  str_pointer == str.length
end
