import TreeNode from '../data_structures/tree_node';

// Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on
// Return the smallest level x such that the sum of all the values of nodes at level x is maximal
// https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(n)
// Space complexity: O(n)

// @param {TreeNode} root
// @return {Integer}
// Example:
// Input: root = [1,7,0,7,-8,null,null]
// Output: 2
const maxLevelSum = (root: TreeNode | null): number => {
  if (root === null) return -1;

  if (root.left === null && root.right === null) {
    return 1;
  }

  let currentLevel = 0;
  let maxSumLevel = 1;
  let maxSum = Number.NEGATIVE_INFINITY;

  const queue = [root];

  while (queue.length > 0) {
    currentLevel += 1;
    let currentSum = 0;

    const queueLength = queue.length;

    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for (let i = 0; i < queueLength; i++) {
      const node = queue.shift();

      if (!node) continue;

      currentSum += node.val;

      if (node.left) queue.push(node.left);

      if (node.right) queue.push(node.right);
    }

    if (currentSum > maxSum) {
      maxSumLevel = currentLevel;

      maxSum = currentSum;
    }
  }

  return maxSumLevel;
};

export { maxLevelSum };
