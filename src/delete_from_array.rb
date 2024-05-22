# frozen_string_literal: true

# Delete all instances of an integer value from given array of integers
# without using Ruby inbuilt methods
# Example:
#   DeleteFromArray.all_instances!([1, 2, 3, 4, 5, 3, 6, 7, 3], 3)
#   => [1, 2, 4, 5, 6, 7]
class DeleteFromArray

  # @param [Array<Integer>] nums An array of integers from which all instances of given value to be deleted
  # @param [Integer] Number to be deleted from the given array
  def self.all_instances!(nums, num_to_delete)
    original_length = nums.length

    counter = 0
    insert_index = 0

    while counter < original_length
      if nums[counter] != num_to_delete
        nums[insert_index] = nums[counter]

        insert_index += 1
      end

      counter += 1
    end

    # Actually reduce array size by dropping left over elements from end
    num_of_elms_removed = original_length - insert_index

    nums = nums[0...-num_of_elms_removed] if num_of_elms_removed.positive?

    nums
  end

end
