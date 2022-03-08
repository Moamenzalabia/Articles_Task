//
//  ArticlesViewController+Navigation.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

// MARK: - ArticlesViewController Navigation Extension To Article Details Screen
extension ArticlesViewController {
    func navigateToArticleDetails(with article: ArticleResultModel?) {
        let activityViewController = ArticleDetailsViewController.instance(article: article)
        navigationController?.pushViewController(activityViewController, animated: true)
    }
}
