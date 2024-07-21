// LeetCode 75

// Given an array of characters, compress it in-place
// https://leetcode.com/problems/string-compression/?envType=study-plan-v2&envId=leetcode-75
// The length after compression must always be smaller than or equal to the original array
// Every element of the array should be a character (not int) of length 1
// After done modifying the input array in-place, return the new length of the array
// Must do this by modifying the input array in-place with O(1) extra memory

// Time complexity: O(n)
// Space complexity: O(1)

// Strategy:
// Iterate through the array and keep track of the count of the same characters
// If the next character is different, append the character and its count to the compressed string
// Replace the original array with the compressed string and return the length of the compressed string

// @param {Character[]} chars
// @return {Integer}
// @example
// compress(["a","a","b","b","c","c","c"]) => 6
// compress(["a"]) => 1
// compress(["a","b","b","b","b","b","b","b","b","b","b","b","b"]) => 4
const compress = (chars: string[]): number => {
  let charsCount = 0;

  let compressedString = '';

  for (let index = 0; index < chars.length; index++) {
    const currentChar = chars[index];
    const nextChar = chars[index + 1];

    charsCount++;

    if (currentChar === nextChar) {
      continue;
    }

    compressedString += currentChar;

    if (charsCount > 1) {
      compressedString += charsCount.toString();
    }

    charsCount = 0;
  }

  chars.splice(0, chars.length, ...[...compressedString]);

  return chars.length;
};

export { compress };
