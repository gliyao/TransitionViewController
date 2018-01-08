# TransitionViewController

[![Build Status](https://travis-ci.org/gliyao/TransitionViewController.svg?branch=master)](https://travis-ci.org/gliyao/TransitionViewController) 
[![Version](https://img.shields.io/cocoapods/v/TransitionViewController.svg?style=flat)](http://cocoapods.org/pods/TransitionViewController)
[![License](https://img.shields.io/cocoapods/l/TransitionViewController.svg?style=flat)](http://cocoapods.org/pods/TransitionViewController)
[![Platform](https://img.shields.io/cocoapods/p/TransitionViewController.svg?style=flat)](http://cocoapods.org/pods/TransitionViewController)
[![codecov](https://codecov.io/gh/gliyao/TransitionViewController/branch/master/graph/badge.svg)](https://codecov.io/gh/gliyao/TransitionViewController)
[![Support](https://img.shields.io/badge/iOS-8-blue.svg)](https://www.apple.com/tw/ios)&nbsp;

Use blur transiton effect in 2 steps. 

First, subclass your dialog view controller.
Second, chose tranistion style you want.

<img src="./Resources/transition.gif" height="388" width="200"></img>

## Support Xib
You can easily subclass `TransitionViewController` to achieve blur background effect.


## Background Effet

There have 2 kind of background effect. Blur and black with alpha.

<img src="./Resources/darkBlurPopupView.png" height="351" width="200"></img>
<img src="./Resources/balck05PopupView.png" height="351" width="200"></img>

``` swift
enum TransitionStyle {
	case black(CGFloat)
	case blur(UIBlurEffectStyle)
}
```

## Present and Dismiss Direction

Support 4 direction (top, bottom, left, right, none)

``` swift
enum TransitionPosition {
	case top, bottom, left, right, none
}
```

## How To Use

``` swift
// 1. Subclass for your dialog view controller
class YourPopupViewController: TransitionViewController {
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		// 2. Change transition here!!
		self.transition = TransitionAnimator(style: .blur(.light), presentFrom: .bottom, dismissTo: .bottom)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
```

## Requirements

- iOS 8.0 or later

## Installation

TransitionViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TransitionViewController'
```

## Author

Liyao Chen, gliyao@gmail.com

## License

TransitionViewController is available under the MIT license. See the LICENSE file for more info.

