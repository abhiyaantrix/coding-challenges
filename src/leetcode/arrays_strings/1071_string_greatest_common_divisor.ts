// LeetCode 75

const isDivisible = (str: string, devisor: string): boolean => {
  if (str.length % devisor.length !== 0) return false;

  return str === devisor.repeat(str.length / devisor.length);
};

// Euclidean algorithm to efficiently find GCD of two numbers
// GCD of two numbers also divides their difference, that's why keep using modulo until remainder is reduced to zero
// Which will give the largest possible common devisor
const computeGCD = (largerNum: number, smallerNum: number): number => {
  let current = largerNum;
  let remainder = smallerNum;

  while (remainder) {
    [current, remainder] = [remainder, current % remainder];
  }

  return current;
};

type GCDOfStrings = (largerString: string, smallerString: string) => string;

const gcdOfStrings: GCDOfStrings = (largerString: string, smallerString: string): string => {
  const lengthLarger = largerString.length;
  const lengthSmaller = smallerString.length;

  const lengthGCD = computeGCD(lengthLarger, lengthSmaller);

  const candidate = largerString.slice(0, lengthGCD);

  if (isDivisible(largerString, candidate) && isDivisible(smallerString, candidate)) {
    return candidate;
  }

  return '';
};

export { gcdOfStrings };
