//
//  RouteDao.swift
//  VendRoute
//
//  Created by Vasili Orlov on 15/02/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

protocol RouteDao {
    func getAll() -> [Route]
    func save(_ routes: [Route])
}
