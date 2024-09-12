# frozen_string_literal: true

require_relative '../../src/random_challenges/prime_number'

describe PrimeNumber do
  subject(:prime_number_checker) { described_class.new }

  let(:prime_numbers) do
    [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  end

  context 'when prime' do
    [2, 3, 5, 7, 11, 17, 29, 43, 67, 89, 97].each do |num|
      it "returns true for prime number #{num}" do
        expect(prime_number_checker.by_trial_division?(num)).to be true
      end
    end
  end

  context 'when none prime' do
    [0, 1, 4, 6, 8, 9, 10, 12, 24].each do |num|
      it "returns false for prime number #{num}" do
        expect(prime_number_checker.by_trial_division?(num)).to be false
      end
    end
  end

  describe '#primes_by_trial_division' do
    it 'returns prime numbers up to 100' do
      expect(prime_number_checker.primes_by_trial_division).to eq(prime_numbers)
    end
  end

  describe '#primes_by_eratosthenes_sieve' do
    it 'returns prime numbers up to 100' do
      expect(prime_number_checker.primes_by_eratosthenes_sieve).to eq(prime_numbers)
    end
  end
end
