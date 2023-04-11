//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 20/03/23.
//

import Foundation

class WeatherViewModel{
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var cities: Observable<[CityTableCellViewModel]> = Observable(nil)
    var dataSource: [Weather]?
    var searchResult: [Weather]?
    var service: Services? = nil
    init(_service : Services) {
        service = _service
    }
    
    var weather: [Weather]? = nil
    init(weather: [Weather]){
        self.weather = weather
    }
   
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    

    func getCityBySearch(searchText: String){
        
        if let localData =  service?.readLocalFile(forName: Constant.localDataFileName)
        {
            dataSource = (service?.parse(jsonData: localData))
            
        }
        if(searchText != ""){
            dataSource = dataSource?.filter({ (weather: Weather) -> Bool in
                let cityname = weather.city.name.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return cityname != nil

               }
            )
        }
        cities.value = dataSource?.compactMap({CityTableCellViewModel(city: $0)}) as? [CityTableCellViewModel]
        
    }
}

