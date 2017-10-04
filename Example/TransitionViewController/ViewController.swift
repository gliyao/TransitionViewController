//
//  ViewController.swift
//  TransitionViewController
//
//  Created by gliyao@gmail.com on 10/05/2017.
//  Copyright (c) 2017 gliyao@gmail.com. All rights reserved.
//

import UIKit
import TransitionViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func presentPopupVCAction(_ sender: Any) {
		self.present(BlurViewController(), animated: true, completion: nil)
	}
}

