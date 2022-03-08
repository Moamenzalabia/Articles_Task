//
//  ArticlesViewModelTests.swift
//  Articles_TaskTests
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import XCTest
@testable import Articles_Task

class ArticlesViewModelTests: XCTestCase {
    
    var viewModel: ArticlesViewModel!
    var mockDataService: MockArticlesDataService!
    
    override func setUp() {
        super.setUp()
        mockDataService = MockArticlesDataService()
        viewModel = ArticlesViewModel(service: mockDataService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockDataService = nil
        super.tearDown()
    }
    
    func testFetchArticlesSuccess() {
        let expectation = expectation(description: "Fetching Articles Success did finish")
        expectation.assertForOverFulfill = false
        
        viewModel.fetchArticles()
        viewModel.updateLoadingStatus = {
            if self.viewModel.contentState == .populated {
                expectation.fulfill()
            }
        }
        
        XCTAssertEqual(viewModel.contentState, .loading)
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(viewModel.contentState, .populated)
        XCTAssertEqual(viewModel.numberOfArticlesCells, 3)
        XCTAssertNotNil(viewModel.articlesUIData)
        XCTAssertNil(viewModel.alertMessage)
    }
    
    func testFetchArticlesFailure() {
        let expectation = XCTestExpectation(description: "Fetch Articles failure did finish")
        expectation.assertForOverFulfill = false
        
        mockDataService.isTestSuccess = false
        
        viewModel.fetchArticles()
        viewModel.updateLoadingStatus = {
            if self.viewModel.contentState == .error {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(viewModel.contentState, .error)
        XCTAssertNotNil(viewModel.alertMessage)
        XCTAssertEqual(viewModel.numberOfArticlesCells, 0)
        XCTAssertNil(viewModel.articlesUIData)
    }
    
}

