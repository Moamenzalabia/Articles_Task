//
//  ArticlesViewModelProtocol.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

/// Articles ViewModel Protocol
protocol ArticlesViewModelProtocol {
    /// update loading status closure to update controller when contentState is changed
    var updateLoadingStatus: (() -> Void)? { get set }
    /// update articles UIData closure to update controller when Article Data is changed
    var updateArticlesUIData: (() -> Void)? { get set }
    /// show error message alert closure to show alert when an error is happend
    var showErrorMessageAlert: (() -> Void)? { get set }
    /// articles UIData ViewModel to set article view data
    var articlesUIData: [ArticleListCellUIModel]? { get }
    /// controller content state
    var contentState: ContentState { get }
    /// alert message string
    var alertMessage: String? { get }
    /// number of articles Cell
    var numberOfArticlesCells: Int? { get }
    /// fetch articles data
    func fetchArticles()
    /// get article UI data
    func getArticleUIDataModel( at indexPath: IndexPath ) -> ArticleListCellUIModel?
    /// user did select an article to show it's details
    func userDidSelectArticle( at indexPath: IndexPath )
}
