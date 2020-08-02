//
//  RecipesViewController.swift
//  GoodEatins
//
//  Created by Fábio França on 02/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    @IBOutlet weak var recipesCollectionView: UICollectionView!
    
    var selectedCategory: String?
    var recipes: [Recipe]?
    var data = DataSet()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipesCollectionView.delegate = self
        self.recipesCollectionView.dataSource = self
        
        recipes = data.getRecipes(forCategoryTitle: selectedCategory!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailRecipesViewController else{return}
        
        destination.recipe = sender as? Recipe
    }

}

extension RecipesViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipesCell", for: indexPath) as? RecipeCollectionViewCell else{return UICollectionViewCell()}
        
        if let recipe = recipes?[indexPath.item] {
            cell.setupRecipe(recipe: recipe)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.bounds.width
        let sizeCell = (size/2) - 15
        
        return CGSize(width: sizeCell, height: sizeCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: recipes?[indexPath.item])
    }
}
