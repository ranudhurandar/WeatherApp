//
//  Extention.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 24/03/23.
//

import Foundation
import UIKit


extension Decodable {
    
    
    
  static func parse(jsonFile: String) -> Self? {
      
    guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let output = try? JSONDecoder().decode(self, from: data)
        else {
      return nil
    }
     return output
  }
}

