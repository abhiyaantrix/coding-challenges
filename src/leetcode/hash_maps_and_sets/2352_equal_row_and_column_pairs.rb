# frozen_string_literal: true

# LeetCode 75
# https://leetcode.com/problems/equal-row-and-column-pairs/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(n^2)
# Space complexity: O(n^2)

# @param {Integer[][]} grid
# @return {Integer}
def equal_pairs(grid)
  rows = grid.each_with_object({}).with_index(1) do |(row, hash_map), index|
    hash_map[index] = row
  end

  columns = grid.transpose.each_with_object({}).with_index(1) do |(column, hash_map), index|
    hash_map[index] = column
  end

  equal_pairs_count = 0

  rows.each_value do |row|
    columns.each_value do |column|
      equal_pairs_count += 1 if row == column
    end
  end

  equal_pairs_count
end

def equal_pairs_clean(grid)
  count = 0

  rows = grid.tally

  grid.transpose.each { |col| count += rows[col] if rows[col] }

  count
end

def equal_pairs_optimized(grid)
  count = 0

  row_counts = grid.tally
  # row_counts = Hash.new { |hash, key| hash[key] = 0 }
  # grid.each { |row| row_counts[row] += 1 }

  n = grid.length
  (0...n).each do |col|
    column = Array.new(n) { |row| grid[row][col] }

    count += row_counts[column] if row_counts[column]
  end

  count
end
