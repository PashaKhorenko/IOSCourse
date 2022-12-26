//
//  Company.swift
//  JSON
//
//  Created by Паша Хоренко on 25.12.2022.
//

import Foundation

struct Company: Codable {
    var count: Int
    var companyDescription: String
    var listOfData: [Device]
}
