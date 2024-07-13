# frozen_string_literal: true

# Array, Two pointer
# https://leetcode.com/problems/reverse-vowels-of-a-string/description/?envType=study-plan-v2&envId=leetcode-75
# Reverse only the vowels in a string

# Time complexity: O(n), where n is the length of the string
# Space complexity: O(1)

# Strategy:
# Use two pointers to swap vowels
# 1. Initialize left and right pointers at the start and end of the string
# 2. Move the left pointer to the right until it finds a vowel
# 3. Move the right pointer to the left until it finds a vowel
# 4. Swap the vowels at the left and right pointers
# 5. Repeat steps 2-4 until the left pointer is greater than the right pointer
# 6. Return the string with reversed vowels

# @param [String] str The input string
# @return [String] The string with reversed vowels
# @example
#  reverse_vowels('hello') => 'holle'
#  reverse_vowels('leetcode') => 'leotcede'
#  reverse_vowels('aA') => 'Aa'
def reverse_vowels(str)
  vowel_regex = /[aeiou]/i # Case-insensitive regex
  chars = str.chars
  left = 0
  right = str.length - 1

  while left < right
    until left >= right
      right -= 1 until chars[right] =~ vowel_regex
      left += 1 until chars[left] =~ vowel_regex
    end

    next unless left < right

    chars[left], chars[right] = chars[right], chars[left]
    left += 1
    right -= 1
  end

  chars.join
end

# Lazy solution
def reverse_vowels_lazy(str)
  vowels = str.scan(/[aeiou]/i)
  str.gsub(/[aeiou]/i) { vowels.pop }
  # sequentially finds vowel and replace
  # from vowels array by popping last element
  # effectively reversing the order
end
