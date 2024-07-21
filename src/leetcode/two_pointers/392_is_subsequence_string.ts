// LeetCode 75

// Is Subsequence String
// https://leetcode.com/problems/is-subsequence/?envType=study-plan-v2&envId=leetcode-75
// Given two strings str and target, return true if str is a subsequence of target, or false otherwise
// A subsequence of a string is a new string that is formed from the original string by deleting some (can be none)
// of the characters without disturbing the relative positions of the remaining characters
// (i.e., "ace" is a subsequence of "abcde" while "aec" is not)

// Time complexity: O(n), where n is the length of the target string
// Space complexity: O(1)

// Strategy:
// Use two pointers to check if the characters in the string are present in the target string
// Initialize the pointers to the start of the string and target string
// Iterate through the target string and if the characters at the pointers are the same, move the string pointer
// Return true if the string pointer reaches the end of the string, otherwise return false

// @param {String} str
// @param {String} target
// @return {Boolean}
// @example
// is_subsequence('abc', 'ahbgdc') => true
// is_subsequence('axc', 'ahbgdc') => false
// is_subsequence('abc', 'ahbgdc') => true
// is_subsequence('abc', 'ahbgdc') => true
const isSubsequenceString = (str: string, target: string): boolean => {
  let strPointer = 0;
  let targetPointer = 0;

  while (targetPointer < target.length) {
    if (strPointer < str.length && str[strPointer] == target[targetPointer]) {
      strPointer += 1;
    }

    targetPointer += 1;
  }

  return strPointer == str.length;
};

// with for loop

const isSubsequenceStringForLoop = (str: string, target: string): boolean => {
  let strPointer = 0;

  for (const targetChar of target) {
    if (strPointer < str.length && str[strPointer] === targetChar) {
      strPointer++;
    }
  }

  return strPointer == str.length;
};

export { isSubsequenceString, isSubsequenceStringForLoop };
