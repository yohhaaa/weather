import UIKit
import Alamofire

class WeatherResultViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var resultWeather: WeatherResult?
}

extension WeatherResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = resultWeather?.name
        cell.detailTextLabel?.text = "\(NSString(format: "%.0f", (resultWeather!.main.temp) - 273)) °C"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let info = storyboard?.instantiateViewController(withIdentifier:"infoVC") as? WeatherInfoViewController else { return }
        
        info.weatherInfo = resultWeather
        info.modalPresentationStyle = .fullScreen
        
        show(info, sender: nil)
    }
}

extension WeatherResultViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
