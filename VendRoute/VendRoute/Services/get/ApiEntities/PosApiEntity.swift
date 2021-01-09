//
//  PosApiEntity.swift
//  VendRoute
//
//  Created by Vasili Orlov on 03/10/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

class PosApiEntity: NSObject, Codable {
    let id: String
    let name: String
    let adress: AdressApiEntity
    
    let comment: String?
    
    var isCollect: Bool
    var isInventory: Bool
    var isService: Bool
    
    let needCollect: Bool
    let needInventory: Bool
    let needService: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case adress
        case comment
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
        name = try container.decode(String.self, forKey: .name)
        adress = try container.decode(AdressApiEntity.self, forKey: .adress)
        comment = try container.decode(String?.self, forKey: .comment)
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
        try container.encode(name, forKey: .name)
        try container.encode(adress, forKey: .adress)
        try container.encode(comment, forKey: .comment)
        try container.encode(isCollect, forKey: .isCollect)
        try container.encode(isInventory, forKey: .isInventory)
        try container.encode(isService, forKey: .isService)
        try container.encode(needCollect, forKey: .needCollect)
        try container.encode(needInventory, forKey: .needInventory)
        try container.encode(needService, forKey: .needService)
    }

}

class AdressApiEntity: NSObject, Codable {
    let city: String
    let street: String
    let gps: GpsApiEntity
    let postCode: String
    
    private enum CodingKeys: String, CodingKey {
        case city
        case street
        case gps
        case postCode
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        city = try container.decode(String.self, forKey: .city)
        street = try container.decode(String.self, forKey: .street)
        gps = try container.decode(GpsApiEntity.self, forKey: .gps)
        postCode = try container.decode(String.self, forKey: .postCode)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(city, forKey: .city)
        try container.encode(street, forKey: .street)
        try container.encode(gps, forKey: .gps)
        try container.encode(postCode, forKey: .postCode)
    }
}

class GpsApiEntity: NSObject, Codable {
    let longitude: Double
    let latitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case longitude
        case latitude
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        longitude = try container.decode(Double.self, forKey: .longitude)
        latitude = try container.decode(Double.self, forKey: .latitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(latitude, forKey: .latitude)
    }
}
