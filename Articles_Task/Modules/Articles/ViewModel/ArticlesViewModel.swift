//
//  ArticlesViewModel.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

// MARK: - ActivityViewModel
class ArticlesViewModel: ArticlesViewModelProtocol {
    
    private var dataService: ArticlesDataServiceProtocol?
    
    private var articles: [ArticleResultModel] = [ArticleResultModel]()
    
    var updateLoadingStatus: (() -> Void)?
    
    var updateArticlesUIData: (() -> Void)?
    
    var showErrorMessageAlert: (() -> Void)?
    
    var articlesUIData: [ArticleListCellUIModel]? {
        didSet {
            updateArticlesUIData?()
        }
    }
    
    var contentState: ContentState = .empty {
        didSet {
            updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            showErrorMessageAlert?()
        }
    }
    
    init(service: ArticlesDataServiceProtocol?) {
        dataService = service
    }
    
    var numberOfArticlesCells: Int? {
        return articlesUIData?.count
    }
    
    var selectedArticle: ArticleResultModel?
    
    func fetchArticles() {
        contentState = .loading
        dataService?.requestFetchArticles { [weak self] (articles, error) in
            guard let self = self else {
                return
            }
            guard error == nil else {
                self.contentState = .error
                self.alertMessage = error?.localizedDescription
                return
            }
            if let articles = articles?.results {
                self.processFetchedArticles(articles: articles)
            }
            self.contentState = .populated
        }
    }
    
    func processFetchedArticles(articles: [ArticleResultModel]) {
        self.articles = articles // Cache
        var articlesDataUI = [ArticleListCellUIModel]()
        for article in articles {
            articlesDataUI.append(createArticleDataViewModel(article: article) )
        }
        self.articlesUIData = articlesDataUI
    }
    
    func getArticleUIDataModel( at indexPath: IndexPath ) -> ArticleListCellUIModel? {
        return articlesUIData?[indexPath.row]
    }
    
    func createArticleDataViewModel(article: ArticleResultModel ) -> ArticleListCellUIModel {
        //Wrap a description
        var descTextContainer: [String] = [String]()
        
        let articleImageURL = article.media?.first?.media_metadata?.first?.url
        
        if let source = article.source {
            descTextContainer.append(source)
        }
        if let title = article.title {
            descTextContainer.append(title)
        }
        let desc = descTextContainer.joined(separator: " - ")
        
        return ArticleListCellUIModel(bylineText: article.byline, descText: desc, imageUrl: articleImageURL, published_dateText:  article.published_date ?? "")
    }
    
    func userDidSelectArticle( at indexPath: IndexPath ) {
        let article = articles[indexPath.row]
        selectedArticle = article
        print(article.title ?? "")
    }
}
