# frozen_string_literal: true

# Binary search algorithm to find the index of a number in a sorted array
class BinarySearch

  def initialize(array)
    @array = array
  end

  # Iterative Binary search algorithm to find the index of a number in a sorted array
  # Returns -1 if number is not found in the array
  # Time complexity: O(log n), divide and conquer approach, divide array in half each time
  # Space complexity: O(1)
  # @param [Integer] target The number to search for
  # @param [Symbol] occurrence The occurrence of the target number in the array, either :first or :last
  # @return [Integer] The index of the target number in the array, -1 if not found
  def search_by_iteration(target, occurrence: :first)
    validate_occurrence(occurrence)

    left = 0
    right = array.length - 1

    result = -1

    while left <= right
      mid = compute_mid(left, right)

      if array[mid] == target
        # if occurrence isn't a concern, just return mid
        result = mid
        occurrence == :first ? right = mid - 1 : left = mid + 1
      elsif array[mid] < target
        left = mid + 1
      else
        right = mid - 1
      end
    end

    result
  end

  def search_by_recursion(target, left = 0, right = array.length - 1, occurrence: :first)
    validate_occurrence(occurrence)

    return -1 if left > right

    mid = compute_mid(left, right)

    if array[mid] == target
      handle_occurrence(target, left, mid, right, occurrence)
    elsif array[mid] < target
      search_by_recursion(target, mid + 1, right, occurrence:)
    else
      search_by_recursion(target, left, mid - 1, occurrence:)
    end
  end

  def count_all_occurrences(target)
    first_occurrence = search_by_iteration(target, occurrence: :first)
    last_occurrence = search_by_iteration(target, occurrence: :last)

    return 0 if first_occurrence == -1

    before_first_occurrence = first_occurrence - 1

    last_occurrence - before_first_occurrence
  end

  private

  attr_reader :array

  def validate_occurrence(occurrence)
    return if %i[first last].include?(occurrence)

    raise ArgumentError.new('Invalid occurrence value. Expected :first or :last.')
  end

  def compute_mid(left, right)
    # Avoid integer overflow, using (left + right) / 2 will cause overflow if result is too large
    # Though this is not a big concern in Ruby since it will automatically convert to big integer
    left + ((right - left) / 2)
  end

  def handle_occurrence(target, left, mid, right, occurrence)
    if occurrence == :first
      # if mid is the first element in array
      # or if the previous element is not the target
      return mid if first_occurrence?(mid, target)

      search_by_recursion(target, left, mid - 1, occurrence:)
    else
      # if mid is the last element in array
      # or if the next element is not the target
      return mid if last_occurrence?(mid, target)

      search_by_recursion(target, mid + 1, right, occurrence:)
    end
  end

  def first_occurrence?(mid, target)
    mid.zero? || array[mid - 1] != target
  end

  def last_occurrence?(mid, target)
    mid == array.length - 1 || array[mid + 1] != target
  end

end
