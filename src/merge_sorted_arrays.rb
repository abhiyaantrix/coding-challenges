# frozen_string_literal: true

# Merge two sorted array without using inbuilt Ruby sorting methods
# Consider only ascending sorting order
# Example:
#   MergeSortedArrays.merge([1, 3, 5, 7, 9], [2, 4, 6, 8])
#   => [1, 2, 3, 4, 5, 6, 7, 8, 9]
class MergeSortedArrays

  # @param [Array<Integer>] larger_arr Sorted array of integers, must be larger in size than second argument
  # @param [Array<Integer>] smaller_arr Sorted array of integers, must be smaller in size than first argument
  # @return [Array<Integer>] Combined sorted array
  def self.merge(larger_arr, smaller_arr)
    merged = []

    larger_arr_counter = 0
    smaller_arr_counter = 0
    insert_index = 0

    while larger_arr_counter < larger_arr.length
      # Break if smaller_arr has been exhausted
      # Add remaining elements from larger_arr to result since they are already sorted
      if smaller_arr_counter == smaller_arr.length
        merged.push(*larger_arr[larger_arr_counter...larger_arr.length])
        break
      end

      # Add element from either arr in ascending sorting order
      if larger_arr[larger_arr_counter] < smaller_arr[smaller_arr_counter]
        merged[insert_index] = larger_arr[larger_arr_counter]
        larger_arr_counter += 1
      else
        merged[insert_index] = smaller_arr[smaller_arr_counter]
        smaller_arr_counter += 1
      end

      insert_index += 1
    end

    merged
  end

end
