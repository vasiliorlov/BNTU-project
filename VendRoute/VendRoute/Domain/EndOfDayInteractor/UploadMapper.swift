//
//  UploadMapper.swift
//  VendRoute
//
//  Created by Vasili Orlov on 24/01/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit

class UploadMapper {
    func map(_ visit: VisitExt) -> VisitApiEntity {
        let items: [VisitItemApiEntity] = visit.items.map{ map($0) }
        return VisitApiEntity(id: visit.id, posId: visit.posId, cash: visit.cash, comment: visit.comment, isCollect: visit.isCollect, isInventory: visit.isInventory, isService: visit.isService, needCollect: visit.needCollect, needInventory: visit.needInventory, needService: visit.needService, items: items)
    }
    
    func map(_ visitItem: VisitItem) -> VisitItemApiEntity {
        return VisitItemApiEntity(id: visitItem.id, column: visitItem.column, row: visitItem.row, productId: visitItem.product.id, add: visitItem.add, remove: visitItem.remove, spoiled: visitItem.spoiled, inv: visitItem.inv)
    }
}
