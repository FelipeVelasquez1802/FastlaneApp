fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### clean

```sh
[bundle exec] fastlane clean
```

Clean the project

### build

```sh
[bundle exec] fastlane build
```

Build the app

### test

```sh
[bundle exec] fastlane test
```

Runs all the tests

### lint

```sh
[bundle exec] fastlane lint
```

Lint the app

### check_qa_branch

```sh
[bundle exec] fastlane check_qa_branch
```

Check QA branch

### increment_version

```sh
[bundle exec] fastlane increment_version
```

Increment the version code and version name

### create_release_qa_branch

```sh
[bundle exec] fastlane create_release_qa_branch
```

Create a new branch with the name of the version

### push_release_qa_branch

```sh
[bundle exec] fastlane push_release_qa_branch
```

Push the branch to the remote

----


## Android

### android verification

```sh
[bundle exec] fastlane android verification
```



### android full_pre_release

```sh
[bundle exec] fastlane android full_pre_release
```



### android full_release_qa

```sh
[bundle exec] fastlane android full_release_qa
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
