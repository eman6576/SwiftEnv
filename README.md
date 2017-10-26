# SwiftEnv

An easy to use interface for accessing environment variables with Swift

[![Build Status](https://travis-ci.org/eman6576/SwiftEnv.svg?branch=master)](https://travis-ci.org/eman6576/SwiftEnv)
[![codecov](https://codecov.io/gh/eman6576/SwiftEnv/branch/master/graph/badge.svg)](https://codecov.io/gh/eman6576/SwiftEnv)
![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![DUB](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/eman6576/SwiftEnv/blob/master/LICENSE)
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey.svg)]()

## Installation

### Swift Package Manager

You can add this to your `Package.swift` manifest with
```swift
.package(url: "https://github.com/mxcl/PromiseKit.git", from: "1.0.0")
```

## Usage

### Read

You can read in a value for a enviroment variable using either `valueForEnviromentVariable` or the subscript for syntatic sugar.
```swift
let ENV = SwiftEnv()

// Optional("Users/<name of user directory>/")
// Gets value for key `PATH` using method
let path1 = ENV.valueForEnvironmentVariable("PATH")

// Optional("Users/<name of user directory>/")
// Gets value for key `PATH` using subscript
let path2 = ENV["PATH"]
```

### Write

You can set a value for an environment variable using either `setValueForEnvironmentVariable` or the subscript for syntatic sugar.
```swift
let ENV = SwiftEnv()

// Set value for key `BUILD_CONFIGURATION` using method
ENV.setValueForEnvironmentVariable("Debug")

// Set value for key `BUILD_CONFIGURATION` using subscript
ENV["BUILD_CONFIGURATION"] = "Release"
```

### Reset

You can reset/remove a value for an environment variable using either `removeValueForEnvironmentVariable` or the subscript for syntatic sugar
```swift
let ENV = SwiftEnv()

// Remove value for key `TEST_MODE` using method
ENV.removeValueForEnvironmentVariable("TEST_MODE") = nil

// Remove value for key `BUILD_MODE` using method
ENV["BUILD_MODE"] = nil
```

## Contributing

If you would like to contribute, please consult the [contributing guidelines](https://github.com/eman6576/SwiftEnv/blob/master/CONTRIBUTING.md) for details. Also check out the GitHub issues for major milestones/enhancements needed.

## License

SwiftEnv is released under the MIT license. [See LICENSE](https://github.com/eman6576/SwiftEnv/blob/master/LICENSE) for details
