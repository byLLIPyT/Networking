//
//  TableViewController.swift
//  Networking
//
//  Created by Александр Уткин on 03.07.2021.
//

import UIKit

class TableViewController: UITableViewController {

    private let jsonUrlOne = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    private let jsonUrlTwo = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    private let jsonUrlThree = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
    private let jsonUrlFour = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"

    private var coursesList = [Cource]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coursesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = coursesList[indexPath.row].name
        if let numberOfLessons = coursesList[indexPath.row].number_of_lessons {
            cell.DescriptionLabel.text = String(numberOfLessons)
        }
        if let numberOfTests = coursesList[indexPath.row].number_of_tests {
            cell.markLabel.text = String(numberOfTests)
        }
//        if let imageName = coursesList[indexPath.row].imageUrl, let url = URL(string: imageName) {
//            URLSession.shared.dataTask(with: url) { (data, _, _) in
//                if let data = data {
//                    cell.cellImage.image = UIImage(data: data)
//                }
//            }
//        }
        if let imageUrl = coursesList[indexPath.row].imageUrl, let urlImage = URL(string: imageUrl) {
            let imageData = try! Data(contentsOf: urlImage)
            cell.cellImage.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    func fetchDataV1() {
     
        guard let url = URL(string: jsonUrlOne) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let course = try JSONDecoder().decode(Cource.self, from: data)
                print(course.name)
            } catch {
                print("error")
            }
        }.resume()        
    }

    func fetchDataV2() {
        guard let url = URL(string: jsonUrlTwo) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode([Cource].self, from: data)
                self.coursesList = courses
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //print(courses)
            } catch {
                print("error")
            }
        }.resume()
    }
    
    func fetchDataV3() {
        guard let url = URL(string: jsonUrlThree) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.websiteDescription)
            } catch {
                print("error")
            }
        }.resume()
    }
    
    func fetchDataV4() {
        guard let url = URL(string: jsonUrlFour) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.websiteDescription)
            } catch {
                print("error")
            }
        }.resume()
    }
    
    func fetchData() {
        guard let url = URL(string: jsonUrlFour) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.websiteDescription)
            } catch {
                print("error")
            }
        }.resume()
    }
    

}
