# SwiftTest

GitHub Action that executes unit tests of a Swift project.

<a href="https://swift.org" rel="nofollow">
  <img src="https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat&logo=swift" />
</a>

## Usage

Actions are referenced with the `uses` syntax. For example:

```yaml
steps:
  - uses: actions/checkout@v3
  - name: Build Swift Project
    uses: SwiftActions/SwiftTest@main
    with:
      target: "SwiftTest"
      verbose: true
```

## Parameters

| Input       | Description                                                                             | Default | Required |
| ----------- | --------------------------------------------------------------------------------------- | ------- | -------- |
| **verbose** | Increase verbosity to include informational output.<br/>Proxies `swift build --verbose` | false   | ⛌        |

## Dependencies

The action uses _Swift_ to build _Swift_. Some third party libraries are used as part of the process:

| Library                                                                 | Usage                                                                                                          |
| ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| [swift-argument-parser](https://github.com/apple/swift-argument-parser) | Parses parameters provided to the action in order to determine the full shell command that should be executed. |
| [ShellOut](https://github.com/JohnSundell/ShellOut)                     | Utility to execute the command parsed using the shell.                                                         |

## Contributions

Details TBD

## Legal

Uses MIT license. The Swift logo is a trademark of Apple Inc.
