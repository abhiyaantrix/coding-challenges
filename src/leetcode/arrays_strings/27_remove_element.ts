// LeetCode Top Interview 150
// https://leetcode.com/problems/remove-element/description/?envType=study-plan-v2&envId=top-interview-150

// Time complexity: O(n)
// Space complexity: O(1)
const removeElement = (nums: number[], val: number): number => {
  if (!nums) return 0;

  let count = 0;

  nums.forEach((num) => {
    if (num !== val) {
      nums[count] = num;
      count++;
    }
  });

  return count;
};

export default removeElement;
