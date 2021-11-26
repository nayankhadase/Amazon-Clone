//
//  SeeAllProductsViewController.swift
//  collectionView In Table view cell
//
//  Created by nayan.khadase on 25/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class SeeAllProductsViewController: UIViewController {

    @IBOutlet weak var seeAllTableView: UITableView!
    var allProdData: [Products]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeAllTableView.delegate = self
        seeAllTableView.dataSource = self
    }
    


}

extension SeeAllProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProdData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = seeAllTableView.dequeueReusableCell(withIdentifier: "SeeAllProductTableViewCell", for: indexPath) as! SeeAllProductTableViewCell
        cell.prodName.text = allProdData?[indexPath.row].name
        cell.prodPrice.text = allProdData?[indexPath.row].price
        cell.prodDesc.text = allProdData?[indexPath.row].description
        cell.prodImage.image = UIImage(named: allProdData?[indexPath.row].image_name ?? "bagimage1")
        
        return cell
    }
    
}
