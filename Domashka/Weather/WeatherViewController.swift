

import UIKit
import Alamofire

class WeatherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    var resultWeather:WeatherResult?
    
    
    @IBOutlet weak var tableView: UITableView!
    //Надо создать пустые переменные и вписать их в тэйблвью ниже
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    func numberOfSections(in tableView: UITableView) -> Int { //кол-во секций
        return 1

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //кол-во строк в секции
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = resultWeather?.name
        cell.detailTextLabel?.text = "\(NSString(format: "%.0f",(resultWeather!.main.temp)-273)) °C"
    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let info = storyboard?.instantiateViewController(withIdentifier:"infoVC") as? InfoViewController else {return}
        info.weatherInfo = resultWeather
        info.modalPresentationStyle = .fullScreen
        show(info, sender: nil)
        
    }

}


