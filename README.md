# TransitionViewController

<!-- [![Build Status](https://travis-ci.org/gliyao/TransitionViewController.svg?branch=master)](https://travis-ci.org/gliyao/TransitionViewController)  -->
<!-- [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) -->

[![CI Status](https://travis-ci.org/gliyao/TransitionViewController.svg?branch=master)](https://travis-ci.org/gliyao/TransitionViewController)
[![Version](https://img.shields.io/cocoapods/v/TransitionViewController.svg?style=flat)](http://cocoapods.org/pods/TransitionViewController)
[![License](https://img.shields.io/cocoapods/l/TransitionViewController.svg?style=flat)](http://cocoapods.org/pods/TransitionViewController)
[![Platform](https://img.shields.io/cocoapods/p/TransitionViewController.svg?style=flat)](http://cocoapods.org/pods/TransitionViewController)

Use blur transiton effect in 2 steps. 

First, subclass your dialog view controller.
Second, chose tranistion style you want.

<img src="./transition.gif" height="776" width="400"></img>

## Support Xib
You can easily subclass `TransitionViewController` to achieve blur background effect.


## Background Effet

There have 2 kind of background effect. Blur and black with alpha.

<img src="./darkBlurPopupView.png" height="702" width="400"></img>
<img src="./balck05PopupView.png" height="702" width="400"></img>

``` swift
enum TransitionStyle {
	case black(CGFloat)
	case blur(UIBlurEffectStyle)
}
```

## Present and Dismiss Direction

Support 4 direction (top, bottom, left, right)

``` swift
enum TransitionPosition {
	case top, bottom, left, right
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

gliyao@gmail.com, gliyao@gmail.com

## License

LCLabel is available under the MIT license. See the LICENSE file for more info.


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
