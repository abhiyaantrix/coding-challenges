# frozen_string_literal: true

require_relative '../../src/random_challenges/factorial'

describe Factorial do
  subject(:calculator) { described_class.new }

  context 'when non-zero positive number' do
    [[5, 120], [8, 40_320], [13, 6_227_020_800], [20, 2_432_902_008_176_640_000]].each do |number, factorial|
      it "calculates factorial of #{number}" do
        expect(calculator.factorial_of(number)).to eq(factorial)
      end
    end
  end

  context 'when Zero (0) number' do
    let(:factorial_of_zero) { 1 }

    it 'calculates factorial of 0' do
      expect(calculator.factorial_of(0)).to eq(factorial_of_zero)
    end
  end

  context 'when negative number' do
    let(:negative_number) { rand(-10..-1) }

    it 'raises exception' do
      expect { calculator.factorial_of(negative_number) }.to raise_error(
        an_instance_of(ArgumentError)
          .and(having_attributes(message: "Factorial of negative number #{negative_number} is not supported."))
      )
    end
  end
end
