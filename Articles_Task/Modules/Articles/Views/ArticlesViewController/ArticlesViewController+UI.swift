//
//  ArticlesViewController+UI.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

// MARK: - ArticlesViewController Extension For UI Configurations
extension ArticlesViewController {
    
    func showAlertError(message: String) {
        self.showDefaultAlert(title: "Error", message: message, actionTitle: "OK") { [weak self] in
            guard let self = self else {
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setupTableView() {
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        articlesTableView.registerCellNib(cellClass: ArticleTableViewCell.self)
    }
    
    func startLoading() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self = self else {
                return
            }
            self.activityIndicator.startAnimating()
            self.articlesTableView.isHidden = true
        })
    }
    
    func stopLoading() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self = self else {
                return
            }
            self.activityIndicator.stopAnimating()
            self.articlesTableView.isHidden = false
        })
    }
    
    func setAccessibilityIdentifier() {
        articlesTableView.accessibilityIdentifier = "articlesTableViewIdentifier"
        activityIndicator.accessibilityIdentifier = "activityIndicatorIdentifier"
    }
}
