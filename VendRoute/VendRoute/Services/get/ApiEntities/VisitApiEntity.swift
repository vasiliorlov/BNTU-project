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
    let posId: String
    var cash: Double
    var comment: String?
    
    var isCollect: Bool
    var isInventory: Bool
    var isService: Bool
    
    let needCollect: Bool
    let needInventory: Bool
    let needService: Bool
    var items: [VisitItemApiEntity]
    
    init(id: String, posId: String, cash: Double, comment: String?, isCollect: Bool, isInventory: Bool, isService: Bool, needCollect: Bool, needInventory: Bool, needService: Bool, items: [VisitItemApiEntity]) {
        self.id = id
        self.posId = posId
        self.cash = cash
        self.comment = comment
        self.isCollect = isCollect
        self.isInventory = isInventory
        self.isService = isService
        self.needCollect = needCollect
        self.needInventory = needInventory
        self.needService = needService
        self.items = items
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posId
        case cash
        case comment
        case items
        case isCollect
        case isInventory
        case isService
        case needCollect
        case needInventory
        case needService
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        posId = try container.decode(String.self, forKey: .posId)
        cash = try container.decode(Double.self, forKey: .cash)
        comment = try container.decode(String?.self, forKey: .comment)
        items = try container.decode([VisitItemApiEntity].self, forKey: .items)
        isCollect = try container.decode(Bool.self, forKey: .isCollect)
        isInventory = try container.decode(Bool.self, forKey: .isInventory)
        isService = try container.decode(Bool.self, forKey: .isService)
        needCollect = try container.decode(Bool.self, forKey: .needCollect)
        needInventory = try container.decode(Bool.self, forKey: .needInventory)
        needService = try container.decode(Bool.self, forKey: .needService)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(posId, forKey: .posId)
        try container.encode(cash, forKey: .cash)
        try container.encode(comment, forKey: .comment)
        try container.encode(items, forKey: .items)
        try container.encode(isCollect, forKey: .isCollect)
        try container.encode(isInventory, forKey: .isInventory)
        try container.encode(isService, forKey: .isService)
        try container.encode(needCollect, forKey: .needCollect)
        try container.encode(needInventory, forKey: .needInventory)
        try container.encode(needService, forKey: .needService)
    }
}
