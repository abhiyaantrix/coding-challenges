# frozen_string_literal: true

# LeetCode 75

# TreeNode => src/leetcode75/data_structures/tree_node.rb

# Given a binary tree, find its maximum depth
# https://leetcode.com/problems/maximum-depth-of-binary-tree/description/?envType=study-plan-v2&envId=leetcode-75
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node
# Note: A leaf is a node with no children

# Strategy:
# 1. Recursively go to the bottom of each node
# 4. If the node is nil, return 0
# 5. If the node has no children, return 1
# 6. If the node has children, recursively go to the bottom of each node and add +1 to depth
# 7. Return the max depth of left and right nodes + 1 for the current node
# which will accumulate to be depth relative to the current node

# Time complexity is O(n) where n is the number of nodes in the tree
# Space complexity is O(n) where n is the number of nodes in the tree (recursive stack)

# @param {TreeNode} root
# @return {Integer}
# Example:
# Input: root = [3,9,20,null,null,15,7]
# Output: 3, 3 => 20 => 15,7
def max_depth_recursive_dfs(root)
  return 0 if root.nil?

  return 1 if root.left.nil? && root.right.nil?

  # Recursively got to the bottom of each node
  # For each node add +1 to depth, which will accumulate to be depth relative to the current node
  left_node_depth = max_depth_recursive_dfs(root.left)
  right_node_depth = max_depth_recursive_dfs(root.right)

  [left_node_depth, right_node_depth].max + 1 # +1 for current node
end

# Strategy:
# 1. Use a queue to keep track of the nodes
# 2. Add the root node to the queue
# 3. Until the queue is empty, remove the current node from the queue
# 4. If the current node is not nil, add the left and right nodes to the queue
# 5. Repeat the process until the queue is empty
# 6. Increment the depth by 1 for each level
# 7. Return the depth

# Time complexity is O(n) where n is the number of nodes in the tree
# Space complexity is O(n) where n is the number of nodes in the tree
def max_depth_bfs(root)
  return 0 if root.nil?

  depth = 0
  queue = [root]

  until queue.empty?
    depth += 1
    queue.length.times do
      node = queue.shift # remove current node
      # Add all child nodes in level to queue to process in next iteration
      queue << node.left if node&.left
      queue << node.right if node&.right
    end
  end

  depth
end

def max_depth_one_liner(root)
  root.present? ? 1 + [max_depth_one_liner(root&.left), max_depth_one_liner(root&.right)].max : 0
end
