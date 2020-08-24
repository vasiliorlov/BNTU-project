//
//  PointOfSale.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

typealias PosId = UUID

struct PointOfSale {
    let id: PosId
    let name: String
    let adress: Adress
    let comment: String?
    
    var isCollect: Bool
    var isInventory: Bool
    var isService: Bool
    
    let needCollect: Bool
    let needInventory: Bool
    let needService: Bool
}
