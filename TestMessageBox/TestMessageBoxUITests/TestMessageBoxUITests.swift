//
//  TestMessageBoxUITests.swift
//  TestMessageBoxUITests
//
//  Created by Christine Jiang on 30/08/17.
//  Copyright © 2017 Christine Jiang. All rights reserved.
//

import XCTest

class TestMessageBoxUITests: XCTestCase {
        
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
        let areYouSureButton = app.buttons["Are you sure?"]
        areYouSureButton.tap()
        
        let alertsQuery = app.alerts
        alertsQuery.buttons["Cancel"].tap()
        areYouSureButton.tap()
        alertsQuery.buttons["OK"].tap()
        app.buttons["You should know this."].tap()
        app.alerts["You should know this."].buttons["OK"].tap()
        
        app.buttons["Enter Password"].tap()
        app.alerts["Enter Password"].collectionViews.textFields["Enter your user name"].typeText("Christine")
        
        let enterPasswordAlert = app.alerts["Enter Password"]
        let collectionViewsQuery = enterPasswordAlert.collectionViews
        
        let enterYourPasswordSecureTextField = collectionViewsQuery.secureTextFields["Enter your password"]
        enterYourPasswordSecureTextField.tap()
        enterYourPasswordSecureTextField.typeText("thisIsMyPassword")
        enterPasswordAlert.buttons["Login"].tap()
        
        
        
       
    }
    
}
