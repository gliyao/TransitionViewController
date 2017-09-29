//
//  TransitionAnimator.swift
//  TransitionViewControllerDemo
//
//  Created by Liyao on 29/09/2017.
//  Copyright © 2017 Liyao. All rights reserved.
//

import Foundation
import UIKit

enum TransitionPosition {
	case top, bottom, left, right
	
	func frame() -> CGRect {
		let bounds = UIScreen.main.bounds
		switch self {
		case .top:
			return CGRect(x: 0, y: bounds.height * -1 , width: bounds.width, height: bounds.height)
		case .bottom:
			return CGRect(x: 0, y: bounds.height, width: bounds.width, height: bounds.height)
		case .left:
			return CGRect(x: bounds.width * -1, y: 0, width: bounds.width, height: bounds.height)
		case .right:
			return CGRect(x: bounds.width, y: 0, width: bounds.width, height: bounds.height)
		}
	}
}

enum TransitionStyle {
	case black(CGFloat)
	case blur(UIBlurEffectStyle)
	
	func generateView() -> UIView {
		switch self {
		case .black(let alpha):
			let view = UIView()
			view.backgroundColor = UIColor(white: 0, alpha: CGFloat(alpha))
			return view
		case .blur(let blurStyle):
			let effect = UIBlurEffect(style: blurStyle)
			return UIVisualEffectView(effect: effect)
		}
	}
}

class TransitionAnimator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
	let style: TransitionStyle
	let presentFrom: TransitionPosition
	let dismissTo: TransitionPosition
	let duration: TimeInterval
	
	init(style: TransitionStyle = TransitionStyle.blur(.dark), presentFrom: TransitionPosition = .bottom, dismissTo: TransitionPosition = .bottom, duration: TimeInterval = 0.5) {
		self.style = style
		self.presentFrom = presentFrom
		self.dismissTo = dismissTo
		self.duration = duration
	}
	
	// MARK: - UIViewControllerTransitioningDelegate
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return self
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return self
	}
	
	// MARK: - UIViewControllerAnimatedTransitioning
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return self.duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
		guard let toVC = transitionContext.viewController(forKey: .to) else { return }
		
		guard let snapshotView = fromVC.view.snapshotView(afterScreenUpdates: true) else { return }
		snapshotView.frame = fromVC.view.frame
		transitionContext.containerView.addSubview(snapshotView)
		
		let isPreseting = toVC is TransitionViewController
		if isPreseting {
			self.transitionIn(direction: self.presentFrom, from: fromVC, to: toVC, transitionContext: transitionContext)
		}
		else{
			self.transitionOut(direction: self.dismissTo, from: fromVC, to: toVC, transitionContext: transitionContext)
		}
	}
}

extension TransitionAnimator {
	func transitionIn(direction: TransitionPosition, from originVC: UIViewController, to popupVC: UIViewController, transitionContext: UIViewControllerContextTransitioning) {
		transitionContext.containerView.addSubview(originVC.view)
		transitionContext.containerView.addSubview(popupVC.view)
		
		let screenBounds = transitionContext.containerView.frame
		let startFrame = direction.frame()
		let endFrame = CGRect(x: 0, y: screenBounds.height - popupVC.view.frame.height, width: popupVC.view.frame.width, height: popupVC.view.frame.height)
		popupVC.view.frame = startFrame
		
		
		let blurView = style.generateView()
		blurView.frame = popupVC.view.bounds
		blurView.alpha = 0
		
		originVC.view.addSubview(blurView)
		
		popupVC.view.backgroundColor = UIColor.clear
		
		UIView.animate(withDuration: self.duration, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
			originVC.view.tintAdjustmentMode = .dimmed
			popupVC.view.frame = endFrame
			blurView.alpha = 1
		}) { (finished: Bool) in
			blurView.removeFromSuperview()
			popupVC.view.insertSubview(blurView, at: 0)
			transitionContext .completeTransition(true)
		}
	}
	
	func transitionOut(direction: TransitionPosition, from popupVC: UIViewController, to originVC: UIViewController, transitionContext: UIViewControllerContextTransitioning) {
		originVC.view.isUserInteractionEnabled = true
		transitionContext.containerView.addSubview(originVC.view)
		transitionContext.containerView.addSubview(popupVC.view)
		
		let endFrame = direction.frame()
		
		guard let blurView = popupVC.view.subviews.first else {
			return
		}
		
		blurView.removeFromSuperview()
		originVC.view.addSubview(blurView)
		
		UIView.animate(withDuration: self.duration, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
			originVC.view.tintAdjustmentMode = .automatic
			popupVC.view.frame = endFrame
			blurView.alpha = 0
		}) { (finished: Bool) in
			transitionContext.completeTransition(true)
			blurView.removeFromSuperview()
		}
		
		// iOS 8 bug - https://joystate.wordpress.com/2014/09/02/ios8-and-custom-uiviewcontrollers-transitions/
		if #available(iOS 9.0, *) {
		}
		else{
			UIApplication.shared.keyWindow?.addSubview(originVC.view)
		}
	}
}
