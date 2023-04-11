//
//  CityTableViewModel.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 10/04/23.
//

import Foundation


class CityTableCellViewModel{
    
    var cityName: String
    var countryName: String
    var findName: String
    
    init(city: Weather) {
        self.cityName = city.city.name
        self.countryName = city.city.country
        self.findName = city.city.findname
    }
}
