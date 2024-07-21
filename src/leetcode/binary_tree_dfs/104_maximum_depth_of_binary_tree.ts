// LeetCode 75

import TreeNode from '../../data_structures/tree_node';

// Given a binary tree, find its maximum depth
// https://leetcode.com/problems/maximum-depth-of-binary-tree/description/?envType=study-plan-v2&envId=leetcode-75
// The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node
// Note: A leaf is a node with no children

// Strategy:
// 1. Recursively go to the bottom of each node
// 4. If the node is nil, return 0
// 5. If the node has no children, return 1
// 6. If the node has children, recursively go to the bottom of each node and add +1 to depth
// 7. Return the max depth of left and right nodes + 1 for the current node
// which will accumulate to be depth relative to the current node

// Time complexity is O(n) where n is the number of nodes in the tree
// Space complexity is O(n) where n is the number of nodes in the tree (recursive stack)

// @param {TreeNode} root
// @return {Integer}
// Example:
// Input: root = [3,9,20,null,null,15,7]
// Output: 3, 3 => 20 => 15,7
const maxDepthRecursiveDFS = (root: TreeNode | null): number => {
  if (root === null) return 0;

  if (root.left === null && root.right === null) return 1;

  // Recursively got to the bottom of each node
  // For each node add +1 to depth, which will accumulate to be depth relative to the current node
  const leftNodeDepth = maxDepthRecursiveDFS(root.left);
  const rightNodeDepth = maxDepthRecursiveDFS(root.right);

  return Math.max(leftNodeDepth, rightNodeDepth) + 1; // +1 for current node
};

// Strategy:
// 1. Use a queue to keep track of the nodes
// 2. Add the root node to the queue
// 3. Until the queue is empty, remove the current node from the queue
// 4. If the current node is not nil, add the left and right nodes to the queue
// 5. Repeat the process until the queue is empty
// 6. Increment the depth by 1 for each level
// 7. Return the depth

// Time complexity is O(n) where n is the number of nodes in the tree
// Space complexity is O(n) where n is the number of nodes in the tree
const maxDepthBFS = (root: TreeNode | null): number => {
  if (root === null) return 0;

  if (root.left === null && root.right === null) return 1;

  let depth = 0;
  const queue = [root];

  while (queue.length > 0) {
    depth++;

    const queueLength = queue.length;

    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for (let i = 0; i < queueLength; i++) {
      const node = queue.shift(); // remove current node

      // Add all child nodes in level to queue to process in next iteration
      if (node?.left) queue.push(node.left);

      if (node?.right) queue.push(node.right);
    }
  }

  return depth;
};

const maxDepthOneLiner = (root: TreeNode | null): number => {
  return root !== null ? Math.max(maxDepthOneLiner(root?.left), maxDepthOneLiner(root?.right)) + 1 : 0;
};

export { maxDepthRecursiveDFS, maxDepthBFS, maxDepthOneLiner };
