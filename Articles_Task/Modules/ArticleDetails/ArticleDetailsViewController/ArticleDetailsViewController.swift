//
//  ArticleDetailsViewController.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    
    // MARK: - Properties
    var articleData: ArticleResultModel?
    static func instance(article: ArticleResultModel?)-> ArticleDetailsViewController {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
        vc.articleData = article
        return vc
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupArticleData()
    }
    
    func setupArticleData() {
        navigationItem.title = articleData?.section
        articleTitleLabel.text = articleData?.title
        articleDescriptionLabel.text = articleData?.abstract
        articleDateLabel.text = articleData?.published_date
        articleImage.setImage(imageUrl: articleData?.media?.last?.media_metadata?.last?.url ?? "")
    }
    
    func setupUI(){
        containerView.roundedFromSide(corners: [.topLeft, .topRight], cornerRadius: 15)
    }
    
}
