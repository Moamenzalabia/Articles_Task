//
//  ArticlesViewControllerUITests.swift
//  Articles_TaskUITests
//
//  Created by Moamen Abd Elgawad on 07/03/2022.
//

import XCTest

class ArticlesViewControllerUITests: XCTestCase {
    
    let application = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        application.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testArticleTableViewCell() {
        XCTAssert(application.tables.cells["articleTableViewCellIdentifier"].waitForExistence(timeout: 8), "can't load Article TableViewt cell")
    }
    
    func testLoading() {
        let activityIndicator = application.otherElements["activityIndicatorIdentifier"]
        application.launch()
        XCTAssertFalse(activityIndicator.waitForExistence(timeout: 8), "can't found activity indicator")
        
    }
    
}
