//
//  locationCordinates.swift
//  myLocation
//
//  Created by Milos Otasevic on 22/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//

import Foundation


struct WeatherStatistic: Codable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
    let city: City
}

struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
}

struct Coord: Codable {
    let lat, lon: Double
}

struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let rain: Rain
    let sys: Sys
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, rain, sys
        case dtTxt = "dt_txt"
    }
}

struct Clouds: Codable {
    let all: Int
}

struct MainClass: Codable {
    let temp, tempMin, tempMax, pressure: Double
    let seaLevel, grndLevel: Double
    let humidity, tempKf: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct Rain: Codable {
}

struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

struct Weather: Codable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: Icon
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
}

enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02D = "02d"
    case the02N = "02n"
    case the03N = "03n"
    case the04N = "04n"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

struct Wind: Codable {
    let speed, deg: Double
}


