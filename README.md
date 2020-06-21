# DogBreeds

[![Platform](https://img.shields.io/badge/iOS->=12.0-brightgreen?style=flat)](http://www.apple.com/ios/)
[![Language](https://img.shields.io/badge/Swift-5-orange?style=flat)](https://swift.org)

An iOS application to display various breeds of dogs from the [DogAPI](https://api.thedogapi.com/v1/images/search) endpoint.


### Dependency

- Mac OS Catalina 10.15.5
- Xcode 11.5
- git 2.24.3

### Development

1. Clone the repo from the `github` using ssh or https. If you are using ssh make sure that you have added your ssh key to github.
- git clone git@github.com:abintom/dogbreeds.git
2. Open `DogBreeds.xcodeproj` using `Xcode` application.


### Architecture

- [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel) (Model-View-ViewModel)

### External libraries

- [Nuke](https://github.com/kean/Nuke) for Image download and caching.


### Scope for Improvement

- Use [SwiftGen](https://github.com/SwiftGen/SwiftGen) to avoid boilerplate code for resouce management like localization and to make it type-safe.



