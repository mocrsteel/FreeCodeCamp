module.exports = {
  root: true,
  env: {
    browser: true,
    es2021: true,
    node: true,
    'jest/globals': true
  },
  extends: [
    'plugin:react/recommended',
    'plugin:react/jsx-runtime',
    'plugin:@typescript-eslint/recommended',
    'standard'
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaFeatures: {
      jsx: true
    },
    ecmaVersion: 'latest',
    sourceType: 'module'
  },
  plugins: [
    'react',
    '@typescript-eslint',
    'jest'
  ],
  globals: {
    JSX: true
  },
  rules: {
    'no-use-before-define': 'off',
    '@typescript-eslint/no-use-before-define': ['error']
  }
}
