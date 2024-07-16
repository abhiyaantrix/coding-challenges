# frozen_string_literal: true

# Given the root of a binary tree, imagine yourself standing on the right side of it,
# return the values of the nodes you can see ordered from top to bottom.
# https://leetcode.com/problems/binary-tree-right-side-view/description/?envType=study-plan-v2&envId=leetcode-75

# Strategy:
# 1. Traverse the tree level by level
# 2. For each level, add the rightmost node to the result array
# 3. Return the result array

# Time complexity: O(n)
# Space complexity: O(n)

# @param {TreeNode} root
# @return {Integer[]}
# Example:
# Input: root = [1,2,3,null,5,null,4]
# Output: [1,3,4]
# Explanation:
# 1 => 3 => 4
def right_side_view(root)
  return [] if root.nil?

  right_view = []

  queue = [root]

  node = root

  until queue.empty?
    queue.length.times do
      node = queue.shift

      queue << node.left if node.left
      queue << node.right if node.right
    end

    right_view << node.val
  end

  right_view
end
