// LeetCode 75
// https://leetcode.com/problems/determine-if-two-strings-are-close/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(n)
// Space complexity: O(1)

const closeStrings = (word1: string, word2: string): boolean => {
  if (word1 === word2) return true;

  if (word1.length !== word2.length) return false;

  const word1Occurrences = word1.split('').reduce<Record<string, number>>((acc, char) => {
    acc[char] = (acc[char] ?? 0) + 1;

    return acc;
  }, {});

  const word2Occurrences = word2.split('').reduce<Record<string, number>>((acc, char) => {
    acc[char] = (acc[char] ?? 0) + 1;

    return acc;
  }, {});

  const word1OccurrencesKeys = Object.keys(word1Occurrences).sort().join('');
  const word2OccurrencesKeys = Object.keys(word2Occurrences).sort().join('');

  const word1OccurrencesValues = Object.values(word1Occurrences)
    .sort((a, b) => a - b)
    .join('');
  const word2OccurrencesValues = Object.values(word2Occurrences)
    .sort((a, b) => a - b)
    .join('');

  return word1OccurrencesKeys === word2OccurrencesKeys && word1OccurrencesValues === word2OccurrencesValues;
};

export default closeStrings;
