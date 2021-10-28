//
//  json.swift
//  Domashka
//
//  Created by Алан Ахмадуллин on 07.10.2021.
//

import Foundation

struct WeatherResult: Decodable {
    var weather:[Weather]
    var main:Main
    var wind:Wind
    var name:String
}
struct Weather: Decodable {
    var main:String
    var description:String
}
struct Main: Decodable {
    var temp:Double
    var temp_min:Double
    var temp_max:Double
    var pressure:Double
}
struct Wind: Decodable{
    var speed:Double
}
