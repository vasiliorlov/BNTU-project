//
//  PosDaoImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import CoreData

class PosDaoImpl: PosDao {
    let coraDataManager: CoraDataManager
    let mapper: CoraMapper
    let context: NSManagedObjectContext
    
    init(coraDataManager: CoraDataManager, mapper: CoraMapper) {
        self.coraDataManager = coraDataManager
        self.mapper = mapper
        self.context = coraDataManager.persistentContainer.viewContext
    }
    
    //MARK: - PosDao
    func getAll() -> [PointOfSale] {
        do {
            let fetchRequest = NSFetchRequest<CorePOS>(entityName: "CorePOS")
            let results = try context.fetch(fetchRequest)
            return results.compactMap{ mapper.map($0) }
        } catch { return [] }
    }
    
    func getBy(id: PosId) -> PointOfSale? {
        let fetchRequest = NSFetchRequest<CorePOS>(entityName: "CorePOS")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        do {
            let results = try context.fetch(fetchRequest)
            if let coreResult = results.first {
                return mapper.map(coreResult)
            } else { return nil }
        } catch { return nil }
    }
    
    func save(_ poses: [PointOfSale]) {
        let _ = poses.map { mapper.map($0) }
        coraDataManager.saveContext(mapper.context)
    }
    
    func removeBy(ids: [PosId]) {
        
    }
}
