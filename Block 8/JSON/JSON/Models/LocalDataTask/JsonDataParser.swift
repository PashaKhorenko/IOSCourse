//
//  JsonDataParser.swift
//  JSON
//
//  Created by Паша Хоренко on 25.12.2022.
//

import Foundation

protocol JsonDataParserProtocol {
    func readLocalFile(forName name: String) -> Data?
    func parse(jsonData: Data)
}


class JsonDataParser: JsonDataParserProtocol {
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Company.self, from: jsonData)
            
            print("First Task")
            
            print("==================================")
            
            print("CompanyDescription: \(decodedData.companyDescription)")
            
            print("==================================")
            
            print("FirstDevice.modelNumber: \(decodedData.listOfData.first?.modelNumber ?? "–")")
            print("FirstDevice.countries.lastElement: \(decodedData.listOfData.first?.countries.last ?? "–")")
            
            print("==================================")
            
            print("LastDevice.price.first.name: \(decodedData.listOfData.last?.price.regions.first?.name ?? "–")")
            print("LastDevice.price.last.price: \(decodedData.listOfData.last?.price.regions.last?.price ?? 0)")
            
        } catch {
            print("decode error")
        }
    }
}
