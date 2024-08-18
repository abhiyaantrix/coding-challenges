// LeetCode 75
// https://leetcode.com/problems/equal-row-and-column-pairs/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(n^2)
// Space complexity: O(n ^ 2)

const equalPairs = (grid: number[][]): number => {
  let count = 0;

  const rowCounts = grid.reduce((acc, row) => {
    const key = row.join(',');

    acc.set(key, (acc.get(key) ?? 0) + 1);

    return acc;
  }, new Map<string, number>());

  const n = grid.length;

  for (let col = 0; col < n; col++) {
    const column: number[] = [];

    for (let row = 0; row < n; row++) {
      column.push(grid[row][col]);
    }

    const key = column.join(',');

    if (rowCounts.has(key)) {
      count += rowCounts.get(key) || 0;
    }
  }

  return count;
};

export default equalPairs;
