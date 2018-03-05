module.exports = {
  env: {
    es6: true,
    node: true,
    mocha: true,
    jasmine: true
  },
  extends: 'eslint:recommended',
  parserOptions: {
    ecmaVersion: 8
  },
  rules: {
    'no-console': 'off'
  }
};
