//
//  ArticleTableViewCell.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleBylineLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    
    // MARK: - Properties
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCornerRadius(10)
        containerView.addShadowWith()
    }
    
}
