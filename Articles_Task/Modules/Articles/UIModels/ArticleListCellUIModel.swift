//
//  ArticleListCellUIModel.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

// MARK: - ArticleListCellUIModel
struct ArticleListCellUIModel: Codable {
    let bylineText: String?
    let descText: String?
    let imageUrl: String?
    let published_dateText: String?
}
