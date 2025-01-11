fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android build

```sh
[bundle exec] fastlane android build
```

Build the app

### android test

```sh
[bundle exec] fastlane android test
```

Runs all the tests

### android lint

```sh
[bundle exec] fastlane android lint
```

Lint the app

### android update_fixed_gradle_property

```sh
[bundle exec] fastlane android update_fixed_gradle_property
```



### android increment_version

```sh
[bundle exec] fastlane android increment_version
```

Increment the version code and version name

### android artifact

```sh
[bundle exec] fastlane android artifact
```

Submit a new Beta Build to Crashlytics Beta

### android full

```sh
[bundle exec] fastlane android full
```

Full workflow

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
