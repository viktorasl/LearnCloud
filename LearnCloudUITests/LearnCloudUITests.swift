//
//  LearnCloudUITests.swift
//  LearnCloudUITests
//
//  Created by Viktoras Laukevicius on 04/10/2018.
//

import XCTest

class LearnCloudUITests: XCTestCase {
        
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
    
    func test_onLaunch_userIsGreeted() {
        let app = XCUIApplication()
        let entryText = app.staticTexts["Welcome Cloud Computing!"]
        XCTAssertTrue(entryText.exists)
    }
}
