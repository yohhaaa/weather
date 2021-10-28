//
//  InfoViewController.swift
//  Domashka
//
//  Created by Алан Ахмадуллин on 26.10.2021.
//

import UIKit

class InfoViewController: UIViewController {

    var weatherInfo:WeatherResult?
    @IBOutlet weak var mainClouds: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainClouds.text = weatherInfo?.weather[0].description
        city.text = weatherInfo?.name
        temp.text = "\(NSString(format: "%.0f",(weatherInfo!.main.temp)-273))°"
        pressure.text = "pressure: \(NSString(format: "%.0f",(weatherInfo!.main.pressure)*0.750))"
        snowPicture()
     
    }
    
    func snowPicture(){
        if weatherInfo?.weather[0].main == "Clouds" {
            imageView.image = UIImage(named: "cloud")
        
        }
        else if weatherInfo?.weather[0].main == "Rain" {
            imageView.image = UIImage(named: "rain")
        
        }
        else if weatherInfo?.weather[0].main == "Snow" {
            imageView.image = UIImage(named: "snow")
        
        }
        else if weatherInfo?.weather[0].main == "Clear" {
            imageView.image = UIImage(named: "clear")
        
        }
        else{print("no")}
    }
    
  

}

