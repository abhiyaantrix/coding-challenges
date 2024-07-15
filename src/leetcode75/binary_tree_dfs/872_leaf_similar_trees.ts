import TreeNode from '../data_structures/tree_node';

// 872. Leaf-Similar Trees
// https://leetcode.com/problems/leaf-similar-trees/?envType=study-plan-v2&envId=leetcode-75
// Given the roots of two binary trees, root1 and root2, return true if the leaves of both trees are
// in a similar order (i.e., at the same depth with the same values), otherwise return false.
// A leaf is a node with no children.

// Strategy:
// - Find all leaves of both trees recursively i.e. using DFS
// - Compare the leaves of both trees
// - If the leaves of both trees are the same, return true
// - Otherwise, return false

// - Time complexity: O(n1 + n2), where n1 and n2 are the number of nodes in the first and second trees
// - Space complexity: O(n1 + n2)

// @param {TreeNode} root1
// @param {TreeNode} root2
// @return {Boolean}
// Example:
// Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
// Output: true
// Input: root1 = [1], root2 = [1]
// Output: true
// Input: root1 = [1], root2 = [2]
// Output: false
// Input: root1 = [1,2], root2 = [2,2]
// Output: true
const leafSimilar = (root1: TreeNode, root2: TreeNode): boolean => {
  const tree1Leaves = findLeaves(root1);
  const tree2Leaves = findLeaves(root2);

  return JSON.stringify(tree1Leaves) === JSON.stringify(tree2Leaves);

  // return tree1Leaves.length === tree2Leaves.length && tree1Leaves.every((value, index) => value === tree2Leaves[index]);
};

const findLeaves = (root: TreeNode | null, leaves: number[] = []): number[] => {
  if (root === null) return leaves;

  if (root.left === null && root.right === null) {
    leaves.push(root.val);
  } else {
    findLeaves(root.left, leaves);
    findLeaves(root.right, leaves);
  }

  return leaves;
};

export { leafSimilar };
