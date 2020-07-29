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
    var add: Int { get set }
    var remove: Int { get set }
    var spoiled: Int { get set }
    var inv: Int { get set }
}

struct VisitItem: Serving {
    let id: VisitItemId
    let column: Int
    let row: Int
    let product: Product
    var add: Int
    var remove: Int
    var spoiled: Int
    var inv: Int
}

struct Visit {
    let id: VisitId
    var items: [VisitItem]
    var cash: Double
    var comment: String
}
