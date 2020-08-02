//
//  RecipeCollectionViewCell.swift
//  GoodEatins
//
//  Created by Fábio França on 02/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImage.layer.cornerRadius = 10
    }
    
    func setupRecipe(recipe: Recipe) {
        guard let image = UIImage(named: recipe.imageName) else{return}
        
        self.recipeImage.image = image
    }
    
}
