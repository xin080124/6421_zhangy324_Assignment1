//
//  IpadDraw1483998UITests.swift
//  IpadDraw1483998UITests
//
//  Created by Nancy Zhang on 17/08/17.
//  Copyright © 2017 Nancy Zhang. All rights reserved.
//

import XCTest

class IpadDraw1483998UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    
        
        let app = XCUIApplication()
        app.buttons["sett"].tap()
        
        let window = app.children(matching: .window).element(boundBy: 0)
        window.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
        
        let element = window.children(matching: .other).element(boundBy: 1)
        element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element.typeText("hlkjh")
        app.typeText("ljkh")
        element.children(matching: .other).element.children(matching: .other).element.tap()
        
        
    }
    
}
