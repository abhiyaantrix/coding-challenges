# frozen_string_literal: true

# LeetCode 75

# Given an array of integers gain, where gain[i] represents the net gain in altitude between points i and i + 1 for all (0 <= i < gain.length),
# return the highest altitude of a point
# A point has the highest altitude if it has the largest altitude
# https://leetcode.com/problems/find-the-highest-altitude/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(n)
# Space complexity: O(1)

# @param {Integer[]} gain
# @return {Integer}
def largest_altitude(gains)
  current_altitude = 0
  highest_altitude = 0

  gains.each do |gain|
    current_altitude += gain

    highest_altitude = [current_altitude, highest_altitude].max
  end

  highest_altitude
end

def largest_altitude_using_inject(gains)
  prefix_sum = gains.inject([]) { |acc, gain| acc << (acc.last.to_i + gain) }

  max_gain = prefix_sum.max

  [max_gain, 0].max
end

def largest_altitude_initial_attempt(gains)
  return 0 if gains.nil? || gains.empty?

  current_altitude = 0
  max_altitude = 0

  (0...gains.length).each do |point|
    current_altitude += gains[point]

    max_altitude = [max_altitude, current_altitude].max
  end

  max_altitude
end

gains = [-5, 1, 5, 0, -7]

Benchmark.bm do |x|
  x.report('largest_altitude:') { largest_altitude(gains) }
  x.report('largest_altitude_using_inject:') { largest_altitude_using_inject(gains) }
  x.report('largest_altitude_initial_attempt:') { largest_altitude_initial_attempt(gains) }
end

#                                      user       system      total      real
# largest_altitude:                   0.000015   0.000004   0.000019 (0.000013)
# largest_altitude_using_inject:      0.000024   0.000002   0.000026 (0.000024)
# largest_altitude_initial_attempt:   0.000008   0.000001   0.000009 (0.000009)
