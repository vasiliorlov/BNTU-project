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
            let results = try context.fetch(CoraPOS.fetchRequest()) as! [CoraPOS]
            return results.compactMap{ mapper.map($0) }
        } catch { return [] }
    }
    
    func getBy(id: PosId) -> PointOfSale? {
        let fetchRequest = NSFetchRequest<CoraPOS>(entityName: "POS")
        fetchRequest.predicate = NSPredicate(format: "%K = %@", #keyPath(CoraPOS.id), id as CVarArg)
        do {
            let results = try context.fetch(fetchRequest)
            if let coreResult = results.first {
                return mapper.map(coreResult)
            } else { return nil }
        } catch { return nil }
    }
    
    func save(_ poses: [PointOfSale]) {
        let _ = poses.map { mapper.map($0) }
        coraDataManager.saveContext()
    }
    
    func removeBy(ids: [PosId]) {
        
    }
}
