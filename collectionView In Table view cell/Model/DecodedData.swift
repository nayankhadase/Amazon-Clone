//
//  DecodedData.swift
//  collectionView In Table view cell
//
//  Created by nayan.khadase on 25/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation

protocol DecodedDataDelegate {
    func didUpdateProductDetails(for parseData: ModelData)
}

struct DecodedData {
    
    var delegate: DecodedDataDelegate?
    
    func loadJSONData(for name: String){
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"){
            do{
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                JSONParsing(for: jsonData!)
            }catch{
                print("errors while getting json data \(error)")
            }
        }
        
    }
    func JSONParsing(for localData: Data){
        let decoder = JSONDecoder()
        do{
            let safeData = try decoder.decode(ModelData.self, from: localData)
            delegate?.didUpdateProductDetails(for: safeData)
            //print(safeData.response?[0].category_name)
            //print("----")
        }catch{
            print("errors while parsing data \(error)")
        }
        
    }
    
}
