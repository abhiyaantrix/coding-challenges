# frozen_string_literal: true

# Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on
# Return the smallest level x such that the sum of all the values of nodes at level x is maximal
# https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(n)
# Space complexity: O(n)

# @param {TreeNode} root
# @return {Integer}
# Example:
# Input: root = [1,7,0,7,-8,null,null]
# Output: 2
def max_level_sum(root)
  return -1 if root.nil?

  current_level = 0
  max_sum_level = 1
  max_sum = -Float::INFINITY

  queue = [root]

  until queue.empty?
    puts "queue: #{queue.map(&:val)}"
    current_level += 1
    current_sum = 0

    queue.length.times do
      node = queue.shift

      next if node.nil?

      current_sum += node.val

      queue << node.left if node.left
      queue << node.right if node.right
    end

    next unless current_sum > max_sum

    max_sum_level = current_level

    max_sum = current_sum
  end

  max_sum_level
end
