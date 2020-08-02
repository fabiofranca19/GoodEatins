//
//  DetailRecipesViewController.swift
//  GoodEatins
//
//  Created by Fábio França on 02/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class DetailRecipesViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    let data = DataSet()
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.layer.cornerRadius = 10
        setupDetails()
    }
    
    func setupDetails() {
        guard let recipe = recipe else{return}
        
        self.detailImage.image = UIImage(named: recipe.imageName)
        self.titleDetailLabel.text = recipe.title
        self.detailLabel.text = recipe.instructions
    }


}
