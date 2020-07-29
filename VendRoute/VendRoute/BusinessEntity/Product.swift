//
//  Product.swift
//  VendRoute
//
//  Created by Vasili Orlov on 29/07/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import Foundation

typealias ProductId = String

struct Product {
    let id: ProductId
    let name: String
    let measure: Measure
}
