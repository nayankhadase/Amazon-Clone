//
//  ViewController.swift
//  collectionView In Table view cell
//
//  Created by nayan.khadase on 25/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var decodedData = DecodedData()
    var categoryArray: ModelData?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        decodedData.delegate = self
        
        
        decodedData.loadJSONData(for: "EcommerceJson")
        
    }

    func moveToProductListing(index: Int){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SeeAllProductsViewController") as? SeeAllProductsViewController else {
            return
        }
        vc.allProdData = categoryArray?.response?[index].products
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.category.text = categoryArray?.response?[indexPath.row].category_name
        cell.productArray = categoryArray?.response?[indexPath.row].products
        cell.index = indexPath.row
        cell.onClickSeeAllClosure = { index in
            if let indexp = index{
                self.moveToProductListing(index: indexp)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}

extension ViewController: DecodedDataDelegate{
    func didUpdateProductDetails(for parseData: ModelData) {
        categoryArray = parseData
    }
    
    
}
