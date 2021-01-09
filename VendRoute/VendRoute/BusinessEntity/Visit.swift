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

struct VisitItem: Serving {
    let id: VisitItemId
    let column: Int
    let row: Int
    let product: Product
    var add: Int?
    var remove: Int?
    var spoiled: Int?
    var inv: Int?
}

class Visit {
    let id: VisitId
    let posId: PosId
    var cash: Double
    var comment: String?
    var itemIds: [VisitItemId]
    
    init(id: VisitId, posId: PosId, cash: Double, comment: String?, itemIds: [VisitItemId]) {
        self.id = id
        self.posId = posId
        self.cash = cash
        self.comment = comment
        self.itemIds = itemIds
    }
}

class VisitExt: Visit {
    var items: [VisitItem] = []
}
