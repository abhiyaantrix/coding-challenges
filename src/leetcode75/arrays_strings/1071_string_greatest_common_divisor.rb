# frozen_string_literal: true

# Find the greatest common divisor of two strings
# https://leetcode.com/problems/greatest-common-divisor-of-strings/description/?envType=study-plan-v2&envId=leetcode-75
# Given two strings, find the largest string that divides both strings
# A string s divides string t if t = s + ... + s or t = t + ... + t
# Return the largest string that divides both strings
# If there is no such string, return an empty string

# Time complexity: O(n), where n is the length of the larger string
# Space complexity: O(1)

# Strategy:
# Find the greatest common divisor of the lengths of the two strings
# Use the candidate string to check if it divides both strings
# If it does, return the candidate string
# Otherwise, return an empty string

# @param [String] larger_string The first input string
# @param [String] smaller_string The second input string
# @return [String] The largest string that divides both strings
# @example
# gcd_of_strings('ABCABC', 'ABC') => 'ABC'
# gcd_of_strings('ABABAB', 'ABAB') => 'AB'
# gcd_of_strings('LEET', 'CODE') => ''
def gcd_of_strings(larger_string, smaller_string)
  length_larger = larger_string.length
  length_smaller = smaller_string.length

  length_gcd = compute_gcd(length_larger, length_smaller)

  candidate = larger_string.slice(0, length_gcd)

  return candidate if divisible?(larger_string, candidate) && divisible?(smaller_string, candidate)

  ''
end

def divisible?(str, divisor)
  return false unless (str.length % divisor.length).zero?

  str == divisor * (str.length / divisor.length)
end

# Euclidean algorithm to efficiently find GCD of two numbers
# GCD of two numbers also divides their difference, that's why keep using modulo until remainder is reduced to zero
# Which will give the largest possible common divisor
def compute_gcd(larger_num, smaller_num)
  current = larger_num
  remainder = smaller_num

  current, remainder = remainder, current % remainder while remainder != 0

  current
end
