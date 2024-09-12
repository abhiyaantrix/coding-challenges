# frozen_string_literal: true

require_relative '../../src/random_challenges/numbers_with_even_number_of_digits'

describe NumbersWithEvenNumberOfDigits do
  subject(:numbers_with_even_number_of_digits) { ->(nums) { described_class.count(nums) } }

  [
    [[833, 69, 5505, 2, 942, 29, 725], 3],
    [[4, 464, 54, 1402, 0], 2]
  ].each do |nums, expected_result|
    it "finds #{expected_result} numbers with even number of digits in #{nums}" do
      expect(numbers_with_even_number_of_digits.call(nums)).to eq(expected_result)
    end
  end
end
