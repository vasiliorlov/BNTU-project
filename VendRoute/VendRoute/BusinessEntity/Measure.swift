//
//  OutOfMeasure.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import Foundation

typealias MeasureId = String

struct Measure {
    let id: MeasureId
    let measureFactor: Int
    let name: String
}
