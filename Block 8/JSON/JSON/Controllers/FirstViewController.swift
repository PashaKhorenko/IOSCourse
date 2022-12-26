//
//  FirstViewController.swift
//  JSON
//
//  Created by Паша Хоренко on 25.12.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let jsonDataParser = JsonDataParser()
    private let jsonFileName = "RawData"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        printData(fromFile: jsonFileName)
    }
    
    private func printData(fromFile fileName: String) {
        guard let data = jsonDataParser.readLocalFile(forName: fileName) else {
            print("Failed to generate data from file \(fileName).")
            return
        }
        
        jsonDataParser.parse(jsonData: data)
    }

}
