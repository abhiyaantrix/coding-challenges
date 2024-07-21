# frozen_string_literal: true

# Find how many numbers have even number of digits
# Example:
#   NumbersWithEvenNumberOfDigits.count([12, 345, 2, 6, 7896])
#   => 2
class NumbersWithEvenNumberOfDigits

  def self.count(nums)
    nums.count { |num| num.digits.length.even? }
  end

end
