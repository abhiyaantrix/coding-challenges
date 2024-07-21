// LeetCode 75

// Move Zeroes to End
// https://leetcode.com/problems/move-zeroes/?envType=study-plan-v2&envId=leetcode-75
// Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements
// Note that you must do this in-place without making a copy of the array

// Time complexity: O(n), where n is the length of the array
// Space complexity: O(1)

// Strategy:
// Use a two-pointer approach to move all the non-zero elements to the beginning of the array
// Initialize a pointer to keep track of the position where the next non-zero element should be placed
// Iterate through the array and if the current element is non-zero, move it to the position pointed by the pointer
// Move all the remaining elements to the end of the array
// Return the modified array

// @param {Integer[]} nums
// @return {Void} Do not return anything, modify nums in-place instead.
// @example
// move_zeroes_to_end([0,1,0,3,12]) => [1,3,12,0,0]
// move_zeroes_to_end([0]) => [0]
// move_zeroes_to_end([1,2,3,4,5]) => [1,2,3,4,5]
// move_zeroes_to_end([0,0,0,0,0]) => [0,0,0,0,0]
const moveZeroesToEnd = (nums: number[]): number[] => {
  let nonZeroSwapPos = 0;

  nums.forEach((num) => {
    if (num !== 0) {
      nums[nonZeroSwapPos] = num;

      nonZeroSwapPos++;
    }
  });

  for (let index = nonZeroSwapPos; index < nums.length; index++) {
    nums[index] = 0;
  }

  return nums;
};

export { moveZeroesToEnd };
