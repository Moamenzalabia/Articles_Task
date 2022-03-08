//
//  ArticleModel.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

// MARK: - ArticleModel
struct ArticleModel: Codable {
    let status: String?
    let copyright: String?
    let num_results: Int?
    let results: [ArticleResultModel]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
}
