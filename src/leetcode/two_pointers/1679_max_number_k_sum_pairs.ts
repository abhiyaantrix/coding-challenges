// LeetCode 75

// Given an array of integers nums and an integer targetSum, return the maximum number of index-pairs (i, j) such that i < j and nums[i] + nums[j] == targetSum.
// https://leetcode.com/problems/max-number-of-targetSum-sum-pairs/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(nlogn)
// Space complexity: O(1)

// Strategy:
// 1. Sort the array
// 2. Use two pointers to find the sum of the two numbers
// 3. If the sum is equal to targetSum, increment the operations count and move the pointers
// 4. If the sum is less than targetSum, move the start pointer
// 5. If the sum is greater than targetSum, move the end pointer
// 6. Return the operations count

// @param {Integer[]} nums
// @param {Integer} targetSum
// @return {Integer}
const maxOperations = (nums: number[], targetSum: number) => {
  nums.sort((a, b) => a - b);

  let startPointer = 0;
  let endPointer = nums.length - 1;

  let operations = 0;

  while (startPointer < endPointer) {
    const endValue = nums[endPointer];
    const startValue = nums[startPointer];

    if (endValue > targetSum) {
      endPointer--;

      continue;
    }

    const sum = startValue + endValue;

    if (sum === targetSum) {
      operations++;
      startPointer++;
      endPointer--;
    } else if (sum < targetSum) {
      startPointer++;
    } else {
      endPointer--;
    }
  }

  return operations;
};

// Time complexity: O(n)
// Space complexity: O(n)

// Strategy:
// 1. Create a hash map with the frequency of each number
// 2. Iterate through the array
// 3. Calculate the compliment of the number
// 4. If the compliment is present in the hash map, decrement the frequency of the compliment and increment the operations count
// 5. If the compliment is not present in the hash map, increment the frequency of the number
// 6. Return the operations count

// @param {Integer[]} nums
// @param {Integer} targetSum
// @return {Integer}
const maxOperationsHashMap = (nums: number[], targetSum: number): number => {
  const map = new Map<number, number>();

  let operations = 0;

  nums.forEach((num) => {
    const complement = targetSum - num;

    const numCount = map.get(num) ?? 0;
    const complementCount = map.get(complement) ?? 0;

    if (complementCount > 0) {
      map.set(complement, complementCount - 1);
      operations++;
    } else {
      map.set(num, numCount + 1);
    }
  });

  return operations;
};

export { maxOperations, maxOperationsHashMap };
