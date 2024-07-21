// LeetCode 75

// Given an array of integers gain, where gain[i] represents the net gain in altitude between points i and i + 1 for all (0 <= i < gain.length),
// return the highest altitude of a point
// A point has the highest altitude if it has the largest altitude
// https://leetcode.com/problems/find-the-highest-altitude/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(n)
// Space complexity: O(1)

/**
 * Find the highest altitude
 * @param gains array of integers
 * @returns the highest altitude
 */
const largestAltitude = (gains: number[] | null) => {
  if (gains === null || gains.length === 0) return 0;

  let currentAltitude = 0;
  let maxAltitude = 0;

  gains.forEach((gain) => {
    currentAltitude += gain;

    maxAltitude = Math.max(maxAltitude, currentAltitude);
  });

  return maxAltitude;
};

export { largestAltitude };
