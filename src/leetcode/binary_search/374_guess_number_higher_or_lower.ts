// LeetCode 75
// https://leetcode.com/problems/guess-number-higher-or-lower/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(log n)
// Space complexity: O(1)

/**
 * Forward declaration of guess API.
 * @param {number} num   your guess
 * @return 	  -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *            otherwise return 0
 * var guess = function(num) {}
 */

const guess = (num: number): number => {
  const picked = 6;

  if (num < picked) {
    return -1;
  } else if (num > picked) {
    return 1;
  } else {
    return 0;
  }
};

const guessNumber = (range: number): number => {
  let left = 0;
  let right = range;

  let pick = 0;

  while (left <= right) {
    pick = left + Math.floor((right - left) / 2);

    const guessCheck = guess(pick);

    if (guessCheck === 0) break;

    if (guessCheck === 1) {
      left = pick + 1;
    } else {
      right = pick - 1;
    }
  }

  return pick;
};

export default guessNumber;
