//
//  SourceTableViewCell.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class SourceTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sourceView.layer.cornerRadius       = 8.0
        sourceView.clipsToBounds            = true
    }

     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(source: SourceEntity) {
        titleLabel.text         = source.name
        titleLabel.textColor    = .label
        categoryLabel.text      = source.category
        descLabel.text          = source.description
    }
}
