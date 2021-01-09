//
//  ProductApiEntity.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class ProductApiEntity: NSObject, Codable {
    let id: String
    let name: String
    let measureId: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case measureId
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        measureId = try container.decode(String.self, forKey: .measureId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(measureId, forKey: .measureId)
    }
    //for testing
    init(id: String, name: String, measureId: String) {
        self.id = id
        self.name = name
        self.measureId = measureId
    }
}

class MeasureApiEntity: NSObject, Codable {
    let id: String
    let measureFactor: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case measureFactor
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        measureFactor = try container.decode(Int.self, forKey: .measureFactor)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(measureFactor, forKey: .measureFactor)
        try container.encode(name, forKey: .name)
    }
    //for testing
    init(id: String, measureFactor: Int, name: String) {
        self.id = id
        self.measureFactor = measureFactor
        self.name = name
    }
}
