//
//  Constants.swift
//  myLocation
//
//  Created by Milos Otasevic on 22/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//




import Foundation

// CORDINATES
var LAT = 40.759211
var LOT = 73.984638



//URL
let STRINGURL = "https://samples.openweathermap.org/data/2.5/forecast?lat=\(LAT)&lon=\(LOT)&appid=dcde1b8dfd63fc5d53dd245e3e5b5ca1"
//let STRINGURL = "api.openweathermap.org/data/2.5/forecast?lat=\(LAT)&lon=\(LOT)&appid=dcde1b8dfd63fc5d53dd245e3e5b5ca1&units=metric"

let url = URL(string: STRINGURL)!
//FOR SECOND VC
var CityName = " "
var type = " "
var numberOfCells = 1
var timeForSecondVC: [Int] = [0]

var times : [String] = []
var temps: [Int] = []
var mains: [String] = []
var dates: [String] = []
var DayNumber: [Int]{
    var pomocni: [Int] = []
    for i in 0..<times.count{
        pomocni.append( Int(String(String(times[i].dropLast(9)).dropFirst(8)))!)
}
    return pomocni
}
var numberOfTodayCells = 0


let calendar = Calendar(identifier: .gregorian)
let days = calendar.weekdaySymbols


//SAVE DAYS POSITION FOR 2VC
var day2: Int?
var day3: Int?
var day4: Int?
var day5: Int?
var day6: Int?







//TODAY
var today: String {
let date = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd-MM-yyyy"

dateFormatter.dateFormat = "EEEE"
let currentDateString: String = dateFormatter.string(from: date)
return currentDateString
}

//All DAYS
let allDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
var dayIndex = allDays.firstIndex(of: today)


