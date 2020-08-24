//
//  Adress.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import Foundation

struct GpsCoordinate {
    let longitude: Double
    let latitude: Double
}

struct Adress {
    let city: String
    let street: String
    let gps: GpsCoordinate
    let postCode: Int
    
    var text: String {
        return "\(postCode), \(city),  \(street)"
    }
}
