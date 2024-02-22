//
//  CategoryTableViewCell.swift
//  News-article-viper-pattern
//
//  Created by Muhammad Afif Maruf on 22/02/24.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categorySymbol: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryView.layer.cornerRadius     = 8.0
        categoryView.clipsToBounds          = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(category: CategoryEntity) {
        categorySymbol.image    = UIImage(systemName: category.symbol)
        categoryTitle.text      = category.name
        categoryTitle.textColor = .label
    }
    
}
