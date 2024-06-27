type occurrence = 'first' | 'last';

type BinarySearchByIteration = (array: number[], target: number, occurrence?: occurrence) => number;

type BinarySearchByRecursion = (options: {
  array: number[];
  target: number;
  left?: number;
  right?: number;
  occurrence?: occurrence;
}) => number;

type CountAllOccurrences = (array: number[], target: number) => number;

const computeMid = (left: number, right: number): number => {
  // Avoid integer overflow, using (left + right) / 2 will cause overflow if result is too large
  // Though this is not a big concern in Ruby since it will automatically convert to big integer
  return Math.floor(left + (right - left) / 2);
};

// Iterative Binary search algorithm to find the index of a number in a sorted array
// Returns -1 if number is not found in the array
// Time complexity: O(log n), divide and conquer approach, divide array in half each time
// Space complexity: O(1)
// param array: sorted array of numbers
// param target: number to find in the array
// param occurrence: 'first' or 'last', if the target number is found multiple times in the array
// return: index of the target number in the array, -1 if not found
const binarySearchByIteration: BinarySearchByIteration = (array, target, occurrence = 'first') => {
  let left = 0;
  let right = array.length - 1;

  let result = -1;

  while (left <= right) {
    const mid = computeMid(right, left);

    if (array[mid] === target) {
      // Avoid integer overflow, using (left + right) / 2 will cause overflow if result is too large
      // Though this is not a big concern in Ruby since it will automatically convert to big integer
      result = mid;
      occurrence === 'first' ? (right = mid - 1) : (left = mid + 1);
    } else if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return result;
};

const binarySearchByRecursion: BinarySearchByRecursion = ({
  array,
  target,
  left = 0,
  right = array.length - 1,
  occurrence = 'first',
}) => {
  let result = -1;

  if (left > right) return result;

  const mid = computeMid(right, left);

  if (array[mid] === target) {
    if (occurrence === 'first') {
      if (mid === 0 || array[mid - 1] !== target) return mid;

      result = binarySearchByRecursion({ array, target, left, right: mid - 1, occurrence });
    } else {
      if (mid === array.length - 1 || array[mid + 1] !== target) return mid;

      result = binarySearchByRecursion({ array, target, left: mid + 1, right, occurrence });
    }
  } else if (array[mid] < target) {
    result = binarySearchByRecursion({ array, target, left: mid + 1, right, occurrence });
  } else {
    result = binarySearchByRecursion({ array, target, left, right: mid - 1, occurrence });
  }

  return result;
};

const countAllOccurrences: CountAllOccurrences = (array, target) => {
  const firstOccurrence = binarySearchByIteration(array, target, 'first');
  const lastOccurrence = binarySearchByIteration(array, target, 'last');

  if (firstOccurrence === -1) return 0;

  const beforeFirstOccurrence = firstOccurrence - 1;

  return lastOccurrence - beforeFirstOccurrence;
};

export { binarySearchByIteration, binarySearchByRecursion, countAllOccurrences };
