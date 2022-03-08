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
        ArticlesTableView.delegate = self
        ArticlesTableView.dataSource = self
        ArticlesTableView.registerCellNib(cellClass: ArticleTableViewCell.self)
    }
    
    func startLoading() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self = self else {
                return
            }
            self.activityIndicator.startAnimating()
            self.ArticlesTableView.isHidden = true
        })
    }
    
    func stopLoading() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self = self else {
                return
            }
            self.activityIndicator.stopAnimating()
            self.ArticlesTableView.isHidden = false
        })
    }
    
    func setAccessibilityIdentifier() {
        ArticlesTableView.accessibilityIdentifier = "articlesTableViewIdentifier"
        activityIndicator.accessibilityIdentifier = "activityIndicatorIdentifier"
    }
}
