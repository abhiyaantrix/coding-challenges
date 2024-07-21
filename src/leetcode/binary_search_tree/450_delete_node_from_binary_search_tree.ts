// LeetCode 75

import TreeNode from '../../data_structures/tree_node';

const findMinimumValue = (node: TreeNode): number => {
  let current_node = node;

  while (current_node.left) {
    current_node = current_node.left;
  }

  return current_node.val;
};

// Given a root node reference of a BST and a key, delete the node with the given key in the BST
// Return the root node reference (possibly updated) of the BST
// Basically, the deletion can be divided into two stages:
// 1. Search for a node to remove
// 2. If the node is found, delete the node
// https://leetcode.com/problems/delete-node-in-a-bst/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(H) where H is the height of the tree
// Space complexity: O(H) where H is the height of the tree

// @param {TreeNode} root
// @param {Integer} key
// @return {TreeNode}
// Example 1:
// Input: root = [5,3,6,2,4,null,7], key = 3
// Output: [5,4,6,2,null,null,7]
// Explanation: Given key to delete is 3. So we find the node with value 3 and delete it
// One valid answer is [5,4,6,2,null,null,7], shown in the above BST
// Another valid answer is [5,2,6,null,4,null,7]
// Example 2:
// Input: root = [5,3,6,2,4,null,7], key = 0
// Output: [5,3,6,2,4,null,7]
// Explanation: The tree does not contain a node with value = 0
const deleteNode = (root: TreeNode | null, key: number): TreeNode | null => {
  if (root === null) return null;

  if (key < root.val) {
    // case 1: key is smaller than root so must be in left side
    root.left = deleteNode(root.left, key);
  } else if (key > root.val) {
    // case 2: key is greater than root so must be in right side
    root.right = deleteNode(root.right, key);
  } else {
    // case 3: key == root.val

    // case 3.1: leaf node
    if (root.left === null && root.right === null) return null;

    // case 3.2: left child node missing
    if (root.left === null) return root.right;

    // case 3.3: right child node missing
    if (root.right === null) return root.left;

    // case 3.4: both right and left child nodes exist
    // Move smallest value from right to the root
    const newRootVal = findMinimumValue(root.right);
    root.val = newRootVal;
    // Delete that root from right once its made root
    root.right = deleteNode(root.right, newRootVal);
  }

  return root;
};

export { deleteNode };
