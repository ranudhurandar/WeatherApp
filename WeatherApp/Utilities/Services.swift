//
//  Services.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 23/03/23.
//

import Foundation

class Services {
    
   func readLocalFile(forName name: String) -> Data? {
 
           guard let bundlePath = Bundle.main.path(forResource: name, ofType: "json") else {
               fatalError("Unable to locate file \"\(name)\" in main bundle.")
            }
               
            do {
                return try String(contentsOfFile: bundlePath).data(using: .utf8)
            } catch{
                fatalError("Unable to load \"\(name)\" from main bundle:\n\(error)")
            }
      
    }
    
  func parse(jsonData: Data) -> [Weather]{
      do{
          return try JSONDecoder().decode([Weather].self, from: jsonData)
         } catch{
             fatalError("Unable to decode  \"\(jsonData)\" as \([Weather].self):\n\(error)")
        }
    }
    
}
