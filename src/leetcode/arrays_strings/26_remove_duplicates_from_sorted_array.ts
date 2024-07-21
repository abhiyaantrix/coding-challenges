// LeetCode Top Interview 150
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150

// Time complexity: O(n)
// Space complexity: O(1)
const removeDuplicates = (nums: number[]): number => {
  if (!nums) return 0;

  length = nums.length;

  if (length === 1) return 1;

  let uniqueNumCount = 1;

  for (let index = 1; index < length; index++) {
    const currentNum = nums[index];
    const lastUniqueNum = nums[uniqueNumCount - 1];

    if (lastUniqueNum === currentNum) continue;

    nums[uniqueNumCount] = currentNum;
    uniqueNumCount++;
  }

  return uniqueNumCount;
};

export default removeDuplicates;
