# frozen_string_literal: true

# Find kids with the greatest number of candies
# https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/description/?envType=study-plan-v2&envId=leetcode-75
# Given the array candies and the integer extra_candies, where candies[i] represents the number of candies that the ith kid has
# For each kid check if there is a way to distribute extra_candies among the kids such that he or she can have the greatest number of candies among them
# Notice that multiple kids can have the greatest number of candies

# Time complexity: O(n), where n is the length of the candies array
# Space complexity: O(n)

# Strategy:
# Find the max number of candies in the array and check if the kid can have the greatest number of candies
# by adding extra candies to his or her current number of candies
# If the kid can have the greatest number of candies, return true, otherwise return false

# @param {Integer[]} candies
# @param {Integer} extra_candies
# @return {Boolean[]}
# @example
# kids_with_candies([2,3,5,1,3], 3) => [true, true, true, false, true]
# kids_with_candies([4,2,1,1,2], 1) => [true, false, false, false, false]
def kids_with_candies(candies, extra_candies)
  max_candies = -Float::INFINITY

  candies.each do |num_of_candies|
    max_candies = num_of_candies if num_of_candies > max_candies
  end

  candies.map { |candies_for_kid| candies_for_kid + extra_candies >= max_candies }
end
