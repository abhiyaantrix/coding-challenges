# frozen_string_literal: true

require_relative '../../src/random_challenges/array_rotation_count'

describe ArrayRotationCount do
  subject(:array_rotation_count) { ->(array) { described_class.new(array) } }

  [
    [[], -1],
    [[1], 0],
    [[1, 2], 0],
    [[2, 1], 1],
    [[1, 2, 3, 4, 5, 6, 7], 0],
    [[7, 1, 2, 3, 4, 5, 6], 1],
    [[6, 7, 1, 2, 3, 4, 5], 2],
    [[5, 6, 7, 1, 2, 3, 4], 3],
    [[4, 5, 6, 7, 1, 2, 3], 4],
    [[3, 4, 5, 6, 7, 1, 2], 5],
    [[2, 3, 4, 5, 6, 7, 1], 6]
  ].each do |array, rotation|
    it "returns correct number of rotations for #{array} as #{rotation}" do
      expect(array_rotation_count.call(array).count_rotations).to eq(rotation)
    end
  end
end
