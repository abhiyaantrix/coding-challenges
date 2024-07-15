# frozen_string_literal: true

# TreeNode => src/leetcode75/data_structures/tree_node.rb

# 872. Leaf-Similar Trees
# https://leetcode.com/problems/leaf-similar-trees/?envType=study-plan-v2&envId=leetcode-75
# Given the roots of two binary trees, root1 and root2, return true if the leaves of both trees are
# in a similar order (i.e., at the same depth with the same values), otherwise return false.
# A leaf is a node with no children.

# Strategy:
# - Find all leaves of both trees recursively i.e. using DFS
# - Compare the leaves of both trees
# - If the leaves of both trees are the same, return true
# - Otherwise, return false

# - Time complexity: O(n1 + n2), where n1 and n2 are the number of nodes in the first and second trees
# - Space complexity: O(n1 + n2)

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
# Example:
# Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
# Output: true
# Input: root1 = [1], root2 = [1]
# Output: true
# Input: root1 = [1], root2 = [2]
# Output: false
# Input: root1 = [1,2], root2 = [2,2]
# Output: true
def leaf_similar(root1, root2)
  return true if root1.nil? && root2.nil?

  return false if root1.nil? || root2.nil?

  tree1_leaves = find_leaves(root1)
  tree2_leaves = find_leaves(root2)

  tree1_leaves == tree2_leaves
end

def find_leaves(root, leaves = [])
  return if root.nil?

  if root.left.nil? && root.right.nil?
    leaves << root.val
  else
    find_leaves(root.left, leaves)
    find_leaves(root.right, leaves)
  end

  leaves
end
