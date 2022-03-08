//
//  ArticleResultMediaMetaDataModel.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

// MARK: - ArticleResultMediaMetaDataModel
struct ArticleResultMediaMetaDataModel: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}
