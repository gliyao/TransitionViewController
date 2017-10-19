//
//  PromotionViewController.swift
//  TransitionViewController_Example
//
//  Created by Liyao on 19/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import TransitionViewController

class PromotionViewController: TransitionViewController {

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		// 2. Change transition here!!
		self.transition = TransitionAnimator(style: .blur(.dark), presentFrom: .none, dismissTo: .none)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		// 2. Change transition here!!
		self.transition = TransitionAnimator(style: .blur(.dark), presentFrom: .none, dismissTo: .none)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		let tap = UITapGestureRecognizer(target: self, action: #selector(BlurViewController.didTap(sender:)))
		self.view.addGestureRecognizer(tap)
	}
	
	@objc func didTap(sender: UITapGestureRecognizer) {
		self.dismiss(animated: true, completion: nil)
	}
}
