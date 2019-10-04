//
//  Anchor+AddonsTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class AnchorAddonsTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    func testInset() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.inset(to: self.container, withInset: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 4, "Should have 4 constraints installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(constraints[1].constant, -20, "Should be 20")
        XCTAssertEqual(constraints[2].constant, 20, "Should be 20")
        XCTAssertEqual(constraints[3].constant, -20, "Should be 20")
    }

    func testAspectRadio() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.aspectRadio(constant: 250 / 2)
        }

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].multiplier, 125, "Should be 125")
        XCTAssertEqual(constraints[0].firstAttribute, NSLayoutConstraint.Attribute.width, "Should be width")
        XCTAssertEqual(constraints[0].secondAttribute, NSLayoutConstraint.Attribute.height, "Should be height")
    }

    static var allTests = [
        ("testInset", testInset), ("testAspectRadio", testAspectRadio)
    ]
}
