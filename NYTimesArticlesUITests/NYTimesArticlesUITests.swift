//
//  NYTimesArticlesUITests.swift
//  NYTimesArticlesUITests
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import XCTest

class NYTimesArticlesUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        // Since UI tests are more expensive to run, it's usually a good idea to exit if a failure was encountered
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        
        // We send a command line argument to our app, to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testNavigationBarUI() {
        app.launch()
        
        sleep(10)
        
        let nyTimesMostPopularNavigationBar = app.navigationBars["NY Times Most Popular"]
        
        XCTAssert(nyTimesMostPopularNavigationBar.exists)
        XCTAssert(nyTimesMostPopularNavigationBar.buttons["menu"].exists)
        XCTAssert(nyTimesMostPopularNavigationBar.buttons["slide icon"].exists)
    }
    
    func testArticleTableInteraction() {
        // Assert that we are displaying the tableview
        app.launch()
        
        sleep(25)
        let cells = app.tables.cells
        //snapshot("App Screenshot Launch with indicator")
        
        // Get an array of cells
        if cells.count > 0 {
            //snapshot("after load")
            let count: Int = (cells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = cells.element(boundBy: i)
                
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                
                // Does this actually take us to the next screen
                tableCell.tap()
                
                if i == (count - 1) {
                    //snapshot("detail View")
                    promise.fulfill()
                }
                
                // Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
            
            waitForExpectations(timeout: 50, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
    
    
    
    //func testExample() {
    
    //let app = XCUIApplication() //create app
    
    //app.launch()
    
    //sleep(10)
    
    //XCTAssertTrue(app.navigationBars.staticTexts["The New York Times"].exists) //check navigation bar title
    
    //XCTAssertTrue(app.navigationBars.buttons["NY Times Most Popular"].exists) //check button with title Test
    
    
    // Use recording to get started writing UI tests.
    //XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Plastic Bags to Be Banned in New York; Second Statewide Ban, After California"]/*[[".cells.staticTexts[\"Plastic Bags to Be Banned in New York; Second Statewide Ban, After California\"]",".staticTexts[\"Plastic Bags to Be Banned in New York; Second Statewide Ban, After California\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    /*let nyTimesMostPopularButton = app.navigationBars["The New York Times"].buttons["NY Times Most Popular"]
     nyTimesMostPopularButton.tap()
     app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"2019-03-29")/*[[".cells.containing(.staticText, identifier:\"The Lost History of One of the World’s Strangest Science Experiments\")",".cells.containing(.staticText, identifier:\"2019-03-29\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["By CARL ZIMMER"].tap()
     nyTimesMostPopularButton.tap()
     
     XCTAssertTrue(app.navigationBars.buttons == "test")*/
    
    /*let app = XCUIApplication()
     app.statusBars.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 0)/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
     
     let nyTimesMostPopularButton = app.navigationBars["The New York Times"].buttons["NY Times Most Popular"]
     nyTimesMostPopularButton.tap()
     
     let tablesQuery = app.tables
     tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Plastic Bags to Be Banned in New York; Second Statewide Ban, After California"]/*[[".cells.staticTexts[\"Plastic Bags to Be Banned in New York; Second Statewide Ban, After California\"]",".staticTexts[\"Plastic Bags to Be Banned in New York; Second Statewide Ban, After California\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
     nyTimesMostPopularButton.tap()
     tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Supreme Court Refuses to Block Ban on Bump Stocks"]/*[[".cells.staticTexts[\"Supreme Court Refuses to Block Ban on Bump Stocks\"]",".staticTexts[\"Supreme Court Refuses to Block Ban on Bump Stocks\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
     tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2019-03-08"]/*[[".cells.staticTexts[\"2019-03-08\"]",".staticTexts[\"2019-03-08\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
     
     let nyTimesMostPopularNavigationBar = app.navigationBars["NY Times Most Popular"]
     nyTimesMostPopularNavigationBar.buttons["Search"].tap()
     
     let menuButton = nyTimesMostPopularNavigationBar.buttons["menu"]
     menuButton.tap()
     menuButton.tap()
     
     let slideIconButton = nyTimesMostPopularNavigationBar.buttons["slide icon"]
     slideIconButton.tap()
     slideIconButton.tap()
     app.otherElements.containing(.navigationBar, identifier:"The New York Times").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
     nyTimesMostPopularButton.tap()*/
    
    //}
    
}
