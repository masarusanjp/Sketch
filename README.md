# Sketch

[![CI Status](http://img.shields.io/travis/masaichi/Sketch.svg?style=flat)](https://travis-ci.org/masaichi/Sketch)
[![Version](https://img.shields.io/cocoapods/v/Sketch.svg?style=flat)](http://cocoapods.org/pods/Sketch)
[![License](https://img.shields.io/cocoapods/l/Sketch.svg?style=flat)](http://cocoapods.org/pods/Sketch)
[![Platform](https://img.shields.io/cocoapods/p/Sketch.svg?style=flat)](http://cocoapods.org/pods/Sketch)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Make UIImage using Sketch

```Swift

let r: CGFloat = CGFloat(22)
let image = Sketch.draw(CGSize(width: r * 2, height: r * 2)) { canvas in
    canvas.fill(UIColor(white: 1.0, alpha: 1.0))
    canvas.stroke(UIColor(white: 0.6, alpha: 1.0))
    canvas.circle(Float(r))
}

```

## Requirements

## Installation

Sketch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Sketch"
```

## Author

masaichi, masarusanplusplus@gmail.com

## License

Sketch is available under the MIT license. See the LICENSE file for more info.
