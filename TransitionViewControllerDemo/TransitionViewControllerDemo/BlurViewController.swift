//
//  BlurViewController.swift
//  TransitionViewControllerDemo
//
//  Created by Liyao on 29/09/2017.
//  Copyright © 2017 Liyao. All rights reserved.
//

import UIKit

// 1. Subclass for your dialog view controller
class BlurViewController: TransitionViewController {
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		// 2. Change transition here!!
		self.transition = TransitionAnimator(style: .blur(.dark), presentFrom: .bottom, dismissTo: .bottom)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
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
