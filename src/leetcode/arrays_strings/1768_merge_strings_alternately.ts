// LeetCode 75

// Merge Strings Alternately
// https://leetcode.com/problems/merge-strings-alternately/?envType=study-plan-v2&envId=leetcode-75
// You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1
// If a string is longer than the other, append the additional letters onto the end of the merged string
// Return the merged string

// Time complexity: O(Max(Word1.Length,Word2.Length))
// Space complexity: O(1)

// Strategy:
// Iterate through the strings and merge them alternately
// If the strings are of different lengths, append the remaining characters to the merged string
// Return the merged string

// @param {String} word1
// @param {String} word2
// @return {String}
// @example
// merge_strings_alternately('abc', 'pqr') => 'apbqcr'
// merge_strings_alternately('ab', 'pqrs') => 'apbqrs'
// merge_strings_alternately('abcd', 'pq') => 'apbqcd'
const mergeAlternately = (word1: string, word2: string): string => {
  const word1Length = word1.length;
  const word2Length = word2.length;

  const mergedString: string[] = [];

  let word1Pos = 0;
  let word2Pos = 0;

  while (word1Pos < word1Length || word2Pos < word2Length) {
    if (word1Pos < word1Length) {
      mergedString.push(word1[word1Pos]);
      word1Pos++;
    }

    if (word2Pos < word2Length) {
      mergedString.push(word2[word2Pos]);
      word2Pos++;
    }
  }

  return mergedString.join('');
};

// Alternative
// Uses for loop
const mergeAlternatelyForLoop = (word1: string, word2: string): string => {
  const word1Length = word1.length;
  const word2Length = word2.length;

  const length = Math.max(word1Length, word2Length);
  const mergedString: string[] = [];

  for (let pos = 0; pos <= length; pos++) {
    if (pos < word1Length) {
      mergedString.push(word1[pos]);
    }

    if (pos < word2Length) {
      mergedString.push(word2[pos]);
    }
  }

  return mergedString.join('');
};

export { mergeAlternately, mergeAlternatelyForLoop };
