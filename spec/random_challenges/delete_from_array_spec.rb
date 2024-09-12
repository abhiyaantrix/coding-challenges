# frozen_string_literal: true

require_relative '../../src/random_challenges/delete_from_array'

describe DeleteFromArray do
  subject(:delete_from_array) { ->(nums, num_to_delete) { described_class.all_instances!(nums, num_to_delete) } }

  let(:nums) { [0, 1, 2, 2, 3, 0, 4, 2] }
  let(:num_to_delete) { 2 }
  let(:expected_result) { [0, 1, 3, 0, 4] }

  it 'deletes all instances of given number from array' do
    expect(delete_from_array.call(nums, num_to_delete)).to eq(expected_result)
  end
end
