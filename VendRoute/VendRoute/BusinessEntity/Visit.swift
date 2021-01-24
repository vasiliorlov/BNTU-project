//
//  Visit.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

typealias VisitItemId = String
typealias VisitId = String

protocol Serving {
    var add: Int? { get set }
    var remove: Int? { get set }
    var spoiled: Int? { get set }
    var inv: Int? { get set }
}

class VisitItem: Serving {
    let id: VisitItemId
    let column: Int
    let row: Int
    let product: Product
    var add: Int?
    var remove: Int?
    var spoiled: Int?
    var inv: Int?
    
    init(id: VisitItemId, column: Int, row: Int, product: Product, add: Int?, remove: Int?, spoiled: Int?, inv: Int?) {
        self.id = id
        self.column = column
        self.row = row
        self.product = product
        self.add = add
        self.remove = remove
        self.spoiled = spoiled
        self.inv = inv
    }
}

class Visit {
    let id: VisitId
    let posId: PosId
    var cash: Double
    var comment: String?
    
    var isCollect: Bool
    var isInventory: Bool
    var isService: Bool
    
    let needCollect: Bool
    let needInventory: Bool
    let needService: Bool
    
    var itemIds: [VisitItemId]
    
    init(id: VisitId, posId: PosId, cash: Double, comment: String?, isCollect: Bool, isInventory: Bool, isService: Bool, needCollect: Bool, needInventory: Bool, needService: Bool, itemIds: [VisitItemId]) {
        self.id = id
        self.posId = posId
        self.cash = cash
        self.isCollect = isCollect
        self.isInventory = isInventory
        self.isService = isService
        self.needCollect = needCollect
        self.needInventory = needInventory
        self.needService = needService
        self.comment = comment
        self.itemIds = itemIds
    }
}

class VisitExt: Visit {
    var items: [VisitItem] = []
}
