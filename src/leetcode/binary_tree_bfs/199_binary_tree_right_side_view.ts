// LeetCode 75

import TreeNode from '../../data_structures/tree_node';

// Given the root of a binary tree, imagine yourself standing on the right side of it,
// return the values of the nodes you can see ordered from top to bottom.
// https://leetcode.com/problems/binary-tree-right-side-view/description/?envType=study-plan-v2&envId=leetcode-75

// Strategy:
// 1. Traverse the tree level by level
// 2. For each level, add the rightmost node to the result array
// 3. Return the result array

// Time complexity: O(n)
// Space complexity: O(n)

// @param {TreeNode} root
// @return {Integer[]}
// Example:
// Input: root = [1,2,3,null,5,null,4]
// Output: [1,3,4]
// Explanation:
// 1 => 3 => 4
const rightSideView = (root: TreeNode | null): number[] => {
  if (root === null) return [];

  const rightView: number[] = [];

  const queue: TreeNode[] = [root];

  let node: TreeNode | undefined = root;

  while (queue.length > 0) {
    const queueLength = queue.length;

    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for (let i = 0; i < queueLength; i++) {
      node = queue.shift();

      if (node) {
        if (node.left) queue.push(node.left);

        if (node.right) queue.push(node.right);
      }
    }

    if (node) rightView.push(node.val);
  }

  return rightView;
};

export { rightSideView };
