//
//  RealmCollection+convertToArray.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 10.01.2023.
//

import Foundation
import RealmSwift

extension RealmCollection {
  func convertToArray<T>() ->[T] {
    return self.compactMap{$0 as? T}
  }
}
