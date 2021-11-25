//
//  CollectionViewCell.swift
//  collectionView In Table view cell
//
//  Created by nayan.khadase on 25/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
    var product_img: String?
    var product_name: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        productImage.image = UIImage(named: product_img ?? "bagimage3")
//        productLabel.text = product_name
    }
    
}
