//
//  PointOfSale.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

typealias PosId = String

struct PointOfSale {
    let id: PosId
    let visit: Visit
    let adress: Adress
    let comment: String
}
