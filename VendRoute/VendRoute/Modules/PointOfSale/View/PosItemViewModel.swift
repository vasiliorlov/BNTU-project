//
//  PosItemViewModel.swift
//  VendRoute
//
//  Created by Vasili Orlov on 04/09/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class PosItemViewModel {
    let id: VisitItemId
    let productName: String
    var inv: Int
    var add: Int
    var remove: Int
    var spoil: Int
    
    init(id: VisitItemId, productName: String, inv: Int, add: Int, remove: Int, spoil: Int ) {
        self.id = id
        self.productName = productName
        self.inv = inv
        self.add = add
        self.remove = remove
        self.spoil = spoil
    }
}
