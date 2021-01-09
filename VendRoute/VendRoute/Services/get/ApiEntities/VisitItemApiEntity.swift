//
//  VisitItemApiEntity.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class VisitItemApiEntity: NSObject, Codable {
    let id: String
    let column: Int
    let row: Int
    let productId: String
    var add: Int?
    var remove: Int?
    var spoiled: Int?
    var inv: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case column
        case row
        case productId
        case add
        case remove
        case spoiled
        case inv
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        column = try container.decode(Int.self, forKey: .column)
        row = try container.decode(Int.self, forKey: .row)
        productId = try container.decode(String.self, forKey: .productId)
        add = try container.decode(Int?.self, forKey: .add)
        remove = try container.decode(Int?.self, forKey: .remove)
        spoiled = try container.decode(Int?.self, forKey: .spoiled)
        inv = try container.decode(Int?.self, forKey: .inv)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(column, forKey: .column)
        try container.encode(row, forKey: .row)
        try container.encode(productId, forKey: .productId)
        try container.encode(add, forKey: .add)
        try container.encode(remove, forKey: .remove)
        try container.encode(spoiled, forKey: .spoiled)
        try container.encode(inv, forKey: .inv)
    }
}
