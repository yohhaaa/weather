import UIKit
import Alamofire
import SwiftyJSON

class WeatherRequestViewController: UIViewController{
    
    @IBOutlet weak private var spinner: UIActivityIndicatorView!
    @IBOutlet weak private var cityName: UITextField!
    let key = "75a7ace60bcf6e5bade5c60974912928"
    var city:String {   
        get {
            return String(cityName.text!)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    func getWeather() {
        let URL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(key)"
        let request = AF.request(URL)
        request.responseDecodable(of: WeatherResult.self) { (response) in
            guard let result = response.data else {return}
            do
                { let resultJSON = try JSONDecoder().decode(WeatherResult.self,from: result)
                    guard let vcWeather = self.storyboard?.instantiateViewController(withIdentifier: "weatherVC") as? WeatherResultViewController
                    else {return}
                    vcWeather.resultWeather = resultJSON
                    vcWeather.modalPresentationStyle = .fullScreen
                    self.show(vcWeather, sender: nil)
            }
            catch{
                let alert = UIAlertController(title: "Error", message: "Something goes wrong, try again later", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
            }
        }
    }
    
    @IBAction func weatherButton(_ sender: Any) {
        getWeather()
        spinner.isHidden = false
        spinner.startAnimating()
    }
}
