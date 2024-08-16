# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/successful-pairs-of-spells-and-potions/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(log n)
# Space complexity: O(1)

# @param {Integer[]} spells
# @param {Integer[]} potions
# @param {Integer} success
# @return {Integer[]}
def successful_pairs(spells, potions, success)
  sorted_potions = potions.sort
  potion_length = sorted_potions.length
  max_potion = sorted_potions[potion_length - 1]

  spells.map do |spell|
    min_potion = (success / spell.to_f).ceil

    return 0 if min_potion > max_potion

    min_potion_index = binary_search(sorted_potions, min_potion)

    potion_length - min_potion_index
  end
end

def binary_search(potions, target_potion)
  low = 0
  high = potions.length

  while low < high
    mid = low + ((high - low) / 2)

    if potions[mid] < target_potion
      low = mid + 1
    else
      high = mid
    end
  end

  low
end
