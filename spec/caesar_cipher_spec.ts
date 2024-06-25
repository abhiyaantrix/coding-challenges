import { encode, decode } from '../src/caesar_cipher';

const testCases = [
  { text: 'Hello World', expectedCipheredText: 'Ebiil7Tloia', shift: 3 },
  { text: 'Lorem ipsum dolor sit amet', expectedCipheredText: 'Beh5c09fikc04ebeh0i9j01c5j', shift: 10 },
  { text: 'cAEsAR', expectedCipheredText: 'cAEsAR', shift: 63 },
];

testCases.forEach((testCase) => {
  test(`encodes '${testCase.text}'`, () => {
    const { text, expectedCipheredText, shift } = testCase;
    expect(encode(text, shift)).toBe(expectedCipheredText);
  });

  test(`decodes '${testCase.expectedCipheredText}'`, () => {
    const { text, expectedCipheredText, shift } = testCase;
    expect(decode(expectedCipheredText, shift)).toBe(text);
  });
});

test('throws an error when shift value is greater than the length of the letters', () => {
  expect(() => decode('Hello World', 100)).toThrow('Shift value is greater than the length of the letters.');
});
