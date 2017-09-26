# 测试系统

## 测试环境

强烈推荐 xctool

### 安装 xctool

```
brew install xctool
```

### 使用 xctool

```
xctool -workspace NewStructure.xcworkspace -scheme NewStructureTest run-tests -sdk iphonesimulator
```

### 说明 xctool

```
xctool -help
```

```

Reporters

	- pretty: (default) a text-based reporter that uses ANSI colors and unicode symbols for pretty output.
	- plain: like pretty, but with with no colors or Unicode.
	- phabricator: outputs a JSON array of build/test results which can be fed into the Phabricator code-review tool.
	- junit: produces a JUnit/xUnit compatible XML file with test results.
	- json-stream: a stream of build/test events as JSON dictionaries, one per line (example output).
	- json-compilation-database: outputs a JSON Compilation Database of build events which can be used by Clang Tooling based tools, e.g. OCLint.
```

### 测试 xctool

测试scheme下所有测试
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests
```

测试scheme下指定target的测试
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests -only SomeTestTarget
```

测试scheme下指定测试类的测试
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests -only SomeTestTarget:SomeTestClass
```

测试scheme下指定测试类的指定方法测试
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests -only SomeTestTarget:SomeTestClass/testSomeMethod
```

测试scheme下符合匹配规则的类、方法的测试
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests -only SomeTestTarget:SomeTestClassPrefix*,SomeTestClass/testSomeMethodPrefix*
```

Alternatively, you can omit a specific item by prefix matching for classes or test methods:
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests -omit SomeTestTarget:SomeTestClass/testSomeMethodPrefix*
```

You can also run tests against a different SDK:
```
path/to/xctool.sh \
  -workspace YourWorkspace.xcworkspace \
  -scheme YourScheme \
  run-tests -test-sdk iphonesimulator5.1
```

### 构建测试

## 测试框架

强烈推荐 [John](https://github.com/fallending/John)
