import UIKit
import Alamofire
import SwiftyJSON

class WeatherRequestViewController: UIViewController{
    
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    @IBOutlet private weak var cityName: UITextField!
    
    private let key = "75a7ace60bcf6e5bade5c60974912928"
    private let url = "https://api.openweathermap.org/data/2.5/weather?q="
    private var city: String {
        get {
            return String(cityName.text!)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    func getWeather() {
        let URLrequest = "\(url)\(city)&appid=\(key)"
        let request = AF.request(URLrequest)
        request.responseDecodable(of: WeatherResult.self) { (response) in
            guard let result = response.data else { return }
            do {
                let resultJSON = try JSONDecoder().decode(WeatherResult.self,from: result)
                guard let vcWeather = self.storyboard?.instantiateViewController(withIdentifier: "weatherVC") as? WeatherResultViewController
                else { return }
                
                vcWeather.resultWeather = resultJSON
                vcWeather.modalPresentationStyle = .fullScreen
                
                self.show(vcWeather, sender: nil)
            } catch{
                let alert = UIAlertController(title: "Error", message: "Something goes wrong, try again later", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
            }
        }
    }
    
    @IBAction private func weatherButton(_ sender: Any) {
        getWeather()
        spinner.isHidden = false
        spinner.startAnimating()
    }
}
