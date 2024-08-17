// LeetCode 75
// https://leetcode.com/problems/find-peak-element/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(log n)
// Space complexity: O(1)

const findPeakElement = (nums: number[]): number => {
  let left = 0;
  let right = nums.length;

  while (left < right) {
    const mid = Math.floor(left + (right - left) / 2);

    const num = nums[mid];
    const rightNum = nums[mid + 1];

    if (num > rightNum) {
      right = mid;
    } else {
      left = mid + 1;
    }
  }

  return left;
};

export default findPeakElement;
