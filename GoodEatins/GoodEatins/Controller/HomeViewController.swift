//
//  ViewController.swift
//  GoodEatins
//
//  Created by Fábio França on 02/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryTableVIew: UITableView!
    
    let data = DataSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableVIew.delegate = self
        categoryTableVIew.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesDestination = segue.destination as? RecipesViewController {
            guard let selectedCategory = sender as? String else{return}
            recipesDestination.selectedCategory = selectedCategory
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryTableViewCell else{return UITableViewCell()}
        
        cell.setupCategory(category: data.categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toRecipes", sender: data.categories[indexPath.row].title)
    }
    
}

