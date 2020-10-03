//
//  VisitApiEntity.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class VisitApiEntity: NSObject, Codable {
    let id: String
    let pos: PosApiEntity
    var cash: Double
    var comment: String?
    var itemIds: [String]
    var items: [VisitItemApiEntity]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case pos
        case cash
        case comment
        case itemIds
        case items
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        pos = try container.decode(PosApiEntity.self, forKey: .pos)
        cash = try container.decode(Double.self, forKey: .cash)
        comment = try container.decode(String?.self, forKey: .comment)
        itemIds = try container.decode([String].self, forKey: .itemIds)
        items = try container.decode([VisitItemApiEntity].self, forKey: .items)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(pos, forKey: .pos)
        try container.encode(cash, forKey: .cash)
        try container.encode(comment, forKey: .comment)
        try container.encode(itemIds, forKey: .itemIds)
        try container.encode(items, forKey: .items)
    }
}
