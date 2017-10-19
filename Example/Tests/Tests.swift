import UIKit
import XCTest
import Pods_TransitionViewController_Tests

class Tests: XCTestCase {
	
	func testInitAnimator() {
		let transitionVC = TransitionViewController()
		let transtion = TransitionAnimator(style: .blur(.dark), presentFrom: .bottom, dismissTo: .bottom)
		XCTAssert(transitionVC.transition.style == transtion.style)
		XCTAssert(transitionVC.transition.presentFrom == transtion.presentFrom)
		XCTAssert(transitionVC.transition.dismissTo == transtion.dismissTo)
	}
}
