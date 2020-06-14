//
//  ANODATests.swift
//  ANODATests
//
//  Created by mac on 14.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import XCTest
@testable import ANODA

class ANODATests: XCTestCase {
    
    override func setUpWithError() throws {
        super.setUp()
        
    }
    
    override func tearDownWithError() throws {
    
        super.tearDown()
    }
    
    func testEqualityForAllGivenLayoutValues() {
        
        let sut = HomePostCell()

        let tesTopAmount = 8
        let testLeftAmount = 8
        let testWidthAmount = 40
        let testHeightAmount = 40

        sut.setupSnpNameLabels(topAmount: tesTopAmount, leftAmount: testLeftAmount, widthAmount: testWidthAmount, heightAmount: testHeightAmount)

        let top = sut.top
        XCTAssert(top == 8, "Value equals 8")
        
    }
}
