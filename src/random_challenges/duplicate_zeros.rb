# frozen_string_literal: true

# Duplicate each zero in an array of random numbers while keeping array size same
# Removes last element each time a 0 is duplicated to control array size
# Example:
#   DuplicateZeros.call([1, 0, 2, 3, 0, 4, 5, 0])
#   => [1, 0, 0, 2, 3, 0, 0, 4]
class DuplicateZeros

  # @param [Array] arr An array of random numbers including 0's
  # @return [nil] The original array is mutated in-place keeping array size same
  def self.call(arr)
    counter = 0

    while counter < arr.length
      if arr[counter].zero?
        arr.insert(counter, 0)
        arr.pop
        counter += 2
      else
        counter += 1
      end
    end
  end

end
