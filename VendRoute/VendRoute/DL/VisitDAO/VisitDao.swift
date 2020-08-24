//
//  VisitDao.swift
//  VendRoute
//
//  Created by Vasili Orlov on 11/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit

protocol VisitDao {
    func getAll() -> [VisitExt]
    func getExtendedBy(id: VisitId) -> VisitExt?
    func save(_ visits: [VisitExt])
    func removeBy(ids: [VisitId])
}
