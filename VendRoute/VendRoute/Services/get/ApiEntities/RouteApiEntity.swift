//
//  RouteApiEntity.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/02/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

class RouteApiEntity: NSObject, Codable {
    let fromPosId: String
    let toPosId: String
    let dist: Double
    
    private enum CodingKeys: String, CodingKey {
        case fromPosId
        case toPosId
        case dist
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fromPosId = try container.decode(String.self, forKey: .fromPosId)
        toPosId = try container.decode(String.self, forKey: .toPosId)
        dist = try container.decode(Double.self, forKey: .dist)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fromPosId, forKey: .fromPosId)
        try container.encode(toPosId, forKey: .toPosId)
        try container.encode(dist, forKey: .dist)
    }
}
