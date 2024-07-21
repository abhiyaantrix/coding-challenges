// Trial division algorithm to check if a number is prime
// If a number can be divided by any two numbers a and b
// a x b = n, if a == b => a^2 = n => a = sqrt(n)
// This means if a and b are different, one of them must be less than the square root of n
// Therefore it is sufficient to check up to the square root of the number only
// Time complexity: O(sqrt(n))
// Space complexity: O(1)
const isPrimeByTrailDivision = (num: number): boolean => {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i <= Math.sqrt(num); i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
};

// Prime numbers up to a given limit using trial division algorithm
// Time complexity: O(n sqrt(n))
const primeNumbersByTrailDivision = (limit: number): number[] => {
  const primeNumbers: number[] = [];

  for (let i = 2; i <= limit; i++) {
    if (isPrimeByTrailDivision(i)) {
      primeNumbers.push(i);
    }
  }

  return primeNumbers;
};

// Sieve of Eratosthenes algorithm to generate prime numbers
// Time complexity: O(n log log n)
const primeNumbersBySieveOfEratosthenes = (limit: number): number[] => {
  const primeNumbers: number[] = Array(limit + 1).fill(1);

  primeNumbers[0] = primeNumbers[1] = 0;

  for (let num = 2; num <= limit; num++) {
    if (!primeNumbers[num]) continue;

    let multiple = num ** 2;

    while (multiple <= limit) {
      primeNumbers[multiple] = 0;

      multiple += num;
    }
  }

  return primeNumbers.reduce((acc: number[], isPrime, number) => {
    if (isPrime) acc.push(number);

    return acc;
  }, []);
};

export { isPrimeByTrailDivision, primeNumbersByTrailDivision, primeNumbersBySieveOfEratosthenes };
