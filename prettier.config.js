/** @type {import("prettier").Config} */

export default {
  plugins: ['prettier-plugin-sh', 'prettier-plugin-packagejson'],
  printWidth: 120,
  tabWidth: 2,
  singleQuote: true,
  jsxSingleQuote: true,
  semi: true,
  trailingComma: 'es5',
};
