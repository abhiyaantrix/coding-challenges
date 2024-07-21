const rotateArray = (array: string[], shift: number): string[] => {
  const arrayLength = array.length;

  // const rotatedArray = Array(arrayLength).fill(''); // fixed size array
  const rotatedArray = [];

  for (let i = 0; i < arrayLength; i++) {
    const shiftedIndex = (i + shift) % arrayLength;

    rotatedArray[shiftedIndex] = array[i];
  }

  return rotatedArray;
};

const caesarDictionary = (keyArray: string[], valueArray: string[]): Record<string, string> => {
  const targetLength = keyArray.length;

  const dictionary: Record<string, string> = {};

  for (let i = 0; i < targetLength; i++) {
    const key = keyArray[i];
    dictionary[key] = valueArray[i];
  }

  return dictionary;
};

const charRange = (start: string, end: string): string[] => {
  const characters: string[] = [];

  let startCharCode = start.charCodeAt(0);
  const endCharCode = end.charCodeAt(0);

  while (startCharCode <= endCharCode) {
    characters.push(String.fromCharCode(startCharCode));
    startCharCode++;
  }

  return characters;
};

const buildLetters = () => [...charRange('a', 'z'), ...charRange('A', 'Z'), ...charRange('0', '9'), ' '];

const encode = (text: string, shift: number): string => {
  const letters = buildLetters();

  const rotatedLetters = rotateArray(letters, shift);
  const encodedDictionary = caesarDictionary(letters, rotatedLetters);

  return text
    .split('')
    .map((character) => encodedDictionary[character])
    .join('');
};
const decode = (text: string, shift: number): string => {
  const letters = buildLetters();

  if (shift > letters.length) {
    throw new Error('Shift value is greater than the length of the letters.');
  }

  const rotatedLetters = rotateArray(letters, shift);
  const decodedDictionary = caesarDictionary(rotatedLetters, letters);

  return text
    .split('')
    .map((character) => decodedDictionary[character])
    .join('');
};

export { encode, decode };
