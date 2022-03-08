//
//  ArticlesViewController+UI.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

// MARK: - ArticlesViewController Extension For UI Configurations
extension ArticlesViewController {
    
    func setupTableView() {
        ArticlesTableView.delegate = self
        ArticlesTableView.dataSource = self
        ArticlesTableView.registerCellNib(cellClass: ArticleTableViewCell.self)
    }
}
