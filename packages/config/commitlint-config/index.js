export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'body-leading-blank': [2, 'always'],
    'footer-leading-blank': [2, 'always'],
    'header-max-length': [2, 'always', 100],
    'scope-empty': [2, 'never'],
    'scope-enum': [0, 'always', []],
    'subject-full-stop': [2, 'never'],
    'subject-min-length': [2, 'always', 5],
    'type-enum': [
      2,
      'always',
      ['fix', 'build', 'ci', 'cd', 'feat', 'style', 'test', 'docs', 'version', 'pref', 'refactor', 'squash', 'revert'],
    ],
  },
}
