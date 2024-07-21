# frozen_string_literal: true

# Given an array of integers sorted in non-decreasing order,
# return an array of the squares of each number, also sorted in non-decreasing order.
# Example:
#   SortedArrayOfSquares.call([-4, -1, 0, 3, 10])
#   => [0, 1, 9, 16, 100]
class SortedArrayOfSquares

  # @param [Array] sorted_nums, An array of integers sorted in ascending order
  # @return [Array], An array of squares of each integer in 'sorted_nums' sorted in ascending order
  def self.call(sorted_nums)
    sorted_nums.map { |num| num**2 }.sort
  end

end
