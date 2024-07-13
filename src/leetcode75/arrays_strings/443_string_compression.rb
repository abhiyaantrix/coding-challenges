# frozen_string_literal: true

# https://leetcode.com/problems/string-compression/?envType=study-plan-v2&envId=leetcode-75
# Given an array of characters, compress it in-place
# The length after compression must always be smaller than or equal to the original array
# Every element of the array should be a character (not int) of length 1
# After done modifying the input array in-place, return the new length of the array
# Must do this by modifying the input array in-place with O(1) extra memory

# Time complexity: O(n)
# Space complexity: O(1)

# Strategy:
# Iterate through the array and keep track of the count of the same characters
# If the next character is different, append the character and its count to the compressed string
# Replace the original array with the compressed string and return the length of the compressed string

# @param {Character[]} chars
# @return {Integer}
# @example
#  compress(["a","a","b","b","c","c","c"]) => 6
# compress(["a"]) => 1
# compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"]) => 4
def compress(chars)
  chars_count = 0

  compressed_string = ''

  chars.each_with_index do |char, index|
    chars_count += 1

    next if char == chars[index + 1]

    compressed_string << char
    compressed_string << chars_count.to_s if chars_count > 1
    chars_count = 0
  end

  chars.replace(compressed_string.chars).length
end
