//
//  POSViewModel.swift
//  VendRoute
//
//  Created by Vasili Orlov on 10/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

struct POSViewModel {
    let id: PosId
    let posName: String
    let adress: String
    var collected: Bool
    var inventoried: Bool
    var servised: Bool
    
    var needCollected: Bool
    var needInventoried: Bool
    var needServised: Bool
    
}
