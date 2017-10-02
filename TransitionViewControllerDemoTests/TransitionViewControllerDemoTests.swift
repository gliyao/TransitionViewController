//
//  TransitionViewControllerDemoTests.swift
//  TransitionViewControllerDemoTests
//
//  Created by Liyao on 02/10/2017.
//  Copyright © 2017 Liyao. All rights reserved.
//

import XCTest

class TransitionViewControllerDemoTests: XCTestCase {
	let transitionVC = TransitionViewController()
    
    func testInitAnimator() {
		let transtion = TransitionAnimator(style: .blur(.dark), presentFrom: .bottom, dismissTo: .bottom)
		XCTAssert(transitionVC.transition.style == transtion.style)
		XCTAssert(transitionVC.transition.presentFrom == transtion.presentFrom)
		XCTAssert(transitionVC.transition.dismissTo == transtion.dismissTo)
    }
}
