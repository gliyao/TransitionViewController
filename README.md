# TransitionViewController

客製化轉場元件，適用於 dialog, tutorial, 

- 支援四個方向的 present, dismiss
	- top, bottom, left, right
- 支援兩種背景
	- blur, black
- 支援 xib


# Example
```
class YourPopupViewController: TransitionViewController {
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		// Change transition here!!
		self.transition = TransitionAnimator(style: .blur(.light), presentFrom: .bottom, dismissTo: .bottom)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
```

![transition](./transition.gif){:height="776px" width="400px"}
