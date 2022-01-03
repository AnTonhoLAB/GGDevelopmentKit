//
//  CoordinatorTests.swift
//  GGDevelopmentKitTests
//
//  Created by George Vilnei Arboite Gomes on 31/12/21.
//  Copyright © 2021 George Gomes. All rights reserved.
//

import XCTest

@testable import GGDevelopmentKit

class CoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var appCoordinator: MockCoordinator!
    
    override func tearDown() {
        self.navigationController = nil
        self.appCoordinator = nil
    }
  
    override func setUp() {
        super.setUp()
        
        navigationController = UINavigationController()
        appCoordinator = MockCoordinator(rootViewController: navigationController)
    }
    
    func testNavigationRoute() {
        appCoordinator.start()
        XCTAssertEqual(appCoordinator.rootViewController, navigationController)
    }
    
    func testGetInfo() {
        
    }
}

final class MockCoordinatorViewController: GGCoordinator {
    
}

class MockCoordinator: GGCoordinator {
    
    init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let vc = MockViewController()
        rootViewController.addChild(vc)
    }
}

class MockViewController: UIViewController {
    
}
