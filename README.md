# Pinner

[![CI Status](http://img.shields.io/travis/DenisLitvin/Pinner.svg?style=flat)](https://travis-ci.org/DenisLitvin/Pinner)
[![Version](https://img.shields.io/cocoapods/v/Pinner.svg?style=flat)](http://cocoapods.org/pods/Pinner)
[![License](https://img.shields.io/cocoapods/l/Pinner.svg?style=flat)](http://cocoapods.org/pods/Pinner)
[![Platform](https://img.shields.io/cocoapods/p/Pinner.svg?style=flat)](http://cocoapods.org/pods/Pinner)

## Example

If you you want to see the full example, run the example project, clone the repo, and run `pod install` from the Example directory first.

### Helper functions

1. Arrange view based on `Safe Area Layout Guide` that works for all devices and ios versions:

```swift
viewController.view.addSubview(canvasView)
viewController.fillSafeArea(with: canvasView)
```
<p align="right">
<img src="safeArea.png" width="200" max-width="50%" />
</p>
2. 

## Installation

*CocoaPods:**

Add the line `pod "Pinner"` to your `Podfile`

*Manual:**

Clone the repo and drag the file `Pinner.swift` into your Xcode project.

## Platform support

- iOS 9.3 and above

## Author

DenisLitvin, den.litvinn@gmail.com

## License

Pinner is available under the MIT license. See the LICENSE file for more info.
