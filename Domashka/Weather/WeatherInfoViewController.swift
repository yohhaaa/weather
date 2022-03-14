import UIKit

class WeatherInfoViewController: UIViewController {

    @IBOutlet private weak var mainClouds: UILabel!
    @IBOutlet private weak var city: UILabel!
    @IBOutlet private weak var temp: UILabel!
    @IBOutlet private weak var pressure: UILabel!
    @IBOutlet private weak var backgroundPicture: UIImageView!
    var weatherInfo:WeatherResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        mainClouds.text = weatherInfo?.weather[0].description
        city.text = weatherInfo?.name
        temp.text = "\(NSString(format: "%.0f",(weatherInfo!.main.temp) - 273))°"
        pressure.text = "pressure: \(NSString(format: "%.0f",(weatherInfo!.main.pressure) * 0.750))"
        
        showWeatherPicture()
    }
    
    private func showWeatherPicture() {
        if weatherInfo?.weather[0].main == "Clouds" {
            backgroundPicture.image = UIImage(named: "cloud")
        } else if weatherInfo?.weather[0].main == "Rain" {
            backgroundPicture.image = UIImage(named: "rain")
        } else if weatherInfo?.weather[0].main == "Snow" {
            backgroundPicture.image = UIImage(named: "snow")
        } else if weatherInfo?.weather[0].main == "Clear" {
            backgroundPicture.image = UIImage(named: "clear")
        }
    }
}

