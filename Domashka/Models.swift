//
//  Models.swift
//  Domashka
//
//  Created by Алан Ахмадуллин on 27.09.2021.
//

import Foundation

struct List: Decodable {
    var list:[Countries]
}


struct Countries: Decodable {
    
    var country: String
    var cities: [Cities]
}

struct Cities: Decodable {

    var name:String
    var id:String
    var population:Int
}
