# DogBreeds

[![Platform](https://img.shields.io/badge/iOS->=12.0-brightgreen?style=flat)](http://www.apple.com/ios/)
[![Language](https://img.shields.io/badge/Swift-5-orange?style=flat)](https://swift.org)

An iOS application to display various breeds of dogs from the [DogAPI](https://api.thedogapi.com/v1/images/search) endpoint.


### Dependency

- Mac OS Catalina 10.15.5
- Xcode 11.5
- git 2.24.3

### Development

1. Clone the repo from the [github](https://github.com/abintom/dogbreeds) using ssh or https. If you are using ssh make sure that you have added your ssh key to github.
- `git clone git@github.com:abintom/dogbreeds.git`
2. Open `DogBreeds.xcodeproj` using `Xcode` application.


### Architecture

- [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) (Model-View-ViewModel)

### External libraries

- [Nuke](https://github.com/kean/Nuke) for Image download and caching.


### Scope for Improvement

- Use [SwiftGen](https://github.com/SwiftGen/SwiftGen) to avoid boilerplate code for resouce management like localization and to make it type-safe
- Use [SwiftLint](https://github.com/realm/SwiftLint) and [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) for linting and formatting
- Implement pull to refresh to reload data
- Show alerts during errors or failures
- Add placeholder image for failed or loading images.


### Assumptions

As there isn't any backend specs, the below assumptions are considered when developing the app.

- Dog breed type fetched from the backend would be always unique (even the name is same). There is no filtering done in the backend to remove duplicates
- Life span is always of the regex pattern `\d+\s*(\p{Pd}\s*\d+)?\s*years?` and the data which don't follow this pattern is ignored.
- The list is sorted by taking an average lifespan for the range.
