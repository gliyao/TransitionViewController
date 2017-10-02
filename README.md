# TransitionViewController

Use blur transiton effect in 2 steps. 

First, Subclass your dialog view controller.
Second, chose tranistion style you want.

<img src="./transition.gif" height="776" width="400"></img>


## Support Xib
You can easily subclass `TransitionViewController` to achieve blur background effect.


## Background effet

There have 2 kind of background effect. Blur and black with alpha.

<img src="./darkBlurPopupView.png" height="776" width="400"></img>
<img src="./balck05PopupView.png" height="776" width="400"></img>

## Present and dismiss direction

Support 4 direction (top, bottom, left, right)

## Sample code

```
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
