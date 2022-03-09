//
//  ArticlesViewController.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 07/03/2022.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var articlesTableView: UITableView!
    
    // MARK: - Properties
    var viewModel: ArticlesViewModelProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ArticlesViewModel(service: ArticlesDataService())
        setupTableView()
        setAccessibilityIdentifier()
        initViewModel()
    }
    
}

