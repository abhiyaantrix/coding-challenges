import {
  isPrimeByTrailDivision,
  primeNumbersBySieveOfEratosthenes,
  primeNumbersByTrailDivision,
} from '../src/prime_number';

const primeNumbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97];
describe('when prime number', () => {
  [2, 3, 5, 7, 11, 17, 29, 43, 67, 89, 97].forEach((primeNumber) => {
    test(`returns true for prime number ${primeNumber}`, () => {
      expect(isPrimeByTrailDivision(primeNumber)).toBe(true);
    });
  });
});

describe('when not a prime number', () => {
  [0, 1, 4, 6, 8, 9, 10, 12, 24].forEach((primeNumber) => {
    test(`returns false for prime number ${primeNumber}`, () => {
      expect(isPrimeByTrailDivision(primeNumber)).toBe(false);
    });
  });
});

describe('#primeNumbersByTrailDivision', () => {
  test('returns prime numbers up to 100', () => {
    expect(primeNumbersByTrailDivision(100)).toEqual(primeNumbers);
  });
});

describe('#primeNumbersBySieveOfEratosthenes', () => {
  test('returns prime numbers up to 100', () => {
    expect(primeNumbersBySieveOfEratosthenes(100)).toEqual(primeNumbers);
  });
});
