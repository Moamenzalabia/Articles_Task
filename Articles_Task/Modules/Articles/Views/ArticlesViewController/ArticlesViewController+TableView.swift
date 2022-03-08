//
//  ArticlesViewController+TableView.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

// MARK: - ArticlesViewController Extension For UITableViewDelegate
extension ArticlesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

// MARK: - ArticlesViewController Extension For UITableViewDataSource
extension ArticlesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as ArticleTableViewCell
        return cell
    }
    
}
