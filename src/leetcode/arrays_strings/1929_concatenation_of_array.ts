// LeetCode
// https://leetcode.com/problems/concatenation-of-array/description/

// Time complexity: O(n)
// Space complexity: O(n)

const getConcatenation = (nums: number[]): number[] => {
  // In-built [...nums, ...nums] or .concat or use for loop

  const length = nums.length;

  const doubleLength = length * 2;

  const ans = new Array(doubleLength);

  nums.forEach((num, index) => {
    ans[index] = num;
    ans[length + index] = num;
  });

  return ans;
};

export default getConcatenation;
