# frozen_string_literal: true

# You have a long flowerbed in which some of the plots are planted, and some are not
# However, flowers cannot be planted in adjacent plots
# https://leetcode.com/problems/can-place-flowers/?envType=study-plan-v2&envId=leetcode-75
# Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty,
# and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule

# Time complexity: O(n), where n is the length of the flowerbed
# Space complexity: O(1)

# Strategy:
# Iterate through the flowerbed and plant flowers in empty plots that have no adjacent flowers
# If the number of flowers planted is greater than or equal to the required number of flowers, return true
# Otherwise, return false

# @param {Integer[]} flowerbed
# @param {Integer} num
# @return {Boolean}
# @example
# can_place_flowers([1,0,0,0,1], 1) => true
def can_place_flowers(flowerbed, num)
  return true if num.zero?

  flowers_planted = 0
  pointer = 0
  length = flowerbed.length

  while pointer < length
    current_plot = flowerbed[pointer]

    if current_plot == 1
      pointer += 2
      next
    end

    current_plot = flowerbed[pointer]
    prev_plot = pointer.zero? ? 0 : flowerbed[pointer - 1]
    next_plot = pointer == (flowerbed.length - 1) ? 0 : flowerbed[pointer + 1]

    if current_plot.zero? && prev_plot.zero? && next_plot.zero?
      flowers_planted += 1

      pointer += 2
    else
      pointer += 1
    end
  end

  flowers_planted >= num
end
