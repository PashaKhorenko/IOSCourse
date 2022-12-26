//
//  Device.swift
//  JSON
//
//  Created by Паша Хоренко on 25.12.2022.
//

import Foundation

struct Device: Codable {
    var name: String
    var modelNumber: String
    var countries: [String]
    var price: PriceInfo
    var year: Int
}
