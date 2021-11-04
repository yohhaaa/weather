

import UIKit
import Alamofire
import SwiftyJSON

class CoordinationViewController: UIViewController{
    
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=&lon=&appid=" //УРЛ Апишки
    let key = "75a7ace60bcf6e5bade5c60974912928"    //ключ апишки
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var longitude: UITextField!

    
    var city:String {   
        get {
            return String(cityName.text!)
        }
    }
//    var numLongtude:Int {   // конвертирую строку из текстфилда в числовое значение
//        get {
//            return Int(longitude.text!)!
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    func getWeather() {   //тук-тук на сервер
        
        let URL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(key)"
        let request = AF.request(URL)
        request.responseDecodable(of: WeatherResult.self) { (response) in
            guard let result = response.data else {return}
            do
                { let resultJSON = try JSONDecoder().decode(WeatherResult.self,from: result)
                    guard let vcWeather = self.storyboard?.instantiateViewController(withIdentifier: "weatherVC") as? WeatherViewController
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

//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           if segue.identifier == "show" {
//               let vc = segue.destination as? WeatherViewController
//
//           }
//       }
        
        // добавить условие для вывода ошибки
//            let alert = UIAlertController(title: "ERROR", message: "ERROOOOOR", preferredStyle: .actionSheet)
//            let action = UIAlertAction(title: "OK", style: .default) { action in
//                self.spinner.stopAnimating()
//                self.spinner.isHidden = true
     
        
        // Вызов запроса с заданными координатами
        
        
  
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    if let vcWeather = segue.destination as? WeatherViewController {
//        vcWeather.resultWeather = result
//            print(result)
//        }
//    }
