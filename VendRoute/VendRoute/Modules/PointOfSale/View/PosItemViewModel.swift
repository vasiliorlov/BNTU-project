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
    let image: UIImage?
    let productName: String
    let row: Int
    let column: Int
    var inv: Int?
    var add: Int?
    var remove: Int?
    var spoil: Int?
    
    init(id: VisitItemId, productName: String, row: Int, column: Int, inv: Int?, add: Int?, remove: Int?, spoil: Int?, image: UIImage?) {
        self.id = id
        self.productName = productName
        self.row = row
        self.column = column
        self.inv = inv
        self.add = add
        self.remove = remove
        self.spoil = spoil
        self.image = image
    }
}
