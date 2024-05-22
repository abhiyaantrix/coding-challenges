# frozen_string_literal: true

# A simple Caesar cipher implementation
# Example:
#   Factorial.new.factorial_of(5)
#   => 120
class Factorial

  ZERO_FACTORIAL = 1
  START_NUMBER = 1

  private_constant :START_NUMBER, :ZERO_FACTORIAL

  def factorial_of(num)
    raise ArgumentError.new("Factorial of negative number #{num} is not supported.") if num.negative?

    return ZERO_FACTORIAL if num.zero?

    (START_NUMBER..num).inject(:*)
  end

end
