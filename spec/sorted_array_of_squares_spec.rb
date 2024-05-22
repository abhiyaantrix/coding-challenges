# frozen_string_literal: true

require_relative '../src/sorted_array_of_squares'

describe SortedArrayOfSquares do
  subject(:sorted_array_of_squares) { ->(sorted_nums) { described_class.call(sorted_nums) } }

  [
    [[-4, -1, 0, 3, 10], [0, 1, 9, 16, 100]],
    [[-7, -3, 2, 3, 11], [4, 9, 9, 49, 121]],
    [[-290, -280, -153, -103, 68, 115, 194, 205, 229, 348, 348, 429],
     [4624, 10_609, 13_225, 23_409, 37_636, 42_025, 52_441, 78_400, 84_100, 121_104, 121_104, 184_041]]
  ].each do |sorted_nums, expected_result|
    it "returns a sorted array of squares of integers #{expected_result} in given array #{sorted_nums}" do
      expect(sorted_array_of_squares.call(sorted_nums)).to eq(expected_result)
    end
  end
end
