//
//  ArticleDetailsViewControllerTests.swift
//  Articles_TaskTests
//
//  Created by Moamen Abd Elgawad on 09/03/2022.
//

import XCTest
@testable import Articles_Task

class ArticleDetailsViewControllerTests: XCTestCase {
    
    var articleDetailsViewController: ArticleDetailsViewController!
    var selectedArticle: ArticleResultModel!
    
    override func setUp() {
        super.setUp()
        selectedArticle = ArticleResultModel(uri: "uri", url: "url", id: 1, asset_id: 1, source: "source", published_date: "published_date", updated: "updated", section: "section", subsection: "subsection", nytdsection: "nytdsection", adx_keywords: "adx_keywords", column: "column", byline: "byline", type: "type", title: "title", abstract: "abstract", des_facet: [], org_facet: [], per_facet: [], geo_facet: [], media: [], eta_id: 0)
        articleDetailsViewController = ArticleDetailsViewController.instance(article: selectedArticle)
        articleDetailsViewController?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        articleDetailsViewController = nil
        super.tearDown()
    }
    
    func testSetupArticleData() {
        articleDetailsViewController.setupArticleData()
        XCTAssertEqual(articleDetailsViewController.articleTitleLabel.text, selectedArticle.title)
        XCTAssertEqual(articleDetailsViewController.articleDescriptionLabel.text, selectedArticle.abstract)
        XCTAssertEqual(articleDetailsViewController.articleDateLabel.text, selectedArticle.published_date)
    }
    
}
