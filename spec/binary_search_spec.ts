import { binarySearchByIteration, binarySearchByRecursion, countAllOccurrences } from '../src/binary_search';

describe('binarySearch', () => {
  const array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  const arrayWithDuplicates = [1, 2, 3, 4, 4, 5, 6, 7, 7, 7, 8, 9];

  const testCases: {
    array: number[];
    target: number;
    occurrence: 'first' | 'last';
    expected: number;
  }[] = [
    { array, target: 1, occurrence: 'first', expected: 0 },
    { array, target: 2, occurrence: 'first', expected: 1 },
    { array: arrayWithDuplicates, target: 4, occurrence: 'first', expected: 3 },
    { array: arrayWithDuplicates, target: 7, occurrence: 'last', expected: 9 },
    { array, target: 10, occurrence: 'first', expected: -1 },
  ];

  testCases.forEach(({ array, target, occurrence, expected }) => {
    it(`returns ${expected} when searching for the ${occurrence} occurrence of ${target}`, () => {
      expect(binarySearchByIteration(array, target, occurrence)).toEqual(expected);
      expect(binarySearchByRecursion({ array, target, occurrence })).toEqual(expected);
    });
  });

  describe('when counting all occurrences', () => {
    [
      { target: 10, expected_count: 0 },
      { target: 6, expected_count: 1 },
      { target: 4, expected_count: 2 },
      { target: 7, expected_count: 3 },
    ].forEach(({ target, expected_count }) => {
      it(`returns ${expected_count} when counting all occurrences of ${target}`, () => {
        expect(countAllOccurrences(arrayWithDuplicates, target)).toEqual(expected_count);
      });
    });
  });
});
