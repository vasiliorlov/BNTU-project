//
//  VisitDaoImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import CoreData

class VisitDaoImpl: VisitDao {
    let coraDataManager: CoraDataManager
    let mapper: CoraMapper
    let context: NSManagedObjectContext
    
    init(coraDataManager: CoraDataManager, mapper: CoraMapper) {
        self.coraDataManager = coraDataManager
        self.mapper = mapper
        self.context = coraDataManager.persistentContainer.viewContext
    }
    
     //MARK: - VisitDao
    func getAll() -> [Visit] {
        return []
    }
    
    func getExtendedBy(id: VisitId) -> VisitExt? {
        return nil
    }
    
    func save(_ visits: [Visit]) {
        
    }
    
    func removeBy(ids: [VisitId]) {
        
    }
}
