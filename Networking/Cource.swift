//
//  Cource.swift
//  Networking
//
//  Created by Александр Уткин on 03.07.2021.
//

import Foundation

struct Cource: Decodable {
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}


struct WebsiteDescription: Decodable {
    let courses: [Cource]?
    let websiteDescription: String?
    let websiteName: String?
}
