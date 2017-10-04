//
//  TransitionViewController.swift
//  TransitionViewControllerDemo
//
//  Created by Liyao on 29/09/2017.
//  Copyright © 2017 Liyao. All rights reserved.
//

import Foundation
import UIKit

open class TransitionViewController: UIViewController {
	open var transition = TransitionAnimator(style: .blur(.dark), presentFrom: .bottom, dismissTo: .bottom)
	
	override open func viewDidLoad() {
		super.viewDidLoad()
		view.frame = UIScreen.main.bounds
		self.transitioningDelegate = self.transition
		self.modalPresentationStyle = .custom
	}
}
