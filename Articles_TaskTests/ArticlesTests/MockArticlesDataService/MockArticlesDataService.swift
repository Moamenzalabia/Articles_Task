//
//  MockArticlesDataService.swift
//  Articles_TaskTests
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation
@testable import Articles_Task

class MockArticlesDataService: ArticlesDataServiceProtocol {
    var isTestSuccess = true
    
    func requestFetchArticles(completion: @escaping (FetchArticlesCompletion)) {
        if self.isTestSuccess{
            if let path = Bundle.main.path(forResource: "articles_stub", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                    let articles = try JSONDecoder().decode(ArticleModel.self, from: data)
                    completion(articles, nil)
                } catch {
                    completion(nil, MockError.failedToParseJSONFile)
                }
            } else {
                completion(nil, MockError.InvalidFilenamePath)
            }
        } else {
            completion(nil, MockError.failedToLoadData)
        }
    }
}

extension MockArticlesDataService {
    enum MockError: Error {
        case failedToLoadData
        case failedToParseJSONFile
        case InvalidFilenamePath
    }
}
