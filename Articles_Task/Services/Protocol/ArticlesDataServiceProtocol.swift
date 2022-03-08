//
//  ArticlesDataServiceProtocol.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation
/// Articles DataService Protocol
typealias FetchArticlesCompletion = ( (ArticleModel?, Error?) -> Void)
protocol ArticlesDataServiceProtocol {
    /// Method to request fetching articles data.
    /// - Parameters:
    ///     - completion: An response *ArticleModel*
    func requestFetchArticles(completion: @escaping (FetchArticlesCompletion))
}
