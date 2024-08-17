// LeetCode 75
// https://leetcode.com/problems/find-the-difference-of-two-arrays/description/?envType=study-plan-v2&envId=leetcode-75

// Time complexity: O(n + m)
// Space complexity: O(n + m)

const findDifference = (nums1: number[], nums2: number[]): number[][] => {
  const nums1Set = new Set(nums1);
  const nums2Set = new Set(nums2);

  const nums1Nums2Diff = [...nums1Set].filter((num) => !nums2Set.has(num));
  const nums2Nums1Diff = [...nums2Set].filter((num) => !nums1Set.has(num));

  return [nums1Nums2Diff, nums2Nums1Diff];
};

export default findDifference;
