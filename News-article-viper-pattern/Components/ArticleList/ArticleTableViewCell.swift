//
//  ArticleTableViewCell.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleView.layer.cornerRadius  = 8.0
        articleView.clipsToBounds       = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(article: ArticleEntity) {
        articleImageView.load(from: article.urlToImage ?? "")
        articleImageView.contentMode = .scaleAspectFill
//        articleImageView.frame = articleView.bounds
//        articleImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        titleLabel.text     = article.title
        authorLabel.text    = article.author
    }
}
