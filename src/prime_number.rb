# frozen_string_literal: true

# Prime number checker
# Natural number has no positive divisors other than 1 and itself
class PrimeNumber

  # Trial division algorithm to check if a number is prime
  # If a number can be divided by any two numbers a and b
  # a x b = n, if a == b => a^2 = n => a = sqrt(n)
  # This means if a and b are different, one of them must be less than the square root of n
  # Therefore it is sufficient to check up to the square root of the number only
  # Time complexity: O(sqrt(n))
  # Space complexity: O(1)
  # @return [Boolean] true if the number is prime, false otherwise
  def by_trial_division?(number)
    return false if number < 2

    (2..Math.sqrt(number)).none? { |i| (number % i).zero? }
  end

  # Prime numbers up to a given limit using trial division algorithm
  # Time complexity: O(n sqrt(n))
  # Space complexity: O(n)
  def primes_by_trial_division(limit = 100)
    primes = []
    (2..limit).each do |num|
      primes << num if by_trial_division?(num)
    end
    primes
  end

  # Sieve of Eratosthenes algorithm to generate prime numbers
  # Time complexity: O(n log log n)
  # Space complexity: O(n)
  def primes_by_eratosthenes_sieve(limit = 100)
    primes = Array.new(limit + 1, true)

    primes[0] = primes[1] = false

    (2..Math.sqrt(limit)).each do |num|
      next unless primes[num]

      (num**2).step(limit, num) { |multiple| primes[multiple] = false }
    end

    primes.each_with_index.filter_map { |is_prime, index| index if is_prime }
  end

end
