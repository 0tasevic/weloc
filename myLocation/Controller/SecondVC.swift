//
//  SecondVC.swift
//  myLocation
//
//  Created by Milos Otasevic on 22/02/2019.
//  Copyright © 2019 Milos Otasevic. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    
    var cellRou = { () -> [Bool] in
        var pomocni: [Bool] = [false]
        var p2 : [Int] = []
        for i in times{
            p2.append(Int(String(String(i.dropFirst(8)).dropLast(9)))!)
            
        }
        var p = p2[0]
        for i in p2{
           
            if i == p{
                pomocni.append(true)
            }else{
              
                p = i
                pomocni.append(false)
                pomocni.append(true)
            }
           
        }
        
        return pomocni
    }
    
    
    @IBOutlet weak var table: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count + 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

           
        if cellRou()[indexPath.row]{
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? MyTableViewCell
       
            
            let p: String = String(String(times[timeForSecondVC[indexPath.row]].dropFirst(10)).dropLast(3))
            cell?.time.text = p
            cell?.temperature.text = "\(temps[timeForSecondVC[indexPath.row]])°"
            cell?.type.text = mains[timeForSecondVC[indexPath.row]]
            cell?.imageLabel.text = makeIMG(current: mains[timeForSecondVC[indexPath.row]])
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 110
            }
            return cell!
        }else{
            
            
            let cellToday = tableView.dequeueReusableCell(withIdentifier: "Today", for: indexPath) as? TodayTableViewCell
            var pomocni = 0
            if(indexPath.row == 0){
            cellToday?.Day.text = "Today"
            }else if indexPath.row == day2{
                pomocni = dayIndex! + 1
                if pomocni > 6{
                    pomocni -= 7
                }
              cellToday?.Day.text = allDays[pomocni]
            }else if indexPath.row == day3{
                pomocni = dayIndex! + 2
                if pomocni > 6{
                    pomocni -= 7
                }
                cellToday?.Day.text = allDays[pomocni]
            }else if indexPath.row == day4{
                pomocni = dayIndex! + 3
                if pomocni > 6{
                    pomocni -= 7
                }
                cellToday?.Day.text = allDays[pomocni]
            }
            else if indexPath.row == day5{
                pomocni = dayIndex! + 4
                if pomocni > 6{
                    pomocni -= 7
                }
                cellToday?.Day.text = allDays[pomocni]
            }
            else{
                pomocni = dayIndex! + 4
                print(indexPath.row)
                cellToday?.Day.text = allDays[1]
            }
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                
                return 60
            }
            
            return cellToday!
        }
        
        
        
        
    }
    
   
    
    
    
    

    @IBOutlet weak var topCityName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTimeForSecondVC()
        topCityName.text = CityName
        
        self.table.dataSource = self
        self.table.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    
    func makeIMG(current : String) -> String{
        switch current {
        case "sunny":
            return "☀️"
        case "clear sky":
            return "☀️"
        case "rain":
            return "🌨"
        case "few clouds":
            return "🌤"
        case "scattered clouds":
            return "⛅️"
        case "broken clouds":
            return "☁️"
        default:
            return "👿"
        }
    }

    
    
    
    func makeTimeForSecondVC(){
     
        var pomocni : String = String(String(times[0].dropFirst(8)).dropLast(9))
       
        var p2  = 0
                for i in times{
        
                   
                    if String(String(i.dropFirst(8)).dropLast(9)) == pomocni{
                        timeForSecondVC.append(p2)
                    }else{
                         pomocni = String(String(i.dropFirst(8)).dropLast(9))
                      
                        if day2 == nil{
                            day2 = timeForSecondVC.count
                        }else if day3 == nil{
                            day3 = timeForSecondVC.count
                        }else if day4 == nil{
                            day4 = timeForSecondVC.count
                        }else if day5 == nil{
                            day5 = timeForSecondVC.count
                        }else if day6 == nil{
                            day6 = timeForSecondVC.count
                        }
                        timeForSecondVC.append(p2)
                        timeForSecondVC.append(p2)
                        
                    
                        
                    }
                     p2 += 1
                
                }
       
        
        
    }

    
}
