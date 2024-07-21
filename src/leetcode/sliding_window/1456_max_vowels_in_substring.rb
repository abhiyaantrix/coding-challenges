# frozen_string_literal: true

# LeetCode 75

# Maximum Number of Vowels in a Substring of Given Length
# https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/description/?envType=study-plan-v2&envId=leetcode-75
# Given a string str and an integer target_length, return the maximum number of vowel letters in any substring of s with length target_length
# Vowel letters in English are (a, e, i, o, u)

# Time complexity: O(n), where n is the length of the string
# Space complexity: O(1)

# Strategy:
# Use a sliding window to find the maximum number of vowels in a substring of length target_length
# Initialize the start and end pointers to 0 and target_length - 1 respectively
# Calculate the number of vowels in the first target_length characters and set it as the current number of vowels and the maximum number of vowels
# Iterate through the string and update the current number of vowels by adding the next character and subtracting the first character
# Update the maximum number of vowels if the current number of vowels is greater than the maximum number of vowels
# Return the maximum number of vowels

# @param {String} str
# @param {Integer} target_length
# @return {Integer}
# @example
# max_vowels('abciiidef', 3) => 3
# max_vowels('aeiou', 2) => 2
# max_vowels('leetcode', 3) => 2
# max_vowels('rhythms', 4) => 0
# max_vowels('tryhard', 4) => 1
def max_vowels(str, target_length)
  start_pointer = 0
  end_pointer = target_length - 1

  max_vowels = current_vowels = vowels_count(str[start_pointer..end_pointer])

  while end_pointer < (str.length - 1)
    end_pointer += 1

    current_vowels += vowels_count(str[end_pointer])

    current_vowels -= vowels_count(str[start_pointer])

    start_pointer += 1

    max_vowels = [current_vowels, max_vowels].max
  end

  max_vowels
end

def vowels_count(str)
  vowels_regex = /[aeiou]/i

  str.scan(vowels_regex).length
end
