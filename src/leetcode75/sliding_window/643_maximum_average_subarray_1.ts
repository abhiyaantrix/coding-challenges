// Find the maximum average of a subarray of size targetLength
// https://leetcode.com/problems/maximum-average-subarray-i/description/?envType=study-plan-v2&envId=leetcode-75
// Given an array of integers nums, and an integer targetLength, return the maximum average of a subarray of size targetLength

// Time complexity: O(n), where n is the length of the nums array
// Space complexity: O(1)

// Strategy:
// Use a sliding window to find the maximum average of a subarray of size targetLength
// Initialize the start and end pointers to 0 and targetLength - 1 respectively
// Calculate the sum of the first targetLength elements and set it as the current sum and the max sum
// Iterate through the array and update the current sum by adding the next element and subtracting the first element
// Update the max sum if the current sum is greater than the max sum
// Return the maximum average by dividing the max sum by targetLength

// @param {Integer[]} nums
// @param {Integer} targetLength
// @return {Float}
// @example
// find_max_average([1,12,-5,-6,50,3], 4) => 12.75
// find_max_average([5], 1) => 5.0
// find_max_average([0,4,0,3,2], 1) => 4.0
const findMaxAverage = (nums: number[], targetLength: number): number => {
  const length = nums.length;

  let startPointer = 0;
  let endPointer = targetLength - 1;

  let currentSum = nums.slice(0, targetLength).reduce((acc, value) => acc + value, 0);
  let maxSum = currentSum;

  while (endPointer < length - 1) {
    endPointer++;

    currentSum += nums[endPointer];

    currentSum -= nums[startPointer];

    startPointer++;

    maxSum = Math.max(currentSum, maxSum);
  }

  return maxSum / targetLength;
};

export { findMaxAverage };
