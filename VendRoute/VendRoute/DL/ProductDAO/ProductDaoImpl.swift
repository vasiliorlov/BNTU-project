//
//  ProductDaoImpl.swift
//  VendRoute
//
//  Created by Vasili Orlov on 16/08/20.
//  Copyright © 2020 Vasili Orlov. All rights reserved.
//

import UIKit
import CoreData

class ProductDaoImpl: ProductDao {
    let coraDataManager: CoraDataManager
    let mapper: CoraMapper
    let context: NSManagedObjectContext
    
    init(coraDataManager: CoraDataManager, mapper: CoraMapper) {
        self.coraDataManager = coraDataManager
        self.mapper = mapper
        self.context = coraDataManager.persistentContainer.viewContext
    }
    
    //MARK: - ProductDao
    func getAll() -> [Product] {
        do {
            let fetchRequest = NSFetchRequest<CoreProduct>(entityName: "CoreProduct")
            let results = try context.fetch(fetchRequest)
            return results.compactMap{ mapper.map($0) }
        } catch {
            return []
        }
    }
    
    func save(_ products: [Product]) {
        let _ = products.uniqued(\.id).map { mapper.map($0) }
        coraDataManager.saveContext(mapper.context)
    }
    
    func removeBy(ids: [ProductId]) {
        let context = coraDataManager.persistentContainer.viewContext
        getCoreEntitiesBy(ids: ids).forEach {
            context.delete($0)
        }
        coraDataManager.saveContext()
    }
    
    //MARK: - Measure methods
    private func save(_ measures: [Measure]) {
        
    }

    
    //MARK: - private methods
    func getCoreEntitiesBy(ids: [ProductId]) -> [CoreProduct] {
        let context = coraDataManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreProduct")
        let predicate = NSPredicate(format: "id IN %@", ids)
        
        fetchRequest.predicate = predicate
        do {
            return try context.fetch(fetchRequest) as! [CoreProduct]
        } catch {
            return []
        }
    }
}
