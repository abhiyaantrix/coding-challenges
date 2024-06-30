import arrayRotationCount from '../src/array_rotation_count';

describe('arrayRotationCount', () => {
  const testCases: [number[], number][] = [
    [[], -1],
    [[1], 0],
    [[1, 2], 0],
    [[2, 1], 1],
    [[1, 2, 3, 4, 5, 6, 7], 0],
    [[7, 1, 2, 3, 4, 5, 6], 1],
    [[6, 7, 1, 2, 3, 4, 5], 2],
    [[5, 6, 7, 1, 2, 3, 4], 3],
    [[4, 5, 6, 7, 1, 2, 3], 4],
    [[3, 4, 5, 6, 7, 1, 2], 5],
    [[2, 3, 4, 5, 6, 7, 1], 6],
  ];

  testCases.forEach(([array, rotation]) => {
    test(`returns correct number of rotations for ${array} as ${rotation}`, () => {
      expect(arrayRotationCount({ array })).toEqual(rotation);
    });
  });
});
