//
//  CategoryTableViewCell.swift
//  GoodEatins
//
//  Created by Fábio França on 02/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = 10
    }
    
    func setupCategory(category: FoodCategory) {
        guard let image = UIImage(named: category.imageName) else{return}
        
        categoryImage.image = image
        categoryTitle.text = category.title
    }

}
