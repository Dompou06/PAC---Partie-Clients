module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    es6: true
  },
  extends: [
    //'plugin:vue/vue3-essential',
    // 'eslint:recommended',
    // "plugin:prettier/recommended",
    'plugin:vue/vue3-recommended',
    'prettier'
  ],
  parserOptions: {
    //parser: '@babel/eslint-parser'
  },
  plugins: ['prettier'],
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    quotes: [
      'error',
      'single',
      { avoidEscape: true, allowTemplateLiterals: false }
    ],
    semi: ['error', 'never'],
    includeExports: 0,
    'no-duplicate-imports': ['error', { includeExports: true }],
    indent: ['error', 2]
    //spaced-comment: ["error", "never", { "markers": ["//"] }],
    //comma-dangle: ["error", "never"],
    //space-before-function-paren: ["error", "never"]
  }
}
