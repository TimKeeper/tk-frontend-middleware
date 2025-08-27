export default {
  ignores: [commit => commit.includes('Merge') || commit.includes('Revert') || commit.includes('Squash')],
  extends: ['@tk/commitlint-config'],
}
