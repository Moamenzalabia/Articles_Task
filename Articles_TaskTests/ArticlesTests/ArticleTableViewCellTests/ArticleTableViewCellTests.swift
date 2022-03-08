//
//  ArticleTableViewCellTests.swift
//  Articles_TaskTests
//
//  Created by Moamen Abd Elgawad on 07/03/2022.
//

import XCTest
@testable import Articles_Task

class ArticleTableViewCellTests: XCTestCase {
    
    var articleTableViewCell: ArticleTableViewCell!
    var articleModel: ArticleListCellUIModel!
    
    override func setUp() {
        super.setUp()
        articleModel = ArticleListCellUIModel(bylineText: "By Lynsey Addario", descText: "Russian forces fire on evacuees, leaving 4 people dead outside Kyiv", imageUrl: "imageUrl", published_dateText: "2022-03-06")
        articleTableViewCell =  ArticleTableViewCell.loadXib(bundle: .main)
    }
    
    override func tearDown() {
        articleTableViewCell = nil
        super.tearDown()
    }
    
    func testConfigureArticleTableViewCell() {
        articleTableViewCell.configure(articleModel)
        XCTAssertEqual(articleTableViewCell.articleBylineLabel.text, articleModel.bylineText)
        XCTAssertEqual(articleTableViewCell.articleDescriptionLabel.text, articleModel.descText)
        XCTAssertEqual(articleTableViewCell.articleDateLabel.text, articleModel.published_dateText)
    }
}
