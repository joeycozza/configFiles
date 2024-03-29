module.exports = {
  env: {
    es6: true,
    node: true,
    mocha: true,
  },
  extends: ['eslint:recommended'],
  parserOptions: {
    ecmaVersion: 10,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true
    }
  },
  rules: {
    'no-console': 'off'
  }
};
