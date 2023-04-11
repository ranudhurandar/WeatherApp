//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 20/03/23.
//

import Foundation


// MARK: - Weather
struct Weather: Decodable {
    let city: City
    let time: Int
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let weather: [WeatherDetail]
}

// MARK: - City
struct City: Decodable {
    
    let name, findname, country: String
    
}

// MARK: - Coord
struct Coord: Decodable {
    let lon, lat: Double
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double
    let pressure: Double
    let humidity: Int
    let temp_min, temp_max: Double
}

// MARK: - Weather
struct WeatherDetail: Decodable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
    let deg: Double

}
