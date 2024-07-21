# frozen_string_literal: true

# Find the number of times a sorted array has been rotated
# Assuming that the array does not contain duplicates
# Time complexity: O(log n), binary search approach
# Space complexity: O(1)
# @param [Array<Integer>] array The sorted array
# @return [Integer] The number of times the array has been rotated
# @example
#  ArrayRotationCount.new([4, 5, 6, 7, 0, 1, 2]).count_rotations
# => 3
# ArrayRotationCount.new([1, 2, 3, 4, 5, 6, 7]).count_rotations
# => 0
# ArrayRotationCount.new([7, 1, 2, 3, 4, 5, 6]).count_rotations
# => 1

# Strategy: with binary search, find the pivot element, which is the smallest element in the array
# The number of rotations is the index of the pivot element
# If the array is sorted, the pivot element is the first element
# If the array is rotated, the pivot element is the smallest element in the array
# The pivot element is the only element in the array that is smaller than its neighbors
class ArrayRotationCount

  attr_reader :array

  def initialize(array)
    @array = array
  end

  def count_rotations(left = 0, right = array.length - 1)
    array_length = array.length

    while left <= right
      right_most_value = array[right]
      left_most_value = array[left]

      # If array is not rotated the left most element is guaranteed to be the smallest
      # As soon as it is rotated the last biggest element becomes the first element
      # Original: 1 2 3 4 5 6 7
      # Rotated: 7 1 2 3 4 5 6
      return left if left_most_value <= right_most_value

      # Calculate the mid index, next and previous to mid index
      mid = left + ((right - left) / 2)
      prev_index = (mid + array_length - 1) % array_length
      next_index = (mid + 1) % array_length
      # Modulo operator is used to handle the case where mid is the last element in the array
      # In that case, next_index will be the first element in the array

      # Get actual values
      mid_value = array[mid]
      prev_value = array[prev_index]
      next_value = array[next_index]

      if mid_value <= prev_value && mid_value <= next_value
        # If mid is smaller than its neighbors, it is guaranteed to be the pivot element
        return mid
      elsif mid_value <= right_most_value
        # If mid is smaller than right most element, the pivot element is on the left side
        # 1 2 3 4 5 6 7
        # 6 7 1 2 3 4 5
        right = mid - 1
      elsif mid_value >= left_most_value
        # If mid is greater than left, the pivot element is on the right side
        # 1 2 3 4 5 6 7
        # 4 5 6 7 1 2 3
        left = mid + 1
      end
    end

    # No pivot element is found
    -1
  end

end
