---
prev: false
next: false
sidebarDepth: 4
---

# 代码提交规范

每次进行`git`提交，都应当书写提交信息。在没有提交规范要求的情况下，提交的内容怎么写都行，但是一堆无意义的提交记录，对于项目的管理和维护来说，并不友好。规范的提交记录不仅方便`code review`、也便于[项目维护](#项目维护)。

## 规范

当前开源社区中有很多相关的 Commit Message 规范，其中 [Angular 团队的规范](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#-git-commit-guidelines)使用最为广泛，[Conventional Commits](https://www.conventionalcommits.org/zh-hans/v1.0.0-beta.4/)则基于 Angular 提交准则提供了更加通用、简洁和灵活的提交规范。他们的基本规范如下：

### 基本规范

以下是提交信息的基本格式：

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

分为标题行（Header）、主题内容（Body）和页脚（Footer）三个部分，彼此之间使用空行分割。而不管是哪一个部分，他们中任何一行都不得超过 72 个字符（或 100 个字符），这是为了避免自动换行影响美观。

#### Header

标题行，是每次提交必填的部分，不要超过一行，用于描述本次主要修改的类别（type）、范围（scope）以及主题（subject）。

type：本次提交的类别，必填，其中 fix 和 feat 是主要的 type，分别代表问题的修复和新功能的增加，通常 fix 和 feat 会被放入 changelog 中。所以即使我们自定义规则也建议包含这两种类别。

scope：本次提交影响的范围，选填。scope 依据项目而定，例如在业务项目中可以依据菜单或者功能模块划分，如果是组件库开发，则可以依据组件划分。

subject：对于本次提交修改内容的简要描述，必填，以第一人称使用现在时，不以大写字母开头，不以`.`或`。`结尾。

#### Body

主题内容，非必须，描述为什么修改, 做了什么样的修改, 以及开发的思路等等，可以由多行组成。

#### Footer

页脚注释，可以由多行组成。

### Angular 规范

在 [Angular 规范](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines) 中，要求任何一行都不能超过 100 个字符。

type 类别必须是下面其中一个：

- build: 对构建系统或者外部依赖项进行了修改（比如: gulp, broccoli, npm）
- ci: 对 CI 配置文件或脚本进行了修改
- docs: 对文档进行了修改
- feat: 增加新的功能特征
- fix: 修复`bug`
- perf: 提高性能的代码更改
- refactor: 既不是修复`bug`也不是添加新功能特征的代码重构
- style: 不影响代码含义的修改，比如空格、格式化、缺失的分号等
- test: 增加确实的测试或者矫正已存在的测试

其他约定：

1. 如果本次提交包含回滚(revert)操作，那么 header 以`revert: `开头，紧跟着是被回滚的提交的 header 信息，同时在正文中添加`This reverts commit <hash>.`及其他正文信息，其中 hash 值表示被回滚前的提交。
2. 如果代码的提交是 Breaking Changes（不兼容变更）或 Closed Issues（关闭缺陷），则 Footer 是必需的，否则可以省略。

   Breaking Changes：当前代码与上一个版本不兼容，则 Footer 以`BREAKING CHANGE:`开头，后面跟着一个空格或是两个换行符，然后是对变动的描述、以及变动的理由和迁移方法。如：

   ```
   feat: allow provided config object to extend other configs

   BREAKING CHANGE: `extends` key in config file is now used for extending other config files
   ```

   Closed Issues：如果当前提交是针对特定的`issue`，需要在页脚引用该`issue`，以关键字`Closes`开头，比如：

   ```
   Closes #234
   ```

   如果涉及多个`issue`，以`,`加空格分隔，如：

   ```
   Closes #123, #245, #992
   ```

详细文档：[AngularJS Git Commit Message Conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit#)，更多示例可以参考 [angular](https://github.com/angular/angular/commits/master) 项目。

### Conventional 规范

[Conventional Commits](https://www.conventionalcommits.org/zh-hans/v1.0.0-beta.4/) 基于 Angular 规范，提供了一个轻量级的提交历史编写规则，这个约定与 [SemVer](https://semver.org/lang/zh-CN/) 的设计是相吻合的，在提交信息中描述新特性、bug 修复和破坏性变更。

    PATCH -> type(fix)
    MINOR -> type(feat)
    MAJOR -> BREAKING CHNAGE

提交说明包含了下面的结构化元素，以向类库使用者表明其意图：

1. **fix:** `type`为`fix`的提交表示在代码库中修复了一个 bug（这和语义化版本中的 [PATCH](https://semver.org/lang/zh-CN/#%E6%91%98%E8%A6%81) 相对应）。
2. **feat:** `type`为`feat`的提交表示在代码库中新增了一个功能（这和语义化版本中的 [MINOR](https://semver.org/lang/zh-CN/#%E6%91%98%E8%A6%81) 相对应）。
3. **BREAKING CHANGE:** 在可选的正文或脚注的起始位置带有`BREAKING CHANGE:`的提交，表示引入了破坏性 API 变更（这和语义化版本中的 [MAJOR](https://semver.org/lang/zh-CN/#%E6%91%98%E8%A6%81) 相对应）。破坏性变更可以是任意`type`提交的一部分。
4. **其它情况:** 除`fix:`和`feat:`之外的提交`type`也是被允许的，例如 [@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional)（基于 [Angular](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines) 约定）中推荐的 `chore:`、`docs:`、`style:`、`refactor:`、`perf:`、`test:` 及其他标签。 `improvement`也被推荐使用，用于对当前实现进行改进而没有添加新功能或修复错误的提交。 请注意，这些标签在约定式提交规范中并不是强制性的。并且在语义化版本中没有隐式的影响（除非他们包含`BREAKING CHANGE`）。可以为提交类型添加一个围在圆括号内的作用域，以为其提供额外的上下文信息。例如：
   ```
   feat(parser): adds ability to parse arrays.
   ```

其他约定：

1. 在正文结束的一个空行之后，可以编写一行或多行脚注。脚注必须包含关于提交的元信息，例如：关联的合并请求、Reviewer、破坏性变更，每条元信息一行。
2. 破坏性变更必须标示在正文区域最开始处，或脚注区域中某一行的开始。一个破坏性变更必须包含大写的文本`BREAKING CHANGE`，后面紧跟`:`和空格。
3. 可以在类型/作用域前缀之后，`:`之前，附加`!`字符，以进一步提醒注意破坏性变更。当有`!`前缀时，正文或脚注内必须包含`BREAKING CHANGE: description`，例如：

   ```
   chore!: drop Node 6 from testing matrix

   BREAKING CHANGE: dropping Node 6 which hits end of life in April
   ```

### 自定义规范

如果你希望更精细化的定制你团队的提交规范，建议不要破坏 Angular 的基本规范。如 [LStack 前端团队规范](../lstack/convention.html#提交规范)。

## 提交

在上面，我们约定了 Commit Message 的格式规范，那么在我们通过`git commit`命令提交代码时，需要按既定的规范去填写提交信息。直接手写难免会有错误，下面将介绍几种方法或工具以助于填写提交信息。

### 修改默认模板

在使用`git commit`进行提交时，默认情况下你会看到下面这样一个包含了提示信息的`vim`编辑窗，提示你编辑提交信息，同时也会提示当前修改的文件。

```shell script
$ git commit

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch is ahead of 'origin/master' by 1 commit.
#   (use "git push" to publish your local commits)
#
# Changes to be committed:
#	modified:   ...
#   deleted:    ...
#
```

同时`git`也提供了对提交模板的配置支持：

**全局修改：**

新建全局模板文件`~/.commit-template`：

```shell script
$ vim ~/.commit-template

# head: <type>(<scope>): <subject>
# - type: feat, fix, docs, style, refactor, test, chore
# - scope: can be empty (eg. if the change is a global or difficult to assign to a single component)
# - subject: start with verb (such as 'change'), 50-character line
#
# body: 72-character wrapped. This should answer:
# * Why was this change necessary?
# * How does it address the problem?
# * Are there any side effects?
#
# footer:
# - Include a link to the ticket, if any.
# - BREAKING CHANGE
#
```

修改`git`全局配置文件`~/.commit-template`，将提交信息模板指向新建的文件：

    [commit]
    template = ~/.commit-template

或者执行命令

```shell script
# 这个命令能设置全局的提交模板，注意global前面是两杠，这条命令与上面修改配置等效
git config --global commit.template ~/.commit-template
```

项目修改：

同样新建模板文件`.commit-template`，放到项目根目录下，在项目中执行命令：

```shell script
# 这个命令只能设置当前分支的提交模板
git config commit.template .commit-template
```

**验证：**

再次使用`git commit`提交时显示的模板如下：

```
# head: <type>(<scope>): <subject>
# - type: feat, fix, docs, style, refactor, test, chore
# - scope: can be empty (eg. if the change is a global or difficult to assign to a single component)
# - subject: start with verb (such as 'change'), 50-character line
#
# body: 72-character wrapped. This should answer:
# * Why was this change necessary?
# * How does it address the problem?
# * Are there any side effects?
#
# footer:
# - Include a link to the ticket, if any.
# - BREAKING CHANGE
#

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Your branch is ahead of 'all/master' by 2 commits.
#   (use "git push" to publish your local commits)
#
# Changes to be committed:
#       new file:   .gitignore
#
# Untracked files:
#       package.json
#
```

### Commitizen 工具

[Commitizen](https://github.com/commitizen/cz-cli)是一个用于提交信息的命令行交互工具，辅助开发者使用提交规则。由脚手架`commitizen/cz-cli`和适配器`adapter`组成。

#### 安装脚手架

```shell script
# 全局安装
npm install -g commitizen
or
# 项目安装
npm install --save-dev commitizen
```

#### 安装适配器

`Commitizen`支持多种不同的提交规范，可以安装和配置不同的适配器实现

以`Conventional Commit`规范为例，配置[cz-conventional-changelog](https://github.com/commitizen/cz-conventional-changelog)适配器

全局配置（推荐）

```shell script
# 安装
$ npm install -g cz-conventional-changelog
# 配置
$ echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
```

项目配置

```shell script
# 自动安装
commitizen init cz-conventional-changelog --save-dev --save-exact
or
# 手动安装
npm install cz-conventional-changelog -D
```

如果当前已经有其他适配器被使用，则会报以下错误，此时可以加上`--force`选项进行再次初始化

    Error: A previous adapter is already configured. Use --force to override

初始化命令主要进行了 3 件事情

1. 在项目中安装`cz-conventional-changelog`适配器依赖
2. 将适配器依赖保存到`package.json`的`devDependencies`字段信息
3. 在`package.json`中新增`config.commitizen`字段信息，主要用于配置 cz 工具的适配器路径

```shell script
{
    "devDependencies": {
     "cz-conventional-changelog": "^3.0.2"
    },
    "config": {
        "commitizen": {
            "path": "./node_modules/cz-conventional-changelog" // 项目
            // "path": "cz-conventional-changelog" // 全局
        }
    }
}
```

如果你的项目是一个 [monorepo](https://github.com/babel/babel/blob/master/doc/design/monorepo.md) 工程，可以结合适配器 [cz-lerna-changelog](https://github.com/atlassian/cz-lerna-changelog) 使用。它会额外提供关于本次提交涉及的包名的问询供你选择：

![](https://camo.githubusercontent.com/31e94d43e48b687eced3f805c0355be878b7531c/68747470733a2f2f7777772e657665726e6f74652e636f6d2f6c2f414156795a62336356627050306f4671596e6b70474d414649624257334a52474f4555422f696d6167652e706e67)

而后在自动提交信息的 body 第一行插入`affects: select-package`。

#### 自定义适配器

如果你的团队自定义了一套提交规范，且破坏了 Angular 的那套规范，那么可以通过 [cz-customizable](https://github.com/leoforfree/cz-customizable) 做适配。

全局 或 项目级别安装:

```shell script
# 全局安装
npm i -g cz-customizable
or
# 项目安装
npm i -D cz-customizable
```

将之前符合 Angular 规范的`cz-conventional-changelog`适配器路径改成`cz-customizable`适配器路径：

```json
{
  "devDependencies": {
    "cz-customizable": "^5.3.0"
  },
  "config": {
    "commitizen": {
      "path": "./node_modules/cz-customizable" // 项目
      // "path": "cz-customizable" // 全局
    }
  }
}
```

同时在`~/`或项目目录下创建`.cz-config.js`文件，`cz-customizable`会优先查找`.cz-config.js`配置文件，或是通过`package.json`中的 config 字段维护你想要的格式: 官方提供了一个`.cz-config.js`示例文件[cz-config-EXAMPLE.js](https://github.com/leonardoanalista/cz-customizable/blob/master/cz-config-EXAMPLE.js)，如下所示：

```javascript
'use strict'

module.exports = {
  types: [
    { value: 'feat', name: 'feat:     A new feature' },
    { value: 'fix', name: 'fix:      A bug fix' },
    { value: 'docs', name: 'docs:     Documentation only changes' },
    {
      value: 'style',
      name: 'style:    Changes that do not affect the meaning of the code\n            (white-space, formatting, missing semi-colons, etc)',
    },
    {
      value: 'refactor',
      name: 'refactor: A code change that neither fixes a bug nor adds a feature',
    },
    {
      value: 'perf',
      name: 'perf:     A code change that improves performance',
    },
    { value: 'test', name: 'test:     Adding missing tests' },
    {
      value: 'chore',
      name: 'chore:    Changes to the build process or auxiliary tools\n            and libraries such as documentation generation',
    },
    { value: 'revert', name: 'revert:   Revert to a commit' },
    { value: 'WIP', name: 'WIP:      Work in progress' },
  ],

  scopes: [{ name: 'accounts' }, { name: 'admin' }, { name: 'exampleScope' }, { name: 'changeMe' }],

  // it needs to match the value for field type. Eg.: 'fix'
  /*
  scopeOverrides: {
    fix: [
      {name: 'merge'},
      {name: 'style'},
      {name: 'e2eTest'},
      {name: 'unitTest'}
    ]
  },
  */
  // override the messages, defaults are as follows
  messages: {
    type: "Select the type of change that you're committing:",
    scope: '\nDenote the SCOPE of this change (optional):',
    // used if allowCustomScopes is true
    customScope: 'Denote the SCOPE of this change:',
    subject: 'Write a SHORT, IMPERATIVE tense description of the change:\n',
    body: 'Provide a LONGER description of the change (optional). Use "|" to break new line:\n',
    breaking: 'List any BREAKING CHANGES (optional):\n',
    footer: 'List any ISSUES CLOSED by this change (optional). E.g.: #31, #34:\n',
    confirmCommit: 'Are you sure you want to proceed with the commit above?',
  },

  allowCustomScopes: true,
  allowBreakingChanges: ['feat', 'fix'],

  // limit subject length
  subjectLimit: 100,
}
```

如果你需要更详细的定制，请参考[项目介绍](https://github.com/leoforfree/cz-customizable)

#### 测试

安装完成后，使用`git-cz`替代`git commit`完成提交操作，`git-cz`支持`git commit`所有的参数设置。你也可以在`.package.json`的`scripts`字段中添加如下脚本，使用别名`npm run commit`提交

```json
{
  "scripts": {
    "commit": "git-cz"
  }
}
```

```
$ git cz
cz-cli@4.0.3, cz-conventional-changelog@3.0.2

? Select the type of change that you're committing: (Use arrow keys)
❯ feat:     A new feature
  fix:      A bug fix
  docs:     Documentation only changes
  style:    Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
  refactor: A code change that neither fixes a bug nor adds a feature
  perf:     A code change that improves performance
  test:     Adding missing tests or correcting existing tests
(Move up and down to reveal more choices)
```

### IDE 插件

可能很多同学并不习惯用命令行进行代码提交，更习惯于 IDE 的 GUI 工具进行代码`add`、`diff`及`commit`，下面分别针对 WebStorm 和 VsCode 介绍下对应的提交规范相关插件，直接在对应 IDE 中安装便可使用。

#### WebStorm

- [Git Commit Template](https://plugins.jetbrains.com/plugin/9861-git-commit-template)：交互式的填写界面，类型固定，不支持模板配置
- [Conventional Commit](https://plugins.jetbrains.com/plugin/13389-conventional-commit)：提示性的填写界面，支持标准模式和模板配置
- [Git Commit Message Helper](https://plugins.jetbrains.com/plugin/13477-git-commit-message-helper)：（**推荐**）该插件是源自 git-commit-template 的加强版，添加一系列个性化的配置

#### VsCode

- [vscode-commitizen](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-commitizen)：安装插件，使用 ctrl+shift+p 或 command+shift+p 使用 conventional commit 提交代码。

## 校验

你可以使用上面介绍的一种或多种方法来帮助你填写提交信息。接下来将介绍一些用于提交信息校验的工具，结合 [husky](https://github.com/typicode/husky)，我们可以拒绝所有不合[规范](#规范)的`git`提交，确保每次提交的信息都是经过校验的。

### commitlint

[commitlint](https://github.com/conventional-changelog/commitlint)：是一个使用比较广泛的提交验证工具，由脚手架（cli）和配置（config）组成。

**安装脚手架**

```shell script
# 全局安装
npm install -g @commitlint/cli
or
# 项目安装
npm install --save-dev @commitlint/cli
```

**配置**

安装完`commitlint`工具后，还需要在项目目录下创建配置文件`.commitlintrc.js`。

```javascript
module.exports = {
  // 继承默认配置
  extends: [],
  // 自定义规则
  rules: {
    'type-enum': [2, 'always', ['feat', 'fix', 'refactor', 'docs', 'chore', 'style', 'revert']],
    'header-max-length': [0, 'always', 72],
  },
}
```

配置说明：规则由键值和配置数组组成，如：`name: [0, 'always', 72]`，数组中第一位为`level`（等级），可选 0，1，2，0 为 disable（禁用），1 为 warning（警告），2 为 error（错误），第二位为该规则是否被应用，可选`always | never`， 第三位为该规则允许值。

具体 rule 配置，参见[官网文档](https://commitlint.js.org/#/reference-rules)介绍。commitlint 也提供了编程式 [API](https://github.com/conventional-changelog/commitlint/blob/master/docs/reference-api.md) 作为脚本配置选择。当然，我们可以直接继承一些开源的配置，如[@commitlint/config-angular](https://github.com/conventional-changelog/commitlint/tree/master/@commitlint/config-angular)和[@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional)，以 [Conventional 规范](#conventional-规范)为例：

```shell script
# 全局安装
npm install -g @commitlint/config-conventional
or
# 项目安装
npm install --save-dev @commitlint/config-conventional
```

同时修改`.commitlintrc.js`文件，继承`@commitlint/config-conventional`配置：

```javascript
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'custom-rule': [],
  },
}
```

如果你是使用`cz-customizable`适配器并且自定义的规则违背了 Angular 风格的提交规范，那么不能使用`@commitlint/config-conventional`规则进行提交说明校验，可以使用 [commitlint-config-cz](https://github.com/whizark/commitlint-config-cz) 对定制化提交说明进行校验。

```shell script
# 全局安装
npm install -g commitlint-config-cz
or
# 项目安装
npm install -D commitlint-config-cz
```

`.commitlintrc.js`中写入:

```javascript
module.exports = {
  extends: ['cz'],
  rules: {},
}
```

你也可以使用 commitlint-config-cz 提供的 [API](https://github.com/whizark/commitlint-config-cz) 对 commitlint 进行编程式配置。

**结合 Husky：**

commitlint 的最佳食用方式是结合`git hook`在提交代码前做校验，所以可以配合 [Husky](https://github.com/typicode/husky)。

```shell script
npm install husky --save-dev
```

在`package.json`中添加：

```json
{
  "husky": {
    "hooks": {
      "commit-msg": "commitlint -E HUSKY_GIT_PARAMS"
    }
  }
}
```

另外，如果你想在某一次提交时禁用校验，可以添加参数`--no-verify`，当然，并不推荐这么做。

```shell script
$ git commit --no-verify -m "xxx"
```

**CI 集成：**

以`Travis CI`为例：

```shell script
# 项目安装
npm install --save-dev @commitlint/travis-cli
```

修改`travis.yml`文件

```yaml
language: node_js
script:
  - commitlint-travis
```

在 gitlab ci 中，可以运行以下命令检测当前提交是否符合 conventional-changelog 规范:

```shell script
npx -p "@commitlint/cli" -p "@commitlint/config-conventional" -p "commitlint-format-junit" commitlint -x @commitlint/config-conventional -o commitlint-format-junit -f ${CI_COMMIT_BEFORE_SHA} > commitlint_result.xml
```

将 lint result 输出为 JUnit 格式，方便 Gitlab 在 merge request 的时候展示 lint 失败的结果。

**CI 发布**

直接结合 [semantic-release](https://semantic-release.gitbook.io/semantic-release/)，参考我们的[文章](https://blog.dteam.top/posts/2020-05/semantic-release.html)。

**测试：**

**其他：**

对于非 NodeJS 项目，可以将`commitlint`安装为全局的命令行工具独立使用。

```shell script
npm install -g @commitlint/config-conventional @commitlint/cli
```

每次 commit 之后可以使用下述命令检测:

```shell script
commitlint -x '@commitlint/config-conventional' -e
```

`-e/--edit`参数代表读取`git commit`最后一条记录。如果希望检测最近几条 commit 记录，可以用:

```shell script
commitlint -x '@commitlint/config-conventional' -f HEAD~1
```

`-f/--from`参数可以指明从哪一条 commit 记录开始检测，还可以配合`-t/--to`参数检测一个 commit 区间段。

::: tip NOTE
如果不介意非 NodeJS 项目下多一堆 NodeJS 项目相关的配置文件，也可以在`npm init`初始化成 NodeJS 项目之后走上述 NodeJS 项目的配置流程。
:::

### validate-commit-msg

[validate-commit-msg](https://github.com/conventional-changelog-archived-repos/validate-commit-msg)也是一个用于提交信息校验的工具，详细使用方式参考其项目介绍。

### 自定义校验

在仓库内的`.git/COMMIT_EDITMSG`文件中保存了最近一次提交的信息，可以通过解析该文件获取提交信息并进行校验。结合`git hook`或`husky`进行提交前校验。如：[verifyCommitMsg.js](https://github.com/vuejs/vue-router/blob/dev/scripts/verifyCommitMsg.js)

## 版本日志

有了规范的提交记录，我们便可以通过工具自动生成版本日志。下面将介绍一些关于版本日志自动生成的工具。

### conventional-changelog

[conventional-changelog](https://github.com/conventional-changelog/conventional-changelog) 是一个可以根据规范的提交记录自动生成日志的工具。通过它可以快速生成所有包含 feat/fix/perf 和 Breaking Changes 的变更日志。

**安装[脚手架](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-cli)：**

```shell script
# 全局安装
npm install -g conventional-changelog-cli
or
# 项目安装
npm install -D conventional-changelog-cli
```

**使用：**

如果之前每次提交都使用规范化的格式进行提交，那么使用：

```shell script
conventional-changelog -p angular
```

应该在控制台中看到 markdown 格式的日志输出，你可以自己复制到已有的`CHANGELOG.md`文件并进行相应的修改。也可以直接在命令中添加` -i CHANGELOG.md`参数输出到指定`CHANGELOG.md`文件中：

```shell script
conventional-changelog -i CHANGELOG.md -s -p angular
```

以上命令会将日志追加到指定的`CHANGELOG.md`文件中。

通过追加`-r 0`参数，可以将之前所有的日志生成并以内容覆盖的形式添加到指定`CHANGELOG.md`文件中：

```shell script
conventional-changelog -p angular -i CHANGELOG.md -s -r 0
```

为了方便，可以将上述命令加入到`pacage.json`的`scripts`中，通过别名执行，如`npm run version`：

```json
{
  "scripts": {
    "version": "conventional-changelog -p angular -i CHANGELOG.md -s -r 0 && git add CHANGELOG.md"
  }
}
```

### standard-version

[standard-version](https://github.com/conventional-changelog/standard-version) 是一个用于[语义化版本](https://semver.org/lang/zh-CN/)发布及根据 [Conventional Commits](#conventional-规范) 自动生成版本日志的工具。在 [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog) 项目主页文档中，有这么一段介绍：

> It's recommended you use the high level standard-version library, which is a drop-in replacement for npm's version command, handling automated version bumping, tagging and CHANGELOG generation.

conventional-changelog 官方鼓励使用更上层的工具 standard-version 来产生 `CHANGELOG.md`。 conventional-changelog 可以帮助我们快速检查要生成的`CHANGELOG.md`的格式是否符合期望，而 standard-version 可以自动帮助我们做以下几件事情:

- 升级元数据中的版本号(如 package.json,composer.json 等等)。
- 基于提交记录，使用 conventional-changelog 自动生成 `CHANGELOG.md`。
- 提交`package.json`(如果有)和`CHANGELOG.md`。
- 给新版本打一个`tag`。

在这节，我将重点介绍版本日志相关的使用及配置，关于版本发布及工作流将在[这里](version.md)展开进行详细介绍。

**安装依赖：**

```shell script
# 项目安装
npm install -D standard-version
or
# 全局安装
npm install -g standard-version
```

执行命令`standard-version`，将看到类似于下面这样的输出:

```
$ standard-version
✔ bumping version in package.json from 0.0.4 to 0.0.5
✔ outputting changes to CHANGELOG.md
✔ committing package.json and CHANGELOG.md
✔ tagging release v0.0.5
ℹ Run `git push --follow-tags origin master && npm publish` to publish
```

可以非常清楚的从终端上看到`standard-version`做了哪些事情。检查`git log`可以看到确实新增了一条 commit 记录:

```
$ git log
commit bcee432453184877ab7b811ed2941a8459a59780 (HEAD -> master, tag: v0.0.5)
Author: wubin <bbye913@gmail.com>
Date:   Mon Aug 31 01:19:06 2020 +0800

    chore(release): 0.0.5

```

同项目中也生成了一个`CHANGELOG.md`文件。

**配置：**

在`standard-version`中，可以通过以下两种方式修改配置：

- 在`package.json`中添加`standard-version`字段。（假定是个 JavaScript 项目）
- 创建`.versionrc`、`.versionrc.json`或是`.versionrc.js`配置文件。（如果使用`.versionrc.js`配置文件，它必须`export`一个对象或是一个返回了对象的方法）

默认情况下，`standard-version`使用了 [conventionalcommits preset](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-conventionalcommits) 适配器，遵循 [Conventional 规范](#Conventional-规范)，但如果你希望自定义配置，例如，假设你使用的是 GitLab，而不是 GitHub，则可以修改以下变量：

- commitUrlFormat：在提交消息中检测到的提交 SHA 的 URL 格式。
- compareUrlFormat：用于比较两个标签的 URL 格式。
- issueUrlFormat：用于链接到问题的 URL 格式。

使这些 URL 与 GitLab 的格式匹配，而不与 GitHub 的格式匹配。具体的详细的可用配置参考 [conventional-changelog-config-spec](https://github.com/conventional-changelog/conventional-changelog-config-spec/)

上面我们提到过，执行`standard-version`时会做很多事，在`standard-version`中，他们对应一系列的是生命周期，如：`bump`、`changelog`、`commit`、`tag`，但如果你仅仅是希望自动生成版本日志。可以选择跳过其他步骤：

```json
{
  "standard-version": {
    "skip": {
      "bump": true,
      "commit": true,
      "tag": true
    }
  }
}
```

此时再次执行`standard-version`，观察控制台输出，可以看到：

```
$ standard-version
✔ outputting changes to CHANGELOG.md
```

这次仅仅输出了`CHANGELOG.md`文件。

### lerna-changelog

[lerna-changelog](https://github.com/lerna/lerna-changelog) 是一个基于`pr`自动生成，支持 [monorepo](https://github.com/babel/babel/blob/master/doc/design/monorepo.md) 工程。具体使用可以参考[这篇文章](https://www.codercto.com/a/65308.html)，这里不再展开介绍了。

### @lerna/version [](https://github.com/lerna/lerna/blob/514bc57a53/commands/version/README.md#--conventional-commits)

如果你的项目是一个 [monorepo](https://github.com/babel/babel/blob/master/doc/design/monorepo.md) 工程，并且由 (lerna](https://github.com/lerna/lerna) 管理。那么你可以使用 @lerna/version 进行版本发布及版本日志生成。上文中介绍的校验工具 [commitlint](https://github.com/conventional-changelog/commitlint) 及日志工具 [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog) 都是这样的项目。

https://github.com/conventional-changelog/standard-version/issues/225

关于版本发布及工作流相关在[版本与发布](version.md)中展开，`@lerna/version`有单独章节进行介绍，有兴趣可以看看。

@pantoninho I am using the one provided by lerna. At the moment with conventional-changelog/standard-version you can't have independent versions and generated CHANGELOG.md with the correct meta-info on them, because it bumps all the packages with the same version without respect the independent option.

For the first creation of the each CHANGELOG.md I use this independent changelog generation tip

And after it, having in your lerna.json file:

"command": {
"version": {
"message": "chore(release): publish",
"conventionalCommits": true,
"yes": true
}
}
you can simple call npx lerna version which will update your CHANGELOG.md files, will bump your package versions respecting them with the conventional commit preset chosen and will respect the independent versioning for each package.

## 项目维护

格式化的 commit message，为项目维护提供了便利。

1. 提供更多的历史信息，方便快速浏览。

   ```shell script
   # 比如，下面的命令显示上次发布后的变动，每个commit占据一行。你只看行首，就知道某次 commit 的目的。
   $ git log <last tag> HEAD --pretty=format:%s
   ```

   ![](http://www.ruanyifeng.com/blogimg/asset/2016/bg2016010604.png)

2. 可以过滤某些 commit（比如文档改动），便于快速查找信息。

   ```shell script
   # 比如，下面的命令仅仅显示本次发布新增加的功能。
   $ git log <last release> HEAD --grep feature
   ```

3. 可以直接从 commit 生成 Change log。

   Change Log 是发布新版本时，用来说明与上一个版本差异的文档，详见后文。

4. 修改已提交 message。

   关于`git rebase`的详细用法，请看[这里]()

5. 合并多次提交

   如果你上次修改的内容存在 bug 或未完成，本次提交的内容与上次几乎一样，建议使用 git rebase -i 进行提交的合并，如

   ```shell script
   git rebase -i HEAD~3 # 展示最近 3 次修改
   ```

   输出如下：

   ```
   pick 0291959 chore(blog): 清理无关项
   pick 1ef8f31 chore(blog): 清理无关项
   pick 36a91db fix(post): 格式化 post 的 meta 数据格式,增加 --- 开始符
   ```

   可以将第二行的 pick 修改为 squash，表示保留 commit 但将本次修改合并到上次，相关的操作可以看 [这篇文章](https://www.barretlee.com/blog/2018/11/26/git-%E5%B8%B8%E7%94%A8%E6%8A%80%E5%B7%A7/)。

6. 关闭 ISSUE
   在 github/gitlab 中，如果 commit message 中带有 Closes #23 诸如此类的信息，当 commit 被 push 到 repo 后，会自动关闭编号为 23 的 issue。

## 最后

commit message 的规范性很重要, 但是是否需要像本文这样强制限制, 每个团队和个人都有自己的想法, 但是个人认为: 好的习惯, 受益终身.

**参考：**

- [规范化 git commit 信息](https://blog.dteam.top/posts/2019-04/%E8%A7%84%E8%8C%83%E5%8C%96git-commit%E4%BF%A1%E6%81%AF.html)
- [Cz 工具集使用介绍 - 规范 Git 提交说明](https://juejin.im/post/6844903831893966856)
- [别乱提交代码了，看下大厂 Git 提交规范是怎么做的！](https://zhuanlan.zhihu.com/p/100773495)
- [Commit message 和 Change log 编写指南](http://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html)
- [git commit 规范校验配置和版本发布配置](http://kmanong.top/kmn/qxw/form/article?id=1108&cate=93)
