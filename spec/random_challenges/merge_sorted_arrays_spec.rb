# frozen_string_literal: true

require_relative '../../src/random_challenges/merge_sorted_arrays'

describe MergeSortedArrays do
  subject(:merge_sorted_array) { ->(larger_arr, smaller_arr) { described_class.merge(larger_arr, smaller_arr) } }

  let(:larger_arr) { [-4, -1, 1, 2, 4, 7, 9, 10] }
  let(:smaller_arr) { [-1, 0, 2, 3, 5, 8, 9] }
  let(:expected_merged_arr) { [-4, -1, -1, 0, 1, 2, 2, 3, 4, 5, 7, 8, 9, 9, 10] }

  it 'returns new sorted array as combination of given sorted arrays' do
    expect(merge_sorted_array.call(larger_arr, smaller_arr)).to eq(expected_merged_arr)
  end
end
