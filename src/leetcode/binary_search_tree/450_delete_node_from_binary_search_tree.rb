# frozen_string_literal: true

# LeetCode 75

# Given a root node reference of a BST and a key, delete the node with the given key in the BST
# Return the root node reference (possibly updated) of the BST
# Basically, the deletion can be divided into two stages:
# 1. Search for a node to remove
# 2. If the node is found, delete the node
# https://leetcode.com/problems/delete-node-in-a-bst/description/?envType=study-plan-v2&envId=leetcode-75

# Time complexity: O(H) where H is the height of the tree
# Space complexity: O(H) where H is the height of the tree

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
# Example 1:
# Input: root = [5,3,6,2,4,null,7], key = 3
# Output: [5,4,6,2,null,null,7]
# Explanation: Given key to delete is 3. So we find the node with value 3 and delete it
# One valid answer is [5,4,6,2,null,null,7], shown in the above BST
# Another valid answer is [5,2,6,null,4,null,7]
# Example 2:
# Input: root = [5,3,6,2,4,null,7], key = 0
# Output: [5,3,6,2,4,null,7]
# Explanation: The tree does not contain a node with value = 0
def delete_node(root, key)
  return nil if root.nil?

  if key < root.val # case 1: key is smaller than root so must be in left side
    root.left = delete_node(root.left, key)
  elsif key > root.val # case 2: key is greater than root so must be in right side
    root.right = delete_node(root.right, key)
  else # case 3: key == root.val
    # case 3.1: leaf node
    return nil if root.left.nil? && root.right.nil?

    # case 3.2: left child node missing
    return root.right if root.left.nil?

    # case 3.3: right child node missing
    return root = root.left if root.right.nil?

    # case 3.4: both right and left child nodes exist
    # Move smallest value from right to the root
    new_root_val = find_minimum_value(root.right)
    root.val = new_root_val
    # Delete that node from right once its made root
    root.right = delete_node(root.right, new_root_val)
  end

  root
end

def find_minimum_value(node)
  current_node = node

  current_node = current_node.left while current_node.left

  current_node.val
end
