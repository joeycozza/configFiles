module.exports = {
  env: {
    es6: true,
    node: true,
    mocha: true,
  },
  extends: ['eslint:recommended'],
  parserOptions: {
    ecmaVersion: 8,
    sourceType: 'module'
  },
  rules: {
    'no-console': 'off'
  }
};
