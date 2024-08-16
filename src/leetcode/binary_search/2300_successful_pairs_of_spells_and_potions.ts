// LeetCode 75
// https://leetcode.com/problems/successful-pairs-of-spells-and-potions/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(log n)
// Space complexity: O(1)

const successfulPairs = (spells: number[], potions: number[], success: number): number[] => {
  const sortedPotions = potions.sort((a, b) => a - b);
  const potionsLength = sortedPotions.length;
  const maxPotion = sortedPotions[potionsLength - 1];

  return spells.map((spell) => {
    const minPotion = Math.ceil(success / spell);

    if (minPotion > maxPotion) {
      return 0;
    }

    const minPotionIndex = binary_search(sortedPotions, minPotion);

    return potionsLength - minPotionIndex;
  });
};

const binary_search = (potions: number[], targetPotion: number): number => {
  let low = 0;
  let high = potions.length;

  while (low < high) {
    const mid = Math.floor(low + (high - low) / 2);

    if (potions[mid] < targetPotion) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }

  return low;
};

export default successfulPairs;
