//
//  PosDao.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol PosDao {
    func getAll() -> [PointOfSale]
    func getBy(id: PosId) -> PointOfSale?
    func save(_ poses: [PointOfSale])
    func removeBy(ids: [PosId])
}
