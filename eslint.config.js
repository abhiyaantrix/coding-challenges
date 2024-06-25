import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';
import eslintPluginPrettierRecommended from 'eslint-plugin-prettier/recommended';

export default tseslint.config(
  eslint.configs.recommended,
  eslintPluginPrettierRecommended,
  ...tseslint.configs.recommended,
  ...tseslint.configs.stylistic,
  {
    files: ['**/*.{js,ts}'],
    rules: {
      'no-console': 'error',
      'prettier/prettier': 'error',
      'no-multiple-empty-lines': 'error',
      'padding-line-between-statements': [
        'error',
        { blankLine: 'always', prev: '*', next: 'if' },
        { blankLine: 'always', prev: '*', next: 'for' },
        { blankLine: 'always', prev: '*', next: 'while' },
        { blankLine: 'always', prev: '*', next: 'function' },
        { blankLine: 'always', prev: '*', next: 'return' },
        { blankLine: 'always', prev: '*', next: 'try' },
        { blankLine: 'always', prev: '*', next: 'throw' },
      ],
      'no-debugger': 'error',
      'implicit-arrow-linebreak': 'off',
      'max-lines': ['error'],
      'max-len': [
        'error',
        {
          code: 120,
          tabWidth: 2,
          ignoreUrls: true,
          ignoreTemplateLiterals: true,
          ignoreComments: true,
          ignoreStrings: true,
        },
      ],
      'no-param-reassign': 'warn',
      'object-curly-newline': 'off',
      'object-curly-spacing': ['error', 'always'],
      'eol-last': ['error', 'always'],
    },
  },
  {
    ignores: [
      'node_modules',
      'coverage-*/',
      'coverage-jest',
      '.byebug_history',
      '*.rb',
      'tmp',
      'log',
      'vendor',
      '.bundle',
    ],
  }
);
