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
    
    // test if is vc correct type to show after start coordinator
    func testVCShown() throws {
        appCoordinator.start()
        let last = try XCTUnwrap(appCoordinator.viewControllers.last)
        XCTAssertTrue(last is MockViewController)
    }
    
    func testVCShowBoth() throws {
        appCoordinator.start()
        appCoordinator.addOther()
        let last = try XCTUnwrap(appCoordinator.viewControllers.last)
        XCTAssertTrue(last is SecondaryMockViewController)
    }
    
    func testVCShowBothCounter() {
        appCoordinator.start()
        appCoordinator.addOther()
        XCTAssertEqual(appCoordinator.viewControllers.count, 2)
    }
    
    func testReplaceWithoutFirst() throws {
        appCoordinator.replaceOther()
        let last = try XCTUnwrap(appCoordinator.viewControllers.last)
        XCTAssertTrue(last is SecondaryMockViewController)
    }
    
    func testViewControllerCountWhenTop() {
        appCoordinator.start()
        appCoordinator.replaceOther()
        XCTAssertEqual(appCoordinator.viewControllers.count, 1)
    }
    
    func testReplaceTopVC() throws {
        appCoordinator.start()
        appCoordinator.replaceOther()
        
        let last = try XCTUnwrap(appCoordinator.viewControllers.last)
        XCTAssertTrue(last is SecondaryMockViewController)
    }
    
    func testPop() throws {
        appCoordinator.start()
        appCoordinator.addOther()
        appCoordinator.popNavigation()
        
        let last = try XCTUnwrap(appCoordinator.viewControllers.last)
        XCTAssertTrue(last is MockViewController)
    }
    
    func testPopCounter() {
        appCoordinator.start()
        appCoordinator.addOther()
        appCoordinator.popNavigation()
        
        XCTAssertEqual(appCoordinator.viewControllers.count, 1)
    }
    
    func testPopWith0() throws {
        appCoordinator.start()
        appCoordinator.popNavigation()
        let last = try XCTUnwrap(appCoordinator.viewControllers.last)
        XCTAssertTrue(last is MockViewController)
    }
    
    func testPopWith0Counter() {
        appCoordinator.start()
        appCoordinator.popNavigation()
        XCTAssertEqual(appCoordinator.viewControllers.count, 1)
    }
}

final class MockCoordinatorViewController: GGCoordinator {
    
}

class MockCoordinator: GGCoordinator {
    
    init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        super.start()
        let vc = MockViewController()
        show(vc)
    }
    
    func addOther() {
        show(SecondaryMockViewController())
    }
    
    func replaceOther() {
        let vc = SecondaryMockViewController()
        top(vc)
    }
    
    func popNavigation() {
        pop()
    }
}

class MockViewController: UIViewController {
    
}

class SecondaryMockViewController: UIViewController {
    
}
