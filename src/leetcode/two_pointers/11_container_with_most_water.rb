# frozen_string_literal: true

# LeetCode 75

# Container With Most Water
# https://leetcode.com/problems/container-with-most-water/?envType=study-plan-v2&envId=leetcode-75
# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai)
# n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0)
# Find two lines, which, together with the x-axis forms a container, such that the container contains the most water
# Notice that you may not slant the container

# Time complexity: O(n)
# Space complexity: O(1)

# Strategy:
# Use two pointers to find the maximum area of the container
# Initialize the first and second boundary to the first and last index of the height array
# Iterate through the height array and calculate the area of the container formed by the two boundaries
# Update the maximum area if the current area is greater than the maximum area
# Move the boundary with the smaller height towards the other boundary
# Return the maximum area

# @param {Integer[]} height
# @return {Integer}
# @example
# max_area([1,8,6,2,5,4,8,3,7]) => 49
# max_area([1,1]) => 1
# max_area([4,3,2,1,4]) => 16
# max_area([1,2,1]) => 2
def max_area(height)
  max_area = 0

  first_boundary = 0
  second_boundary = height.length - 1

  while second_boundary > first_boundary
    first_bound_height = height[first_boundary]
    second_bound_height = height[second_boundary]

    area = (second_boundary - first_boundary) * [second_bound_height, first_bound_height].min
    max_area = [max_area, area].max

    first_bound_height < second_bound_height ? first_boundary += 1 : second_boundary -= 1
  end

  max_area
end
