// LeetCode 75

// Container With Most Water
// https://leetcode.com/problems/container-with-most-water/?envType=study-plan-v2&envId=leetcode-75
// Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai)
// n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0)
// Find two lines, which, together with the x-axis forms a container, such that the container contains the most water
// Notice that you may not slant the container

// Time complexity: O(n)
// Space complexity: O(1)

// Strategy:
// Use two pointers to find the maximum area of the container
// Initialize the first and second boundary to the first and last index of the height array
// Iterate through the height array and calculate the area of the container formed by the two boundaries
// Update the maximum area if the current area is greater than the maximum area
// Move the boundary with the smaller height towards the other boundary
// Return the maximum area

// @param {Integer[]} height
// @return {Integer}
// @example
// max_area([1,8,6,2,5,4,8,3,7]) => 49
// max_area([1,1]) => 1
// max_area([4,3,2,1,4]) => 16
// max_area([1,2,1]) => 2
const maxArea = (height: number[]): number => {
  let maxArea = 0;

  let firstBoundary = 0;
  let secondBoundary = height.length - 1;

  let firstBoundHeight = 0;
  let secondBoundHeight = 0;

  while (secondBoundary > firstBoundary) {
    firstBoundHeight = height[firstBoundary];
    secondBoundHeight = height[secondBoundary];

    const area = (secondBoundary - firstBoundary) * Math.min(secondBoundHeight, firstBoundHeight);
    maxArea = Math.max(maxArea, area);

    if (firstBoundHeight < secondBoundHeight) {
      firstBoundary++;
    } else {
      secondBoundary--;
    }
  }

  return maxArea;
};

export { maxArea };
