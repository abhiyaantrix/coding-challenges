# frozen_string_literal: true

require_relative '../src/max_consecutive_ones'

describe MaxConsecutiveOnes do
  subject(:find_max_consecutive_ones) { ->(arr) { described_class.find(arr) } }

  [
    [[1, 1, 0, 1, 1, 1], 3],
    [[0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1], 4],
    [[1, 1, 1, 1, 1], 5],
    [[0, 0, 0], 0],
    [[0, 0, 1], 1],
    [[1, 1, 0, 0, 0], 2]
  ].each do |arr, expected_result|
    it "finds correct consecutive 1's #{expected_result} in array #{arr}" do
      expect(find_max_consecutive_ones.call(arr)).to eq(expected_result)
    end
  end
end
