//
//  RouteDaoImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 15/02/21.
//  Copyright © 2021 Vasili Orlov. All rights reserved.
//

import UIKit
import CoreData

class RouteDaoImpl: RouteDao {
    let coraDataManager: CoraDataManager
    let mapper: CoraMapper
    let context: NSManagedObjectContext
    
    init(coraDataManager: CoraDataManager, mapper: CoraMapper) {
        self.coraDataManager = coraDataManager
        self.mapper = mapper
        self.context = coraDataManager.persistentContainer.viewContext
    }
    
    func getAll() -> [Route] {
        do {
            let fetchRequest = NSFetchRequest<CoreRoute>(entityName: "CoreRoute")
            let results = try context.fetch(fetchRequest)
            return results.compactMap{ mapper.map($0) }
        } catch { return [] }
    }
    
    func save(_ routes: [Route]) {
        let _ = routes.map { mapper.map($0) }
        coraDataManager.saveContext(mapper.context)
    }
}
