//
//  CollectionViewController.swift
//  Networking
//
//  Created by Александр Уткин on 03.07.2021.
//

import UIKit

enum USerAction: String, CaseIterable {
    case downloadImage = "Download image"
    case exampleOne = "example One"
    case exampleTwo = "example Two"
    case exampleThree = "example Three"
    case exampleFour = "example Four"
    case ourCourses = "Our courses"
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
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "showImage", sender: self)
        case .exampleOne:
            performSegue(withIdentifier: "ExampleOne", sender: self)
        case .exampleTwo:
            performSegue(withIdentifier: "ExampleTwo", sender: self)
        case .exampleThree:
            performSegue(withIdentifier: "ExampleThree", sender: self)
        case .exampleFour:
            performSegue(withIdentifier: "ExampleFour", sender: self)
        case .ourCourses:
            performSegue(withIdentifier: "OurCourses", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "showImage" {
            let courceVC = segue.destination as! TableViewController
            switch segue.identifier {
            case "ExampleOne":
                courceVC.fetchDataV1()
            case "ExampleTwo":
                courceVC.fetchDataV2()
            case "ExampleThree":
                courceVC.fetchDataV3()
            case "ExampleFour":
                courceVC.fetchDataV4()
            case "OurCourses":
                courceVC.fetchData()
            default:
                print("")
            }
            
        }
    }
}


