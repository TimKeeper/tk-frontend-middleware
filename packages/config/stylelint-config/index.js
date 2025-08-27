export default {
  extends: [
    // stylelint-config-standard-scss = extends: ['stylelint-config-standard', 'stylelint-config-recommended-scss']
    // stylelint-config-standard = extends: 'stylelint-config-recommended'
    // stylelint-config-recommended-scss = extends: ['stylelint-config-recommended'], customSyntax: require('postcss-scss'), plugins: ['stylelint-scss'],
    'stylelint-config-standard-scss',
    'stylelint-config-recess-order',
    // stylelint-config-html = overrides: [ { files: .vue, customSyntax: "postcss-vue" }, { files: .html..., customSyntax: "postcss-html",}...]
    'stylelint-config-html',
    'stylelint-config-prettier-scss',
  ],
  plugins: [
    'stylelint-declaration-block-no-ignored-properties',
    'stylelint-declaration-strict-value',
    'stylelint-prettier',
  ],
  rules: {
    'selector-class-pattern': null,
    'function-name-case': ['lower', { ignoreFunctions: ['/colorPalette/'] }],
    'plugin/declaration-block-no-ignored-properties': true,
    'scale-unlimited/declaration-strict-value': [
      ['/color$/', 'fill', 'stroke', 'z-index'],
      {
        ignoreKeywords: {
          '/color$/': ['currentcolor', 'transparent', 'inherit', 'unset'],
          fill: ['currentcolor', 'inherit'],
          stroke: 'currentcolor',
          'z-index': 0,
        },
        // 自动修复的规则，具体参考 https://github.com/AndyOGo/stylelint-declaration-strict-value，当前版本暂时关闭该功能
        // autoFixFunc: function () {},
        disableFix: true,
      },
    ],
    'prettier/prettier': true,
    // 修复 hsla(var(--hsl-outline), 0.12); 报错并自动格式化为 hsl(var(--hsl-outline) 0.12) 的问题
    'color-function-notation': ['modern', { ignore: ['with-var-inside'] }],
  },
}
