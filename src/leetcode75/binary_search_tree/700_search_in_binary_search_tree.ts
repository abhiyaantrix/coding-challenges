import TreeNode from '../data_structures/tree_node';

// Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's
// value equals the given value
// Return the subtree rooted with that node. If such node doesn't exist, you should return NULL
// https://leetcode.com/problems/search-in-a-binary-search-tree/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(n)
// Space complexity: O(n)

// @param {TreeNode} root
// @param {Integer} val
// @return {TreeNode}
// Example:
// Input: root = [4,2,7,1,3], val = 2
// Output: [2,1,3]
// Explanation: There is no node with value 2, but there is a node with value 1 and 3
// Return the subtree rooted with the node with value 2

const searchBST = (root: TreeNode | null, val: number): TreeNode | null => {
  if (root === null) return null;

  if (root.val === val) return root;

  return root.val > val ? searchBST(root.left, val) : searchBST(root.right, val);
};

export { searchBST };
