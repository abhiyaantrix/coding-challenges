# frozen_string_literal: true

# Given a binary array, find maximum number of consecutive 1's in the array
# Example:
#   MaxConsecutiveOnes.find([1, 1, 0, 1, 1, 1])
#   => 3
class MaxConsecutiveOnes

  def self.find(arr)
    max = 0
    count = 0

    arr.each do |n|
      if n.zero?
        count = 0
        next
      end

      count += 1
      max = count if count > max
    end

    max
  end

end
