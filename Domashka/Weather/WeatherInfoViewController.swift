import UIKit

class WeatherInfoViewController: UIViewController {

    @IBOutlet weak private var mainClouds: UILabel!
    @IBOutlet weak private var city: UILabel!
    @IBOutlet weak private var temp: UILabel!
    @IBOutlet weak private var pressure: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    var weatherInfo:WeatherResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        showWeatherPicture()
    }
    func setup(){
        mainClouds.text = weatherInfo?.weather[0].description
        city.text = weatherInfo?.name
        temp.text = "\(NSString(format: "%.0f",(weatherInfo!.main.temp)-273))°"
        pressure.text = "pressure: \(NSString(format: "%.0f",(weatherInfo!.main.pressure)*0.750))"
    }
    
    func showWeatherPicture(){
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
            else{print("no image")}
    }
}

