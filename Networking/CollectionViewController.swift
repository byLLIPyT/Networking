//
//  CollectionViewController.swift
//  Networking
//
//  Created by Александр Уткин on 03.07.2021.
//

import UIKit

enum USerAction: String, CaseIterable {
    case downloadImage = "Download image"
}

class CollectionViewController: UICollectionViewController {

    private let userActions = USerAction.allCases
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = userActions[indexPath.item].rawValue
        // Configure the cell
    
        return cell
    }
    

}
