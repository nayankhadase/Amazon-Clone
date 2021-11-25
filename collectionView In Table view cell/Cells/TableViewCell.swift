//
//  TableViewCell.swift
//  collectionView In Table view cell
//
//  Created by nayan.khadase on 25/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var productArray: [Products]?{
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func seeAllButton(_ sender: Any) {
    }
}
extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(productArray?.count ?? 0)
        return productArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.productLabel.text = productArray?[indexPath.row].name
        cell.productImage.image = UIImage(named: productArray?[indexPath.row].image_name ?? "bagimage3")
        return cell
    }
    
    
}
