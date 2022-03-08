//
//  ArticleResultMediaModel.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

// MARK: - ArticleResultMediaModel
struct ArticleResultMediaModel: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approved_for_syndication: Int?
    let media_metadata: [ArticleResultMediaMetaDataModel]?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case media_metadata = "media-metadata"
    }
    
}
