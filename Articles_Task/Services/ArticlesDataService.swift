//
//  ArticlesDataService.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation
import Moya

class ArticlesDataService: ArticlesDataServiceProtocol{
    
    fileprivate let provider = MoyaProvider<ArticlesService>(endpointClosure: { (target: ArticlesService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
            default:
                let httpHeaderFields = ["Content-Type" : "application/json"]
                return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func requestFetchArticles(completion: @escaping (FetchArticlesCompletion)) {
        provider.request(.fetchArticles) { result in
            switch result {
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        let articles = try decoder.decode(ArticleModel.self, from: response.data)
                        completion(articles, nil)
                    } catch (let error) {
                        completion(nil, error)
                    }
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
}
