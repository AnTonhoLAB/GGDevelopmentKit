//
//  Navigation.swift
//  GGDevelopmentKitTests
//
//  Created by George Vilnei Arboite Gomes on 30/12/21.
//  Copyright © 2021 George Gomes. All rights reserved.
//

import XCTest

@testable import GGDevelopmentKit

class NavigationTests: XCTestCase {
    enum TestRoute {
        case next
    }
    
    var navigation: Navigation<TestRoute>!
    
    override func tearDown() {
        self.navigation = nil
    }
  
    override func setUp() {
        super.setUp()
        let text = "information"
        self.navigation = Navigation(type: .next, info: text)
    }
    
    func testNavigationRoute() {
        XCTAssertEqual(navigation.info as? String, "information")
    }
    
    func testGetIngo() {
        let info: String = navigation.getInfo() ?? ""
        XCTAssertEqual(info, "information")
    }
}
