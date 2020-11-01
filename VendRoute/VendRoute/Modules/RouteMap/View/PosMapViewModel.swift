//
//  PosLocationPoint.swift
//  VendRoute
//
//  Created by Vasili Orlov on 01/11/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import MapKit

class PosMapViewModel {
    let title: String
    let comment: String?
    let adress: String
    let location: CLLocationCoordinate2D
    
    init(title: String, adress: String, comment: String?, location: CLLocationCoordinate2D) {
        self.title = title
        self.adress = adress
        self.comment = comment
        self.location = location
    }
}
