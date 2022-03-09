//
//  ArticlesViewController+Data.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation

// MARK: - ArticlesViewController Extension For initialize ArticlesViewModel and Fetching Articles
extension ArticlesViewController {
    
    func initViewModel() {
        
        viewModel?.showErrorMessageAlert = { [weak self] in
            guard let self = self else {
                return
            }
            if let message = self.viewModel?.alertMessage {
                self.showAlertError(message: message)
            }
        }
        
        viewModel?.updateLoadingStatus = { [weak self] in
            guard let self = self else {
                return
            }
            switch self.viewModel?.contentState {
                case .empty, .error:
                    self.stopLoading()
                case .loading:
                    self.startLoading()
                case .populated:
                    self.stopLoading()
                default :
                    break
            }
        }
        
        viewModel?.updateArticlesUIData = { [weak self] in
            guard let self = self else {
                return
            }
            self.articlesTableView.reloadData()
        }
        viewModel?.fetchArticles()
    }
}
