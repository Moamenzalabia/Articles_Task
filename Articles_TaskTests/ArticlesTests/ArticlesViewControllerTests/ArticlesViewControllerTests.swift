//
//  ArticlesViewControllerTests.swift
//  Articles_TaskTests
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import XCTest
@testable import Articles_Task

class ArticlesViewControllerTests: XCTestCase {
    
    var articlesViewController: ArticlesViewController!
    var mockDataService: MockArticlesDataService!
    
    override func setUp() {
        super.setUp()
        articlesViewController = ArticlesViewController()
        mockDataService = MockArticlesDataService()
        articlesViewController.viewModel = ArticlesViewModel(service: mockDataService)
        articlesViewController?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        articlesViewController = nil
        mockDataService = nil
        super.tearDown()
    }
    
    func testDequeueArticleTableViewCell() {
        let expectation = XCTestExpectation(description: "Failed to Dequeue ArticleTableViewCell")
        expectation.assertForOverFulfill = false
        
        articlesViewController.initViewModel()
        articlesViewController.viewModel?.updateLoadingStatus = {
            if self.articlesViewController.viewModel?.contentState == .populated {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 6)
        let cell = articlesViewController?.tableView(articlesViewController.ArticlesTableView, cellForRowAt: IndexPath(
            row: 1,
            section: 0))
        XCTAssertTrue(cell is ArticleTableViewCell)
    }
    
    func testNumberOfItemsInSection() {
        let expectation = XCTestExpectation(description: "Fetching Articles Success did finish")
        expectation.assertForOverFulfill = false
        
        articlesViewController.initViewModel()
        articlesViewController.viewModel?.updateLoadingStatus = {
            if self.articlesViewController.viewModel?.contentState == .populated {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 6)
        XCTAssertEqual(articlesViewController?.tableView(articlesViewController.ArticlesTableView, numberOfRowsInSection: 0), 3)
    }
    
    func testFetchArticlesSuccessScenario() {
        let expectation = expectation(description: "Fetching Articles Success did finish")
        expectation.assertForOverFulfill = false
        
        articlesViewController.initViewModel()
        articlesViewController.viewModel?.updateLoadingStatus = {
            if self.articlesViewController.viewModel?.contentState == .populated {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 6)
        
        XCTAssertEqual(articlesViewController.viewModel?.contentState, .populated)
        XCTAssertEqual(articlesViewController.viewModel?.numberOfArticlesCells, 3)
        XCTAssertNotNil(articlesViewController.viewModel?.articlesUIData)
        XCTAssertNil(articlesViewController.viewModel?.alertMessage)
    }
    
    func testFetchArticlesFailureScenario() {
        let expectation = XCTestExpectation(description: "Fetch Articles failure did finish")
        expectation.assertForOverFulfill = false
        
        mockDataService.isTestSuccess = false
        
        articlesViewController.initViewModel()
        articlesViewController.viewModel?.updateLoadingStatus = {
            if self.articlesViewController.viewModel?.contentState == .error {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 6)
        
        XCTAssertEqual(articlesViewController.viewModel?.contentState, .error)
        XCTAssertEqual(articlesViewController.viewModel?.numberOfArticlesCells, 0)
        XCTAssertNil(articlesViewController.viewModel?.articlesUIData)
        XCTAssertNotNil(articlesViewController.viewModel?.alertMessage)
        
    }
    
    func testDidSelectRowAtArticlesTableView() {
        let expectation = XCTestExpectation(description: "Did Select Item")
        expectation.assertForOverFulfill = false
        
        articlesViewController.initViewModel()
        articlesViewController.viewModel?.updateLoadingStatus = {
            if self.articlesViewController.viewModel?.contentState == .error {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 6)
        
        let indexPath = IndexPath(row: 1, section: 0)
        articlesViewController.tableView(articlesViewController.ArticlesTableView, didSelectRowAt: indexPath)
        XCTAssertNotNil(articlesViewController.viewModel?.userDidSelectArticle(at: indexPath))
    }
    
    func testStartLoading() {
        articlesViewController.startLoading()
        XCTAssertTrue(articlesViewController.ArticlesTableView.isHidden)
        XCTAssertTrue(articlesViewController.activityIndicator.isAnimating)
    }
    
    func testStopLoading() {
        articlesViewController.stopLoading()
        XCTAssertFalse(articlesViewController.ArticlesTableView.isHidden)
        XCTAssertFalse(articlesViewController.activityIndicator.isAnimating)
    }
    
    func testSetupAccessibilityIdentifier() {
        XCTAssertEqual(articlesViewController.ArticlesTableView.accessibilityIdentifier, "articlesTableViewIdentifier")
        XCTAssertEqual(articlesViewController.activityIndicator.accessibilityIdentifier, "activityIndicatorIdentifier")
    }
}
