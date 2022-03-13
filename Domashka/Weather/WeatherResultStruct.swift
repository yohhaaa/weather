import Foundation

struct WeatherResult: Decodable {
    var weather: [Weather]
    var main: Main
    var wind: Wind
    var name: String
}
