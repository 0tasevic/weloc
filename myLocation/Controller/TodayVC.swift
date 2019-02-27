//
//  ViewController.swift
//  myLocation
//
//  Created by Milos Otasevic on 22/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//

import UIKit
import MapKit

class TodayVC: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var imageString: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    
    
    
    

    
    var locationMenager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationMenager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationMenager.delegate = self
            locationMenager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationMenager.startUpdatingLocation()
            updatWeatherStatistic()
        }
        
        
//        updatWeatherStatistic()
        
        
    }

    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        LAT = locValue.latitude
        LOT = locValue.longitude

            }
    
    
    func updatWeatherStatistic(){
        
        URLSession.shared.dataTask(with: url) { (data, respones, error) in
            
            guard let data = data else{return}
            
            do{
                let json = try JSONDecoder().decode(WeatherStatistic.self, from: data)
                self.locationName.text = "\(json.city.name), \(json.city.country)"
                CityName = json.city.name
                self.temperature.text = "\(self.makeCelsius(kelvin: json.list[0].main.temp))°C"
                let weathertype: String = String(Substring(json.list[0].weather[0].description.rawValue))
                type = String(Substring(json.list[0].weather[0].description.rawValue))
                self.weatherType.text = "\(weathertype)"
                self.imageString.text = self.makeIMG(current: weathertype)
                self.speed.text = "\(Int(json.list[0].wind.speed)) km/h"
                self.pressureLabel.text = "\(json.list[0].main.pressure)nPh"
                self.humidity.text = "\(json.list[0].main.humidity)%"
                numberOfCells = json.list.capacity
                
                for i in 0...(json.list.count - 1){
                    temps.append(self.makeCelsius(kelvin: json.list[i].main.temp))
                    mains.append(json.list[i].weather[0].description.rawValue)
                    
                    times.append(json.list[i].dtTxt)
                }
                
                
            }catch{
                print("GRESKA PRI PREUZIMANJU JSON-a")
            }
            }.resume()
        
    }
    
    
    func makeIMG(current : String) -> String{
        switch current {
        case "sunny":
            return "☀️"
        case "clear sky":
            return "☀️"
        case "rain":
            return "🌨"
        default:
           return "🌦"
        }
    }


    func makeCelsius(kelvin: Double ) -> Int{
        let  c = kelvin -  273.15
        return Int(c)
    }
    

}

