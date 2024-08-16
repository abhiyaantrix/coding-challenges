# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/guess-number-higher-or-lower/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(log n)
# Space complexity: O(1)

# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num)

def guess(num)
  picked = 6

  num <=> picked
end

def guess_number(range)
  left = 0
  right = range

  while left <= right
    pick = left + ((right - left) / 2)

    guess_check = guess(pick)

    return pick if guess_check.zero?

    if guess_check == 1
      left = pick + 1
    else
      right = pick - 1
    end
  end
end
