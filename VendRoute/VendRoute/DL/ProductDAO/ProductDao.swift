//
//  ProductDao.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol ProductDao {
    func getAll() -> [Product]
    func save(_ products: [Product])
    func removeBy(ids: [ProductId])
}
