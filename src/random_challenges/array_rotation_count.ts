type ArrayRotationCount = (options: { array: number[] }) => number;

const arrayRotationCount: ArrayRotationCount = ({ array }) => {
  const arrayLength = array.length;

  let left = 0;
  let right = array.length - 1;

  while (left <= right) {
    const leftMostValue = array[left];
    const rightMostValue = array[right];

    // If array is not rotated the left most element is guaranteed to be the smallest
    // As soon as it is rotated the last biggest element becomes the first element
    // Original: 1 2 3 4 5 6 7
    // Rotated: 7 1 2 3 4 5 6
    if (leftMostValue <= rightMostValue) return left;

    // Calculate the mid index, next and previous to mid index
    const mid = Math.floor(left + (right - left) / 2);
    const previousIndex = (mid + arrayLength - 1) % arrayLength;
    const nextIndex = (mid + 1) % arrayLength;
    // Modulo operator is used to handle the case where mid is the last element in the array
    // In that case, next_index will be the first element in the array

    // Get actual values
    const midValue = array[mid];
    const prevValue = array[previousIndex];
    const nextValue = array[nextIndex];

    if (midValue <= prevValue && midValue <= nextValue) {
      // If mid is smaller than its neighbors, it is guaranteed to be the pivot element
      return mid;
    } else if (midValue <= rightMostValue) {
      // If mid is smaller than right most element, the pivot element is on the left side
      // 1 2 3 4 5 6 7
      // 6 7 1 2 3 4 5
      right = mid - 1;
    } else if (midValue >= leftMostValue) {
      // If mid is greater than left, the pivot element is on the right side
      // 1 2 3 4 5 6 7
      // 4 5 6 7 1 2 3
      left = mid + 1;
    }
  }

  // No pivot element is found
  return -1;
};

export default arrayRotationCount;
